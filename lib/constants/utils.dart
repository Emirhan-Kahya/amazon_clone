import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String text, {Color color = Colors.red}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: Duration(milliseconds: 1250),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: color.withOpacity(0.8),
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height - 150,
          right: 20,
          left: 20),
      content: Text(text, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
    ),
  );
}
