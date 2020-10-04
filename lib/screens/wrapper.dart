import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './home/home.dart';
import './authenticate/authenticate.dart';
import '../models/user.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<TheUser>(context);
    // return either Authenticate or Home widget
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
