import 'dart:convert';
import 'package:weather_app/weather.dart';
import 'package:http/http.dart' as http;

class NetworkHandler {
  String baseUrl = "https://api.openweathermap.org/data/2.5/weather";
  String api = "acffaf25c1a16d26bee08994c9f6997c";

  String getUrl(double lat, double lon) {
    return "$baseUrl?lat=$lat&lon=$lon&appid=$api&units=metric";
  }

  String cityUrl(String cityName) {
    return "$baseUrl?q=$cityName&appid=$api&units=metric";
  }

  Future<Weather> getWeatherFromGps(double lat, double lon) async {
    Weather _weather = Weather();

    try {
      var response = await http.get(getUrl(lat, lon));
      var result = jsonDecode(response.body);

      _weather.description = result["weather"][0]["description"];
      _weather.temperature = result["main"]["temp"].toString();
      _weather.wind = result["wind"]["speed"].toString();
      _weather.humid = result["main"]["humidity"].toString();
      _weather.locationName = result["name"];
      _weather.conditionImage = result["weather"][0]["icon"];
      return _weather;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<Weather> getWeatherFromCity(String cityName) async {
    Weather _weather = Weather();

    try {
      var response = await http.get(cityUrl(cityName));
      var result = jsonDecode(response.body);

      _weather.description = result["weather"][0]["description"];
      _weather.temperature = result["main"]["temp"].toString();
      _weather.wind = result["wind"]["speed"].toString();
      _weather.humid = result["main"]["humidity"].toString();
      _weather.locationName = result["name"];
      _weather.conditionImage = result["weather"][0]["icon"];
      return _weather;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
