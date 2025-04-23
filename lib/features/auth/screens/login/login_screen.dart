import 'package:flutter/material.dart';
import 'package:supabase_6_7/features/auth/screens/login/widgets/t_button_media.dart';
import 'package:supabase_6_7/features/auth/screens/login/widgets/t_header_login.dart';
import 'package:supabase_6_7/features/auth/screens/login/widgets/t_login_form.dart';
import 'package:supabase_6_7/utils/constant/t_sizes.dart';
import 'package:supabase_6_7/utils/constant/t_text.dart';

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
              SizedBox(height: TSizes.spaceBtwSections),

              /// - Form Login
              TLoginForm(),
              SizedBox(height: TSizes.spaceBtwSections),
              Row(
                children: [
                  Expanded(child: Divider(indent: 30, endIndent: 5)),
                  Text(
                    TText.orSignInWith,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  Expanded(child: Divider(indent: 5, endIndent: 30)),
                ],
              ),

              SizedBox(height: TSizes.spaceBtwSections),
              TButtonMedia(),
            ],
          ),
        ),
      ),
    );
  }
}
