import 'package:geolocator/geolocator.dart';

class LocationHandler {
  Future<Position> getUserPosition() async {
    return await Geolocator.getCurrentPosition();
  }
}
