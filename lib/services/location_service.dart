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
        return Future.error(tr('rides.location_denied'));
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
        tr('rides.location_denied_permanently'),
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
    print(distance);
    print("xvxajjgasjgajsga");
    return distance;
  }
}
