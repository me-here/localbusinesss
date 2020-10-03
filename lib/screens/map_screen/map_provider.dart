import 'package:flutter/material.dart';
import '../../repositories/MongoClient.dart';

class MapProvider extends ChangeNotifier {
  double _searchProximity = 100;
  double get searchProximity => _searchProximity;
  void setSearchProximity(double newProximity) {
    _searchProximity = newProximity;
    notifyListeners();
  }

  Function getBusinesses = MongoClient.getNearbyBusinesses;
}
