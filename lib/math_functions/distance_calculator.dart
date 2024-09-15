import 'package:geolocator/geolocator.dart';

String calculateDistance(latitude, longitude) {
  // Replace these with pet owner coordinates
  double myLat = 37.7749;
  double myLon = -122.4194;

  // Replace these with pet owner coordinates
  double targetLat = latitude;
  double targetLon = longitude;

  double distanceInMeters =
      Geolocator.distanceBetween(myLat, myLon, targetLat, targetLon);
  double distanceInKilometers = distanceInMeters / 1000;
  String roundedDistance = distanceInKilometers.toStringAsFixed(1);

  return ('$roundedDistance km');
}
