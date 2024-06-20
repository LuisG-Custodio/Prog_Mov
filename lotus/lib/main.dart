import 'package:flutter/material.dart';
import 'package:lotus/gradient_container.dart';
import 'package:lotus/service/database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Database_LOTTUS().database;

  runApp(
    MaterialApp(
      home: Scaffold(
        body: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientContainer([
      Color.fromARGB(8, 9, 198, 255),
      Color.fromARGB(36, 5, 164, 244),
    ]);
  }
}
