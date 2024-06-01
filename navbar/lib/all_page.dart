import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'home_page.dart';

class AllPage extends StatelessWidget {
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
      appBar: AppBar(
        title: Text('All Page'),
      ),
      drawer: HomePage().createDrawer(context),
      body: Column(
        children: <Widget>[
          CarouselSlider(
            options: CarouselOptions(
              height: 300.0, // Ajusta la altura del carrusel si es necesario
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
                          fit: BoxFit.contain, // Cambia el ajuste de la imagen
                          width: 800, // Ajusta el ancho de la imagen
                        ),
                      ),
                    ))
                .toList(),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Welcome to the All Page!',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
