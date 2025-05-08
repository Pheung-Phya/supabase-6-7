import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_6_7/services/auth_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthController extends GetxController {
  final AuthService _authService = AuthService();
  Rxn<User> currentUser = Rxn<User>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();

  @override
  void onInit() {
    super.onInit();

    _authService.authStateChanges.listen((authState) {
      currentUser.value = authState.session?.user;
    });

    currentUser.value = _authService.currentUser;
  }

  @override
  void dispose() {
    print('============================================');

    emailController.dispose();
    passwordController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    super.dispose();
  }

  Future<void> signUp(
      String email, String password, String firstName, String lastName) async {
    try {
      await _authService.signUp(
          email: email,
          password: password,
          firstName: firstName,
          lastName: lastName);
      Get.snackbar("Success", "Account created");
      Get.offAllNamed('/navigate');
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  Future<void> signIn(String email, String password) async {
    try {
      await _authService.signIn(email: email, password: password);
      Get.snackbar("Success", "Signed in");
      Get.offAllNamed('/navigate');
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  Future<void> signOut() async {
    try {
      await _authService.signOut();
      Get.snackbar("Success", "Signed out");
      clearFormFields();
      Get.offAllNamed('/login');
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

  void clearFormFields() {
    emailController.clear();
    passwordController.clear();
    firstNameController.clear();
    lastNameController.clear();
  }
}
