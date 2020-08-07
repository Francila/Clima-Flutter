import 'package:geolocator/geolocator.dart';

class Location {
  double latitude;
  double longitude;

  Location() {
    getCurrentLocation();
  }

  Future<void> getCurrentLocation() async {
    try {
      Position p = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      latitude = p.latitude;
      longitude = p.longitude;
    } catch (e) {
      print(e);
    }
  }
}
