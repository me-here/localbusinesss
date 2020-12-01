import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class SheetProvider extends ChangeNotifier {
  // Manages title of selected locations
  String _title = '';
  String get title => _title;
  void setTitle(String s) {
    _title = s;
    notifyListeners();
  }

  // Sets the distance from the user and the tapped location
  double _metersAway = 1.0;
  double get metersAway => _metersAway;
  void setMetersAway(double mapDistance) {
    _metersAway = (321.8688 / 0.004349319976 * mapDistance).roundToDouble();
    notifyListeners();
  }

  // Finds the distance in lat long from the user to the restaurant and then
  // sets it using setMetersAway()
  LatLng _loc;
  LatLng get loc => _loc;
  Future<void> setLoc(LatLng loc) async {
    final myLocation = await Location.instance.getLocation();
    final xDelta = myLocation.latitude - loc.latitude;
    final yDelta = myLocation.longitude - loc.longitude;
    final distance = sqrt(xDelta * xDelta + yDelta * yDelta);
    setMetersAway(distance);
    _loc = loc;

    // notifyListeners();
  }

  // Checks if the sheet should be open only if an icon has been tapped
  var isSheetOpen = false;

  // List of open job positions
  final jobs = [
    {'position': 'Cook', 'type': 'Full Time', 'urgency': 'Urgent'},
    {'position': 'Janitor', 'type': 'Part Time', 'urgency': 'Not Urgent'},
    {'position': 'Manager', 'type': 'Full Time', 'urgency': 'Urgent'},
  ];

  List get listOfJobs => jobs;

  void openSheet() {
    isSheetOpen = true;
    notifyListeners();
  }

  void closeSheet() {
    isSheetOpen = false;
    notifyListeners();
  }
}
