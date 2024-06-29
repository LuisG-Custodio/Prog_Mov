import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'register_screen.dart';
import 'success_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tryout',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
      routes: {
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
        '/success': (context) => SuccessScreen(),
      },
    );
  }
}
