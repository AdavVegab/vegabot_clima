import 'package:geolocator/geolocator.dart';

class Location {
  Location({this.latitude, this.longitude});
  double latitude;
  double longitude;
  Future<void> getCurrentLocation() async {
    try {
      Position position = await getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low,
          timeLimit: Duration(seconds: 30));
      latitude = position.latitude;
      print('lat=$latitude');
      longitude = position.longitude;
      print('lon=$longitude');
    } catch (e) {
      print(e);
    }
  }
}
