import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

class MapView extends StatefulWidget {
  @override
  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  final Completer<GoogleMapController> _controller = Completer();

  final Set<Marker> _markers = {
    Marker(
      markerId: MarkerId("Joe's coffee"),
      position: LatLng(37.4, -122.08832357078792),
    ),
    Marker(
      markerId: MarkerId("Beth's Hair Salon"),
      position: LatLng(37.4, -122.0889),
    ),
    Marker(
      markerId: MarkerId("Joe's coffee"),
      position: LatLng(37.3, -122.08832357078792),
    ),
    Marker(
      markerId: MarkerId("Joe's coffee"),
      position: LatLng(37.1, -122.08832357078792),
    ),
    Marker(
      markerId: MarkerId("Joe's coffee"),
      position: LatLng(37.3, -122.09),
    ),
  };

  final Set<Circle> _circles = {
    Circle(
      circleId: CircleId("Search Radius"),
      center: LatLng(37.4, -122.08832357078792),
      visible: true,
      radius: 100,
    ),
  };

  Future<void> ensureLocationPermission() async {
    if (await Permission.location.request().isGranted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    ensureLocationPermission();
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: GoogleMap(
        myLocationEnabled: true,
        myLocationButtonEnabled: false,
        initialCameraPosition: CameraPosition(
          target: LatLng(37.43296265331129, -122.08832357078792),
          zoom: 14,
        ),
        onMapCreated: (controller) {
          _controller.complete(controller);
        },
        markers: _markers,
        onTap: (LatLng pos) {
          print("pressed $pos");
        },
        circles: _circles,
      ),
    );
  }
}
