import 'package:flutter/material.dart';
import 'package:supabase_6_7/common/widgets/input/t_text_form.dart';
import 'package:supabase_6_7/utils/constant/t_sizes.dart';

class TSignUpForm extends StatelessWidget {
  const TSignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TFormText(
                  hintText: 'First Name',
                  label: 'First Name',
                  icon: Icons.person,
                ),
              ),
              SizedBox(width: TSizes.spaceBtwItems),
              Expanded(
                child: TFormText(
                  hintText: 'Last Name',
                  label: 'Last Name',
                  icon: Icons.person,
                ),
              ),
            ],
          ),
          SizedBox(height: TSizes.spaceBtwItems),
          TFormText(hintText: 'E-Mail', label: 'E-Mail', icon: Icons.email),
          SizedBox(height: TSizes.spaceBtwItems),
          TFormText(
            hintText: 'Password',
            label: 'Password',
            icon: Icons.email,
            iconSuffix: Icons.remove_red_eye_rounded,
          ),
        ],
      ),
    );
  }
}
