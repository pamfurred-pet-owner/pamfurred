import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:pamfurred/components/custom_appbar.dart';
import 'package:pamfurred/components/globals.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';

class PinAddress extends StatefulWidget {
  const PinAddress({super.key});

  @override
  State<PinAddress> createState() => PinAddressState();
}

class PinAddressState extends State<PinAddress> {
  String locationMessage = '';
  double? latitude;
  double? longitude;
  bool isLoading = true;
  LatLng? pinnedLocation;

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  Future<void> getLocation() async {
    var status = await Permission.location.request();
    if (status.isGranted) {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
      setState(() {
        latitude = position.latitude;
        longitude = position.longitude;
        isLoading = false;
      });
    } else {
      setState(() {
        locationMessage = status.isDenied
            ? 'Location permission denied'
            : 'Location permission permanently denied. Open settings to allow permission.';
        openAppSettings();
        isLoading = false;
      });
    }
  }

  void onTap(LatLng tappedPoint) {
    setState(() {
      pinnedLocation = tappedPoint;
      latitude = tappedPoint.latitude;
      longitude = tappedPoint.longitude;
      locationMessage =
          'Pinned Location: Latitude: ${tappedPoint.latitude}, Longitude: ${tappedPoint.longitude}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBarWithTitle(context, "Pin address"),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : latitude != null && longitude != null
              ? FlutterMap(
                  options: MapOptions(
                    initialCenter: LatLng(latitude!, longitude!),
                    initialZoom: 13.0,
                    minZoom: 5.0,
                    maxZoom: 18.0,
                    interactionOptions: const InteractionOptions(
                        pinchMoveWinGestures: MultiFingerGesture.pinchZoom),
                    onTap: (tapPosition, point) => onTap(point), // Handle tap
                  ),
                  children: [
                    TileLayer(
                      urlTemplate:
                          'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                      userAgentPackageName: 'com.example.app',
                    ),
                    RichAttributionWidget(
                      attributions: [
                        TextSourceAttribution(
                          'OpenStreetMap contributors',
                          onTap: () => launchUrl(
                              Uri.parse('https://openstreetmap.org/copyright')),
                        ),
                      ],
                    ),
                    if (pinnedLocation != null) // Show marker if pinned
                      MarkerLayer(
                        markers: [
                          Marker(
                            point: pinnedLocation!,
                            child: const Icon(
                              Icons.location_on_rounded,
                              size: 40,
                              color: primaryColor,
                            ),
                          ),
                        ],
                      ),
                  ],
                )
              : Center(child: Text(locationMessage)),
      floatingActionButton: FloatingActionButton(
        onPressed: getLocation,
        child: const Icon(Icons.location_searching),
      ),
    );
  }
}
