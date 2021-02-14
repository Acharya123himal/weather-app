import 'package:flutter/material.dart';
import 'package:weather_app/home.dart';
import 'package:weather_app/splash_screen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: "splash",
    routes: {
      "/": (context) => Home(),
      "splash": (context) => SplashScreen(),
    },
  ));
}