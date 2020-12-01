import 'package:flutter/material.dart';
import 'package:localbusiness/models/Business.dart';
import 'package:localbusiness/views/business_sheet/sheet_provider.dart';
import '../../repositories/MongoClient.dart';
import 'package:location/location.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapProvider extends ChangeNotifier {
  SheetProvider sheetProvider;
  MapProvider({this.sheetProvider});

  double _searchProximity = 700;
  double get searchProximity => _searchProximity;
  void setSearchProximity(double newProximity) {
    _searchProximity = newProximity;
    notifyListeners();
  }

  List<Business> _businesses;
  List<Business> get businesses => _businesses;

  Set<Marker> _markers = {};
  Set<Marker> get markers => _markers;

  void onMarkerTap(LatLng loc, MarkerId id, String name) {
    print('TAPPED MARKER');
    print(loc.latitude);
    print(loc.longitude);
    print(id);
    sheetProvider.setLoc(loc);
    sheetProvider.setTitle(name);
    sheetProvider.openSheet();
  }

  Future<void> getMarkers(String query) async {
    _businesses =
        await MongoClient.getNearbyBusinesses(_searchProximity, query: query);

    for (final business in _businesses) {
      final id = MarkerId(business.name);
      final pos = LatLng(business.lat, business.lon);
      final marker = Marker(
        markerId: id,
        position: pos,
        onTap: () => onMarkerTap(pos, id, business.name),
      );

      if (_markers.contains(marker)) continue;
      _markers.add(marker);
    }

    notifyListeners();
  }

  void clearMarkers() {
    _markers = {};
    notifyListeners();
  }
}
