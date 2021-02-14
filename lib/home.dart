import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/city_screen.dart';
import 'package:weather_app/weather.dart';

class Home extends StatefulWidget {
  final Weather weather;
  Home({this.weather});
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String description = "";
  String conditionImage = "";
  String temperature = "";
  String wind = "";
  String humid = "";
  String locationName = "";

  @override
  void initState() {
    updateUI(widget.weather);
    weatherImage();
    super.initState();
  }

  void updateUI(Weather weather) {
    setState(() {
      description = weather.description;
      conditionImage = weather.conditionImage;
      temperature = weather.temperature;
      wind = weather.wind;
      humid = weather.humid;
      locationName = weather.locationName;
    });
  }

  void weatherImage() {
    setState(() {});
    if (conditionImage == "01n") {
      conditionImage = "images/027-moon.png";
    } else if (conditionImage == "01d") {
      conditionImage = "images/026-sun.png";
    } else if (conditionImage == "02d") {
      conditionImage = "images/028-cloudy.png";
    } else if (conditionImage == "02n") {
      conditionImage = "images/021-clouds.png";
    } else if (conditionImage == "03n" || conditionImage == "03d") {
      conditionImage = "images/021-clouds.png";
    } else if (conditionImage == "04n" || conditionImage == "04d") {
      conditionImage = "images/021-clouds.png";
    } else if (conditionImage == "09n" || conditionImage == "09d") {
      conditionImage = "images/025-rain.png";
    } else if (conditionImage == "10d") {
      conditionImage = "images/002-rain.png";
    } else if (conditionImage == "10d") {
      conditionImage = "images/003-rain.png";
    } else if (conditionImage == "11d") {
      conditionImage = "images/05-storm.png";
    } else if (conditionImage == "11n") {
      conditionImage = "images/06-storm.png";
    } else if (conditionImage == "13n" || conditionImage == "13d") {
      conditionImage = "images/019-thermometer.png";
    } else if (conditionImage == "50n" || conditionImage == "50n") {
      conditionImage = "images/018-thermometer.png";
    }
  }

  Weather weather = Weather();

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 230, 153, 102),
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "$description",
                  style: TextStyle(fontSize: 32, color: Colors.white),
                ),
                IconButton(
                  icon: Icon(Icons.map, color: Colors.white, size: 30),
                  onPressed: () async {
                    var _weatherData = await Navigator.push(context,
                        MaterialPageRoute(builder: (context) => CityScreen()));
                    if (_weatherData != null) {
                      updateUI(_weatherData);
                    }
                  },
                ),
              ],
            ),
          ),
          Expanded(
              flex: 3,
              child: Image(
                image: AssetImage(
                  conditionImage,
                ),
                width: MediaQuery.of(context).size.width / 2,
                height: MediaQuery.of(context).size.height / 2,
              )),
          Expanded(
              child: Column(
            children: [
              Row(
                children: [
                  Icon(
                    Icons.location_on,
                    size: 35,
                    color: Colors.white,
                  ),
                  Text(
                    "$locationName",
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 35, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "$temperature",
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Card(
                      elevation: 10,
                      child: Center(
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Wind",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w200),
                              ),
                              Text(
                                "$wind",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                          height: MediaQuery.of(context).size.height / 10,
                          width: MediaQuery.of(context).size.width / 5,
                        ),
                      ),
                    ),
                    Card(
                      elevation: 10,
                      child: Center(
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Humid",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w200),
                              ),
                              Text(
                                "$humid" + "%",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                          height: MediaQuery.of(context).size.height / 10,
                          width: MediaQuery.of(context).size.width / 5,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
        ],
      )),
    );
  }
}
