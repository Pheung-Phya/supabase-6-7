// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:supabase_6_7/utils/constant/t_text.dart';

class THeaderAuth extends StatelessWidget {
  const THeaderAuth({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [Text(title, style: Theme.of(context).textTheme.headlineLarge)],
    );
  }
}
