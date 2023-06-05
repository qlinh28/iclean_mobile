import 'package:flutter/material.dart';

class UpdateProfileTextField extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;
  final String text;
  final String? Function(dynamic value)? validator;

  const UpdateProfileTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    required this.text,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: TextFormField(
        style: TextStyle(
            fontFamily: 'Lato',
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.deepPurple.shade300),
        textAlign: TextAlign.left,
        maxLines: 1,
        controller: controller,
        validator: validator ??
            (value) {
              if (value == null || value.isEmpty) {
                return '$text';
              }
              return null;
            },
        obscureText: obscureText,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          filled: true,
          hintText: hintText,
          contentPadding: const EdgeInsets.fromLTRB(8, 0, 5, 0),
          labelStyle: TextStyle(
            color: Colors.grey[500],
            fontFamily: 'Lato',
          ),
          hintStyle: TextStyle(
            color: Colors.grey[500],
            fontFamily: 'Lato',
          ),
        ),
      ),
    );
  }
}
