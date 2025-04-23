import 'package:flutter/material.dart';

class TLogoButton extends StatelessWidget {
  const TLogoButton({super.key, required this.image});

  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.blue),
      ),
      child: Image(image: AssetImage(image), fit: BoxFit.fill),
    );
  }
}
