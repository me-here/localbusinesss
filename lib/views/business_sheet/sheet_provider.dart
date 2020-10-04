import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class SheetProvider extends ChangeNotifier {
  String _title = "";
  String get title => _title;
  void setTitle(String s) {
    _title = s;
    notifyListeners();
  }

  double _metersAway = 1.0;
  double get metersAway => _metersAway;
  void setMetersAway(double mapDistance) {
    _metersAway = (321.8688 / 0.004349319976 * mapDistance).roundToDouble();
    notifyListeners();
  }

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

  var isSheetOpen = false;

  final jobs = [
    {"position": "Cook", "type": "Full Time", "urgency": "Urgent"},
    {"position": "Janitor", "type": "Part Time", "urgency": "Not Urgent"},
    {"position": "Manager", "type": "Full Time", "urgency": "Urgent"},
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
