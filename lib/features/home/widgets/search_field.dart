import 'dart:ffi';

import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  final VoidCallback press;
  final Function(String) onFieldSubmitted;
  const SearchField({Key? key, required this.press, required this.onFieldSubmitted}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onFieldSubmitted: onFieldSubmitted,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.only(top: 10),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(7),
          ),
          borderSide: BorderSide.none,
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(7),
          ),
          borderSide: BorderSide(color: Colors.black26, width: 1),
        ),
        hintText: 'Search in Amazon',
        hintStyle: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 17
        ),
        prefixIcon: InkWell(
          onTap: press,
          child: const Padding(
            padding: EdgeInsets.only(left: 6),
            child: Icon(
              Icons.search,
              color: Colors.black,
              size: 25,
            ),
          ),
        ),
      ),
    );
  }
}
