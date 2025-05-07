import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  final SupabaseClient _client = Supabase.instance.client;

  Future<AuthResponse> signUp(
      {required String email,
      required String password,
      required String firstName,
      required String lastName}) {
    return _client.auth.signUp(email: email, password: password, data: {
      "name": "$firstName $lastName",
    });
  }

  Future<AuthResponse> signIn({
    required String email,
    required String password,
  }) {
    return _client.auth.signInWithPassword(email: email, password: password);
  }

  Future<void> signOut() => _client.auth.signOut();

  User? get currentUser => _client.auth.currentUser;

  Stream<AuthState> get authStateChanges => _client.auth.onAuthStateChange;

  Future<void> resetPassword(String email) {
    return _client.auth.resetPasswordForEmail(email);
  }

  Future<UserResponse> updateEmail(String newEmail) {
    return _client.auth.updateUser(UserAttributes(email: newEmail));
  }

  Future<UserResponse> updatePassword(String newPassword) {
    return _client.auth.updateUser(UserAttributes(password: newPassword));
  }

  // // OAuth Sign In (e.g., Google)
  // Future<void> signInWithProvider(Provider provider) async {
  //   await _client.auth.signInWithOAuth(provider);
  // }
}
