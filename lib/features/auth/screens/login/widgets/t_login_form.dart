import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_6_7/features/auth/controllers/auth_controller.dart';
import 'package:supabase_6_7/features/auth/screens/sign_up/sign_up_screen.dart';
import 'package:supabase_6_7/utils/constant/t_sizes.dart';
import 'package:supabase_6_7/utils/constant/t_text.dart';

class TLoginForm extends StatelessWidget {
  TLoginForm({super.key});

  final controller = Get.find<AuthController>();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
        child: Column(
          children: [
            TextFormField(
              controller: controller.emailController,
              validator: (value) {
                if (value != null && value.isEmail) {
                  return null;
                }
                return "Valid email is required";
              },
              decoration: InputDecoration(hintText: TText.email),
            ),
            SizedBox(height: TSizes.spaceBtwItems),
            TextFormField(
              controller: controller.passwordController,
              obscureText: true,
              validator: (value) {
                if (value == null || value.length < 6) {
                  return "Password must be at least 6 characters";
                }
                return null;
              },
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
                const Spacer(),
                TextButton(onPressed: () {}, child: Text(TText.forgotPassword)),
              ],
            ),
            SizedBox(height: TSizes.spaceBtwItems),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    controller.signIn(
                      controller.emailController.text.trim(),
                      controller.passwordController.text.trim(),
                    );
                  }
                },
                child: Text(TText.signInButton),
              ),
            ),
            SizedBox(height: TSizes.spaceBtwItems),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () => Get.to(() => SignUpScreen()),
                child: Text(TText.createAccountButton),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
