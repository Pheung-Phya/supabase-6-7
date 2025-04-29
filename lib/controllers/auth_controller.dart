import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_6_7/features/auth/screens/login/login_screen.dart';
import 'package:supabase_6_7/navigate_menu.dart';
import 'package:supabase_6_7/services/auth_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.put(AuthController());

  final AuthService _authService = AuthService();
  Rxn<User> currentUser = Rxn<User>();
  final formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void onInit() {
    super.onInit();

    _authService.authStateChanges.listen((authState) {
      currentUser.value = authState.session?.user;
    });

    currentUser.value = _authService.currentUser;
  }

  Future<void> signUp(String email, String password) async {
    try {
      await _authService.signUp(email: email, password: password);
      Get.snackbar("Success", "Account created");
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  Future<void> signIn(String email, String password) async {
    try {
      await _authService.signIn(email: email, password: password);
      Get.snackbar("Success", "Signed in");
      Get.offAll(NavigateMenu());
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  Future<void> signOut() async {
    try {
      await _authService.signOut();
      Get.snackbar("Success", "Signed out");
      Get.offAll(LoginScreen());
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  Future<void> resetPassword(String email) async {
    try {
      await _authService.resetPassword(email);
      Get.snackbar("Success", "Reset link sent");
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  Future<void> updateEmail(String newEmail) async {
    try {
      await _authService.updateEmail(newEmail);
      Get.snackbar("Success", "Email updated");
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  Future<void> updatePassword(String newPassword) async {
    try {
      await _authService.updatePassword(newPassword);
      Get.snackbar("Success", "Password updated");
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  // Future<void> signInWithGoogle() async {
  //   try {
  //     await _authService.signInWithProvider(Provider.google);
  //   } catch (e) {
  //     Get.snackbar("Error", e.toString());
  //   }
  // }
}
