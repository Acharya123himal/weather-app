import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_app/services/location_handler.dart';
import 'package:weather_app/services/network_handler.dart';
import 'package:weather_app/weather.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/home.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    requestWeather();
    super.initState();
  }

  void requestWeather() async {
    try {
      LocationHandler _locationHandler = LocationHandler();
      Position _position = await _locationHandler.getUserPosition();
      NetworkHandler _networkHandler = NetworkHandler();

      Weather _weather = await _networkHandler.getWeatherFromGps(
          _position.latitude, _position.longitude);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Home(weather: _weather),
        ),
      );
    } catch (e) {
      print(e.toString());
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Loading !!",
            style: TextStyle(
                fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          SpinKitFadingCircle(
            itemBuilder: (BuildContext context, int index) {
              return DecoratedBox(
                decoration: BoxDecoration(
                  color: index.isEven ? Colors.red : Colors.green,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
