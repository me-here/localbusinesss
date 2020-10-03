import 'package:flutter/material.dart';
import 'package:localbusiness/screens/login_screen/login_screen.dart';
import 'package:localbusiness/screens/map_screen/map_screen.dart';

void main() {
  runApp(MaterialApp(
    title: 'Local Business Supporter',
    routes: {
      '/login': (_) => LoginScreen(),
      '/map': (_) => MapScreen(),
    },
    initialRoute: '/login',
  ));
}
