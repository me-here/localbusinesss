import 'package:flutter/material.dart';
import 'package:localbusiness/models/Business.dart';
import '../../repositories/MongoClient.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapProvider extends ChangeNotifier {
  Function expandSheet;
  MapProvider({this.expandSheet});

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

  void onMarkerTap(LatLng loc, MarkerId id) {
    print("TAPPED MARKER");
    print(loc.latitude);
    print(loc.longitude);
    print(id);
    this.expandSheet();
  }

  Future<void> getMarkers() async {
    _businesses = await MongoClient.getNearbyBusinesses(_searchProximity);

    for (final business in _businesses) {
      final id = MarkerId(business.name);
      final pos = LatLng(business.lat, business.lon);
      final marker = Marker(
        markerId: id,
        position: pos,
        onTap: () => onMarkerTap(pos, id),
      );

      if (_markers.contains(marker)) continue;
      _markers.add(marker);
    }

    notifyListeners();
  }
}
