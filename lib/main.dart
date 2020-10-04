import 'package:flutter/material.dart';
import './screens/login_screen/login_screen.dart';
import 'package:localbusiness/screens/map_screen/map_screen.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.blue[300],
  ));
  runApp(MaterialApp(
    title: 'Local Business Supporter',
    routes: {
      '/login': (_) => LoginScreen(),
      '/map': (_) => MapScreen(),
    },
    initialRoute: '/map',
    debugShowCheckedModeBanner: false,
  ));
}
