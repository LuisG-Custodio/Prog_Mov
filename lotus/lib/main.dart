import 'package:flutter/material.dart';
import 'package:lotus/gradient_container.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: GradientContainer([
          Color.fromARGB(181, 9, 198, 255),
          Color.fromARGB(255, 5, 164, 244)
        ]),
      ),
    ),
  );
}
