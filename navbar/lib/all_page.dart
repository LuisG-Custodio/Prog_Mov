import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'home_page.dart';

class AllPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<String> imgList = [
      'https://via.placeholder.com/600x400.png?text=Image+1',
      'https://via.placeholder.com/600x400.png?text=Image+2',
      'https://via.placeholder.com/600x400.png?text=Image+3',
      'https://via.placeholder.com/600x400.png?text=Image+4',
      'https://via.placeholder.com/600x400.png?text=Image+5',
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
              height: 400.0,
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
                      child: Center(
                          child: Image.network(item,
                              fit: BoxFit.cover, width: 1000)),
                    ))
                .toList(),
          ),
          Center(
            child: Text('Welcome to the All Page!'),
          ),
        ],
      ),
    );
  }
}
