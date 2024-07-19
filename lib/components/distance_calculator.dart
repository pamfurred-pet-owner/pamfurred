import 'package:geolocator/geolocator.dart';

String calculateDistance() {
  // Replace these with pet owner coordinates
  double myLat = 37.7749;
  double myLon = -122.4194;

  // Replace these with pet owner coordinates
  double targetLat = 34.0522;
  double targetLon = -118.2437;

  double distanceInMeters =
      Geolocator.distanceBetween(myLat, myLon, targetLat, targetLon);
  double distanceInKilometers = distanceInMeters / 1000;
  String roundedDistance = distanceInKilometers.toStringAsFixed(1);

  return ('$roundedDistance km');
}
