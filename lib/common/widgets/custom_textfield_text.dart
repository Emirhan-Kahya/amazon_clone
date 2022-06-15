import 'package:flutter/material.dart';

class CustomTextFieldText extends StatelessWidget {
  final String text;
  const CustomTextFieldText({Key? key, required this.text,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),);
  }
}
