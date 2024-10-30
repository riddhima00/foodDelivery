import 'package:flutter/material.dart';
import 'package:fooddelivery/homescreen.dart';
import 'package:fooddelivery/restaurantview.dart';
import 'package:fooddelivery/cartscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class MyHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Food Delivery App'),
        backgroundColor: Colors.white,
      ),
      body: HomeScreen(),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
