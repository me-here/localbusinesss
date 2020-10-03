import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatelessWidget {
  Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            MapView(controller: _controller),
            ProfileButton(),
          ],
        ),
      ),
    );
  }
}

class ProfileButton extends StatelessWidget {
  const ProfileButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),
      child: Align(
        alignment: Alignment.topRight,
        child: Material(
          borderRadius: BorderRadius.circular(30),
          clipBehavior: Clip.hardEdge,
          child: IconButton(
            icon: Icon(Icons.settings),
            iconSize: 30,
            splashColor: Colors.grey,
            onPressed: () => print("kjkj"),
          ),
        ),
      ),
    );
  }
}

class MapView extends StatelessWidget {
  const MapView({
    Key key,
    @required Completer<GoogleMapController> controller,
  })  : _controller = controller,
        super(key: key);

  final Completer<GoogleMapController> _controller;

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: CameraPosition(
        target: LatLng(37.43296265331129, -122.08832357078792),
        zoom: 14,
      ),
      onMapCreated: (controller) {
        _controller.complete(controller);
      },
    );
  }
}
