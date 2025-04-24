import 'package:flutter/material.dart';

class TFormText extends StatelessWidget {
  const TFormText({
    super.key,
    required this.label,
    required this.hintText,
    required this.icon,
    this.iconSuffix,
  });
  final String label;
  final String hintText;
  final IconData icon;
  final IconData? iconSuffix;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        label: Text(label),
        hintText: hintText,
        prefixIcon: Icon(icon),
        suffixIcon: Icon(iconSuffix),
      ),
    );
  }
}
