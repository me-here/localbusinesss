import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapView extends StatelessWidget {
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

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(37.43296265331129, -122.08832357078792),
          zoom: 14,
        ),
        onMapCreated: (controller) {
          _controller.complete(controller);
        },
        markers: _markers,
      ),
    );
  }
}
