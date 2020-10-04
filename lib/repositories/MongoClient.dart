import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:localbusiness/models/Business.dart';
import 'package:location/location.dart';

class MongoClient {
  static const BASE_URL = 'https://make-uc-server.herokuapp.com';
  static Future<List<Business>> getNearbyBusinesses(double radius) async {
    LocationData loc = await Location.instance.getLocation();
    print("${loc.latitude}  ${loc.longitude}");
    final res = await http.post(
      '$BASE_URL/map',
      headers: {'Content-Type': 'application/json; charset=UTF-8'},
      body: jsonEncode({
        "lat": loc.latitude,
        "lon": loc.longitude,
        "radius": "$radius",
        "keyword": "restaurant"
      }),
    );
    print("Working?");
    final results = jsonDecode(res.body)["results"];
    if (results == null) return [];
    print(results);

    List<Business> r = results.map((res) {
      final result = Map<String, dynamic>.from(res);
      double lat = result["geometry"]["location"]["lat"];
      print(lat);
      double lng = result["geometry"]["location"]["lng"];
      print(lng);
      String name = result["name"];
      print(name);
      String iconURL = result["icon"];
      print(iconURL);
      String photoURL =
          "https://maps.googleapis.com/maps/api/place/photo?${result["photos"]["photo_reference"]}";
      print(photoURL);
      String place_id = result["place_id"];
      print(place_id);
      double rating = result["rating"];
      print(rating);
      double price_lvl = result["price_level"];
      print(price_lvl);
      List<String> types = result["types"];
      print(types);

      return Business(iconURL: iconURL, lat: lat, lon: lng, name: name);
    }).toList();
    return r;
  }

  static Future<List<Business>> getSelectedBusiness() async {
    // not done
    final res = await http.get('$BASE_URL/business/');
    List<dynamic> businesses = jsonDecode(res.body);
    return businesses.map((business) => Business.fromJSON(business)).toList();
  }
}
