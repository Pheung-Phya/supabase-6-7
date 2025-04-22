import 'package:flutter/material.dart';
import 'package:supabase_6_7/utils/constant/t_text.dart';

class THeaderLogin extends StatelessWidget {
  const THeaderLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          TText.headSignInTitle,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ],
    );
  }
}
