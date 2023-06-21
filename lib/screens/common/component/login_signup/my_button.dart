import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  final Function()? onTap;

  const MyButton({Key? key, required this.text, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
            color: Colors.deepPurple.shade400,
            borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontFamily: 'Lato',
            ),
          ),
        ),
      ),
    );
  }
}
