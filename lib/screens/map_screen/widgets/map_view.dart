import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:location/location.dart';
import '../map_provider.dart';

class MapView extends StatefulWidget {
  @override
  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  final Completer<GoogleMapController> _controller = Completer();

  final Set<Marker> _markers = {
    // Marker(
    //   markerId: MarkerId("Joe's coffee"),
    //   position: LatLng(37.4, -122.08832357078792),
    // ),
    // Marker(
    //   markerId: MarkerId("Beth's Hair Salon"),
    //   position: LatLng(37.4, -122.0889),
    // ),
    // Marker(
    //   markerId: MarkerId("Joe's coffee"),
    //   position: LatLng(37.3, -122.08832357078792),
    // ),
    // Marker(
    //   markerId: MarkerId("Joe's coffee"),
    //   position: LatLng(37.1, -122.08832357078792),
    // ),
    // Marker(
    //   markerId: MarkerId("Joe's coffee"),
    //   position: LatLng(37.3, -122.09),
    // ),
  };

  Future<void> ensureLocationPermission() async {
    if (await Permission.location.request().isGranted) {
      setState(() {});
    }
  }

  Future<void> getLocation() async {
    LocationData loc = await Location.instance.getLocation();
    return LatLng(loc.latitude, loc.longitude);
  }

  LatLng location = LatLng(37.4, -122.08832357078792);

  @override
  void initState() {
    super.initState();
    Location.instance.onLocationChanged.listen((loc) {
      if (loc.latitude != location.latitude &&
          loc.longitude != location.longitude) {
        setState(() {
          location = LatLng(loc.latitude, loc.longitude);
          print(location);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    ensureLocationPermission();
    if (_markers.isEmpty) {
      Provider.of<MapProvider>(context).getBusinesses();
    }
    final circleRadius = Provider.of<MapProvider>(context).searchProximity;
    Set<Circle> _circles = {
      Circle(
        circleId: CircleId("Search Radius"),
        center: location,
        strokeWidth: 0,
        fillColor: Colors.blue[300].withOpacity(0.4),
        visible: true,
        radius: circleRadius,
      ),
    };

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
