import 'package:flutter/material.dart';
import 'package:localbusiness/models/Business.dart';
import '../../repositories/MongoClient.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapProvider extends ChangeNotifier {
  double _searchProximity = 100;
  double get searchProximity => _searchProximity;
  void setSearchProximity(double newProximity) {
    _searchProximity = newProximity;
    notifyListeners();
  }

  List<Business> _businesses;
  List<Business> get businesses => _businesses;

  Set<Marker> _markers = {};
  Set<Marker> get markers => _markers;

  void getMarkers() async {
    _businesses = await MongoClient.getNearbyBusinesses();
    for (final business in _businesses) {
      final id = MarkerId(business.name);
      final pos = LatLng(business.lat, business.lon);
      final marker = Marker(markerId: id, position: pos);

      if (_markers.contains(marker)) continue;
      _markers.add(marker);
    }
    // print('hello');
    // notifyListeners();
  }
}
