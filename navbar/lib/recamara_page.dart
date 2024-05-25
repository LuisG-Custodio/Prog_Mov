import 'package:flutter/material.dart';
import 'package:navbar/home_page.dart';

class RecamaraPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recamara Page'),
      ),
      drawer: HomePage().createDrawer(context),
      body: Center(child: Text('Welcome to to to the Recamara Page!')),
    );
  }
}
