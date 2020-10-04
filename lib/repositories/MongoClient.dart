import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:localbusiness/models/Business.dart';

class MongoClient {
  static const BASE_URL = 'https://make-uc-server.herokuapp.com/';
  static Future<List<Business>> getNearbyBusinesses() async {
    final res = await http.get('$BASE_URL/business/');
    List<dynamic> businesses = jsonDecode(res.body);
    return businesses.map((business) => Business.fromJSON(business)).toList();
  }
}
