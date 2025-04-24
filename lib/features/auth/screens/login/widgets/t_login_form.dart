import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_6_7/features/auth/screens/sign_up/sign_up_screen.dart';
import 'package:supabase_6_7/utils/constant/t_sizes.dart';
import 'package:supabase_6_7/utils/constant/t_text.dart';

class TLoginForm extends StatelessWidget {
  const TLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
        child: Column(
          children: [
            TextFormField(decoration: InputDecoration(hintText: TText.email)),
            SizedBox(height: TSizes.spaceBtwItems),
            TextFormField(
              decoration: InputDecoration(hintText: TText.passworld),
            ),
            SizedBox(height: TSizes.spaceBtwItems / 2),
            Row(
              children: [
                Checkbox(value: true, onChanged: (value) {}),
                Text(
                  TText.rememberMe,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Spacer(),
                TextButton(onPressed: () {}, child: Text(TText.forgotPassword)),
              ],
            ),
            SizedBox(height: TSizes.spaceBtwItems),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(TText.signInButton),
              ),
            ),
            SizedBox(height: TSizes.spaceBtwItems),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () => Get.to(SignUpScreen()),
                child: Text(TText.createAccountButton),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
