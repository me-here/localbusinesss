import 'package:flutter/material.dart';

class MapProvider extends ChangeNotifier {
  double _searchProximity = 0;
  double get searchProximity => _searchProximity;
  void setSearchProximity(double newProximity) {
    _searchProximity = newProximity;
    notifyListeners();
  }
}
