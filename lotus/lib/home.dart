import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<String> imgList = [
      'assets/images/mueble_1.jpg',
      'assets/images/mueble_2.jpg',
      'assets/images/mueble_3.jpg',
      'assets/images/mueble_4.jpg',
      'assets/images/mueble_5.jpg'
    ];

    return Scaffold(
      backgroundColor: Colors.transparent, // Set background to transparent
      appBar: AppBar(
        title: Text('LOTTUS'),
      ),
      drawer: createDrawer(context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CarouselSlider(
            options: CarouselOptions(
              height: 300.0, // Adjust carousel height as needed
              enlargeCenterPage: true,
              autoPlay: true,
              aspectRatio: 16 / 9,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              pauseAutoPlayOnTouch: true,
              viewportFraction: 0.8,
            ),
            items: imgList
                .map((item) => Container(
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        child: Image.asset(
                          item,
                          fit: BoxFit.cover, // Adjust image fit as needed
                        ),
                      ),
                    ))
                .toList(),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Welcome to the Home Page!',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Drawer createDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('Mall Menu'),
          ),
          ListTile(
            leading: Icon(Icons.store),
            title: Text("Electronics"),
            onTap: () {
              Navigator.pop(context);
              // Navigate to electronics department screen ('/electronics' route)
              Navigator.pushNamed(context, '/electronics');
            },
          ),
          ListTile(
            leading: Icon(Icons.store),
            title: Text("Fashion"),
            onTap: () {
              Navigator.pop(context);
              // Navigate to fashion department screen ('/fashion' route)
              Navigator.pushNamed(context, '/fashion');
            },
          ),
          ListTile(
            leading: Icon(Icons.store),
            title: Text("Home & Garden"),
            onTap: () {
              Navigator.pop(context);
              // Navigate to home & garden department screen ('/home_garden' route)
              Navigator.pushNamed(context, '/home_garden');
            },
          ),
          ListTile(
            leading: Icon(Icons.store),
            title: Text("Sports"),
            onTap: () {
              Navigator.pop(context);
              // Navigate to sports department screen ('/sports' route)
              Navigator.pushNamed(context, '/sports');
            },
          ),
          ListTile(
            leading: Icon(Icons.store),
            title: Text("Books & Stationery"),
            onTap: () {
              Navigator.pop(context);
              // Navigate to books & stationery department screen ('/books_stationery' route)
              Navigator.pushNamed(context, '/books_stationery');
            },
          ),
        ],
      ),
    );
  }
}
