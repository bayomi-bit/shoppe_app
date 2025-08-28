import 'package:location/location.dart';

class LocationService {
  Location location = Location();

  Future<void> serviceEnable() async {
    bool isServiceEnabled = await location.serviceEnabled();
    if (!isServiceEnabled) {
      await location.requestService();
    }
    if (!isServiceEnabled) {
      throw Exception('Location service is not enabled');
    }
  }

  Future requestPermission() async {
    PermissionStatus permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
    }
    if (permissionGranted == PermissionStatus.deniedForever) {
      throw Exception('Location permission is denied  forever');
    }
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        throw Exception('Location permission is denied');
      }
    }
  }

  Future getCurrentLocation() async {
    await serviceEnable();
    await requestPermission();
    return await location.getLocation();
  }
}
