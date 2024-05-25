import 'package:flutter/material.dart';
import 'cocina_page.dart';
import 'all_page.dart';
import 'lb_page.dart';
import 'recamara_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      drawer: createDrawer(context),
      body: Center(child: Text('Welcome to the Home Page!')),
    );
  }

  Drawer createDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('Menu'),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Home"),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.store),
            title: Text("Todo"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AllPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.kitchen),
            title: Text("Linea Blanca"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LBPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.bed),
            title: Text("Recamara"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RecamaraPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.soup_kitchen),
            title: Text("Cocina"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CocinaPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
