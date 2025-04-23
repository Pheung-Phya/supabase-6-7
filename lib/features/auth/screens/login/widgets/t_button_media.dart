import 'package:flutter/material.dart';
import 'package:supabase_6_7/common/widgets/button/t_logo_button.dart';
import 'package:supabase_6_7/utils/constant/t_images.dart';
import 'package:supabase_6_7/utils/constant/t_sizes.dart';

class TButtonMedia extends StatelessWidget {
  const TButtonMedia({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TLogoButton(image: TImages.logoGoogle),
        SizedBox(width: TSizes.spaceBtwItems),
        TLogoButton(image: TImages.logoFacebook),
      ],
    );
  }
}
