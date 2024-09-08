import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:pamfurred/components/globals.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:screenshot/screenshot.dart';
import 'package:path_provider/path_provider.dart';

class PinAddress extends StatefulWidget {
  const PinAddress({super.key});

  @override
  State<PinAddress> createState() => PinAddressState();
}

class PinAddressState extends State<PinAddress>
    with SingleTickerProviderStateMixin {
  String locationMessage = '';
  double? latitude;
  double? longitude;
  bool isLoading = true;
  LatLng? pinnedLocation;
  final ScreenshotController screenshotController = ScreenshotController();

  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    getLocation();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 30),
    );
    animation =
        Tween<double>(begin: 0.9, end: 1.0).animate(animationController);
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
      animationController.forward(from: 0.0); // Reset animation
    });
  }

  Future<String> saveScreenshot(Uint8List screenshotBytes) async {
    final directory = await getApplicationDocumentsDirectory();
    final path = directory.path;
    final file = File('$path/pinned_location.png');
    await file.writeAsBytes(screenshotBytes);
    return file.path;
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pin Address"),
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: () async {
              if (pinnedLocation != null) {
                final screenshotBytes = await screenshotController.capture();
                final imagePath = await saveScreenshot(screenshotBytes!);
                Navigator.pop(imagePath as BuildContext);
                // Navigator.pop(context, imagePath);
              }
            },
          ),
        ],
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : latitude != null && longitude != null
              ? Screenshot(
                  controller: screenshotController,
                  child: FlutterMap(
                    options: MapOptions(
                      initialCenter: LatLng(latitude!, longitude!),
                      initialZoom: 13.0,
                      minZoom: 5.0,
                      maxZoom: 18.0,
                      onTap: (tapPosition, point) => onTap(point),
                    ),
                    children: [
                      TileLayer(
                        urlTemplate:
                            'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                        userAgentPackageName: 'com.example.app',
                      ),
                      if (pinnedLocation != null)
                        MarkerLayer(
                          markers: [
                            Marker(
                                point: pinnedLocation!,
                                child: ScaleTransition(
                                  scale: animation,
                                  child: const Icon(
                                    Icons.location_on_rounded,
                                    size: 40,
                                    color: primaryColor,
                                  ),
                                )),
                          ],
                        ),
                    ],
                  ),
                )
              : Center(child: Text(locationMessage)),
      floatingActionButton: FloatingActionButton(
        onPressed: getLocation,
        child: const Icon(Icons.location_searching),
      ),
    );
  }
}
