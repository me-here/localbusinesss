import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:location/location.dart';
import "../../../views/business_sheet/sheet_provider.dart";
import '../map_providerfinal.dart';

class MapView extends StatefulWidget {
  @override
  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  final Completer<GoogleMapController> _controller = Completer();

  Future<void> ensureLocationPermission() async {
    if (await Permission.location.request().isGranted) {
      setState(() {});
    }
  }

  Future<LatLng> getLocation() async {
    LocationData loc = await Location.instance.getLocation();
    return LatLng(loc.latitude, loc.longitude);
  }

  Future<void> animateTo() async {
    final loc = await getLocation();
    final f = await _controller.future;
    CameraPosition cameraPosition = CameraPosition(target: loc, zoom: 14);
    f.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }

  LatLng location = LatLng(37.4, -122.08832357078792);

  @override
  void initState() {
    super.initState();
    animateTo();
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
          Provider.of<MapProvider>(context, listen: false)
              .getMarkers("restaurant");
        },
        markers: Provider.of<MapProvider>(context).markers,
        circles: _circles,
      ),
    );
  }
}
