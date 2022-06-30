import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback press;
  final Color? color;
  const CustomButton({
    Key? key,
    required this.text,
    required this.press,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: press,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.maxFinite, 50),
        primary: color,
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 18, color: color == null ? Colors.white : Colors.black),
      ),
    );
  }
}
