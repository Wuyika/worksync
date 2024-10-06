import 'package:easy_localization/easy_localization.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

class LocationService {
  Future<bool?> requestPermission() async {
    LocationPermission permission;
    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error(tr('Access denied for location'));
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // await Geolocator.openAppSettings();
      return Future.error(
        tr('Access denied permanently location'),
      );
    }

    if (permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse) {
      return true;
    }
    return false;
  }

  Future<bool> isServiceEnabled() async {
    final bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (serviceEnabled == true) {
      return true;
    }
    return false;
  }

  Future<LatLng?> determineCurrentPosition() async {
    final position = await Geolocator.getCurrentPosition();
    final LatLng myCurrentPosition =
        LatLng(position.latitude, position.longitude);
    return myCurrentPosition;
  }

  Future<double?> calculateCoordinateDistance({
    required LatLng startCoordinate,
    required LatLng endCoordinate,
  }) async {
    final distance = Geolocator.distanceBetween(
      startCoordinate.latitude,
      startCoordinate.longitude,
      endCoordinate.latitude,
      endCoordinate.longitude,
    );
    return distance;
  }
}
