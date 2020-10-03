import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:localbusiness/models/Business.dart';

class MongoClient {
  static const BASE_URL = 'http://10.0.0.67:3000';
  static Future<List<Business>> getNearbyBusinesses() async {
    final res = await http.get('$BASE_URL/business/');
    List<Map<String, dynamic>> businesses = jsonDecode(res.body);
    return businesses.map((business) => Business.fromJSON(business)).toList();
  }
}
