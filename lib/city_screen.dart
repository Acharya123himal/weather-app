import 'package:flutter/material.dart';
import 'package:weather_app/services/network_handler.dart';
import 'package:weather_app/weather.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String _cityName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 230, 153, 102),
      appBar: AppBar(
        title: Text("City"),
        backgroundColor: Color.fromARGB(255, 230, 153, 102),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Container(
          child: Column(
            children: [
              TextField(
                style: TextStyle(
                  color: Colors.white,
                ),
                onChanged: (value) {
                  _cityName = value;
                },
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white10,
                    labelText: "Location",
                    hintText: "Enter Location",
                    suffixIcon: IconButton(
                      onPressed: () async {
                        if (_cityName != null && _cityName.isNotEmpty) {
                          Weather _weather = await NetworkHandler()
                              .getWeatherFromCity(_cityName);
                          Navigator.pop(context, _weather);
                        } else {
                          print("CityName is empty");
                        }
                      },
                      icon: Icon(
                        Icons.done,
                        size: 25,
                      ),
                      color: Colors.blueAccent,
                    ),
                    icon: Icon(
                      Icons.location_on,
                      color: Colors.blueAccent,
                      size: 25,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)))),
              )
            ],
          ),
        ),
      ),
    );
  }
}
