import 'package:flutter/material.dart';
import 'package:supabase_6_7/features/auth/screens/login/widgets/t_header_login.dart';
import 'package:supabase_6_7/features/auth/screens/login/widgets/t_login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 50,
            left: 12,
            right: 12,
            bottom: 10,
          ),
          child: Column(
            children: [
              /// - Header
              THeaderLogin(),

              /// - Form Login
              TLoginForm(),
            ],
          ),
        ),
      ),
    );
  }
}
