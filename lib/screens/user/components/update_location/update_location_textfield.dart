import 'package:flutter/material.dart';

class UpdateLocationTextField extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;
  final String text;
  final String? Function(dynamic value)? validator;

  const UpdateLocationTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    required this.text,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: TextFormField(
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
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          filled: true,
          hintText: hintText,
          contentPadding: const EdgeInsets.fromLTRB(10, 8, 10, 8),
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
