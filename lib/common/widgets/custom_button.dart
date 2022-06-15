import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback press;
  const CustomButton({
    Key? key,
    required this.text,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: press,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.maxFinite, 50),
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}
