import 'package:flutter/material.dart';

class SquareTile extends StatelessWidget {
  final String imagePath;

  const SquareTile({Key? key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(7),
      child: Image.asset(
        imagePath,
        height: 48,
      ),
    );
  }
}
