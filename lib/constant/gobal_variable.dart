// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

class BaseConfig {
  static const Color BASE_COLOR = Color.fromARGB(1000, 155, 85, 255);
  static const Color BASE_BRIGHT_COLOR = Color.fromARGB(1000, 244, 236, 255);
  static const LinearGradient myGradient = LinearGradient(
    colors: [
      Color.fromARGB(1000, 155, 85, 255),
      Color.fromARGB(1000, 122, 29, 255)
    ],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
}
