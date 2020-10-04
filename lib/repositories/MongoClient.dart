import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:localbusiness/models/Business.dart';
import 'package:location/location.dart';

class MongoClient {
  static const BASE_URL = 'https://make-uc-server.herokuapp.com';
  static Future<List<Business>> getNearbyBusinesses(double radius) async {
    LocationData loc = await Location.instance.getLocation();

    final res = await http.post(
      '$BASE_URL/map',
      headers: {'Content-Type': 'application/json; charset=UTF-8'},
      body: jsonEncode({
        "lat": loc.latitude,
        "lon": loc.longitude,
        "radius": "$radius",
      }),
    );
    print("Working?");
    print(res.body);
    return [];
  }

  static Future<List<Business>> getSelectedBusiness() async {
    // not done
    final res = await http.get('$BASE_URL/business/');
    List<dynamic> businesses = jsonDecode(res.body);
    return businesses.map((business) => Business.fromJSON(business)).toList();
  }
}
