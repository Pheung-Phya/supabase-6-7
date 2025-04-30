import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_6_7/common/widgets/input/t_text_form.dart';
import 'package:supabase_6_7/controllers/auth_controller.dart';
import 'package:supabase_6_7/utils/constant/t_sizes.dart';
import 'package:supabase_6_7/utils/constant/t_text.dart';

class TSignUpForm extends StatelessWidget {
  TSignUpForm({super.key});

  final controller = Get.find<AuthController>();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
          key: _formKey,
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TFormText(
                      controller: controller.firstNameController,
                      hintText: 'First Name',
                      label: 'First Name',
                      icon: Icons.person,
                    ),
                  ),
                  SizedBox(width: TSizes.spaceBtwItems),
                  Expanded(
                    child: TFormText(
                      controller: controller.lastNameController,
                      hintText: 'Last Name',
                      label: 'Last Name',
                      icon: Icons.person,
                    ),
                  ),
                ],
              ),
              SizedBox(height: TSizes.spaceBtwItems),
              TFormText(
                  controller: controller.emailController,
                  hintText: 'E-Mail',
                  label: 'E-Mail',
                  icon: Icons.email),
              SizedBox(height: TSizes.spaceBtwItems),
              TFormText(
                controller: controller.passwordController,
                hintText: 'Password',
                label: 'Password',
                icon: Icons.email,
                iconSuffix: Icons.remove_red_eye_rounded,
              ),
              SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      controller.signUp(
                          controller.emailController.text,
                          controller.passwordController.text,
                          controller.firstNameController.text,
                          controller.lastNameController.text);
                    }
                  },
                  child: Text(TText.createAccountButton),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
