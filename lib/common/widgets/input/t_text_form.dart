import 'package:flutter/material.dart';

class TFormText extends StatelessWidget {
  const TFormText({
    super.key,
    required this.label,
    required this.hintText,
    required this.icon,
    this.controller,
    this.iconSuffix,
  });
  final String label;
  final String hintText;
  final IconData icon;
  final IconData? iconSuffix;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value!.isNotEmpty) {
          return null;
        }
        return "field is required";
      },
      controller: controller,
      decoration: InputDecoration(
        label: Text(label),
        hintText: hintText,
        prefixIcon: Icon(icon),
        suffixIcon: Icon(iconSuffix),
      ),
    );
  }
}
