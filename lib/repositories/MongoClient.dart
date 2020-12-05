import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:localbusiness/models/Business.dart';
import 'package:location/location.dart';

class MongoClient {
  static const BASE_URL = 'https://make-uc-server.herokuapp.com';
  static Future<List<Business>> getNearbyBusinesses(double radius,
      {String query}) async {
    LocationData loc = await Location.instance.getLocation();
    String q = query ?? 'restaurant';
    print('${loc.latitude}  ${loc.longitude}');
    final res = await http.post(
      '$BASE_URL/map',
      headers: {'Content-Type': 'application/json; charset=UTF-8'},
      body: jsonEncode({
        'lat': loc.latitude,
        'lon': loc.longitude,
        'radius': '${radius - 350}',
        'keyword': q,
      }),
    );
    print('Working?');
    final results = jsonDecode(res.body)['results'];
    if (results == null) return [];
    print(results);

    List<Business> businesses = [];

    for (final result in results) {
      final lat = result['geometry']['location']['lat'];
      final lng = result['geometry']['location']['lng'];
      final name = result['name'];

      businesses.add(Business(lat: lat, lon: lng, name: name));
    }

    return businesses;
  }

  static Future<List<Business>> getSelectedBusiness() async {
    // not done
    final res = await http.get('$BASE_URL/business/');
    List<dynamic> businesses = jsonDecode(res.body);
    return businesses.map((business) => Business.fromJSON(business)).toList();
  }
}
