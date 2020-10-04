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

  Future<void> getMarkers() async {
    print("IS THIS WORKING?");
    _businesses = await MongoClient.getNearbyBusinesses();
    print(_businesses ?? "kdjsjd");
    for (final business in _businesses) {
      final id = MarkerId(business.name);
      final pos = LatLng(business.lat, business.lon);
      final marker = Marker(markerId: id, position: pos);

      if (_markers.contains(marker)) continue;
      _markers.add(marker);
      print("ksjksjdkaj");
    }

    // _markers.add(Marker(markerId: MarkerId("KSJDKj"), position: LatLng(0, 0)));
    // print('hello');
    notifyListeners();
  }
}
