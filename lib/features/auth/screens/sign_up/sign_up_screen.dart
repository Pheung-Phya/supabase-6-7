import 'package:flutter/material.dart';
import 'package:supabase_6_7/common/widgets/text/t_header_auth.dart';
import 'package:supabase_6_7/features/auth/screens/sign_up/widget/t_sign_up_form.dart';
import 'package:supabase_6_7/utils/constant/t_sizes.dart';
import 'package:supabase_6_7/utils/constant/t_text.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 10,
            left: 12,
            right: 12,
            bottom: 10,
          ),
          child: Column(
            children: [
              THeaderAuth(title: TText.headerCreateAccont),
              SizedBox(height: TSizes.spaceBtwSections),
              TSignUpForm(),
            ],
          ),
        ),
      ),
    );
  }
}
