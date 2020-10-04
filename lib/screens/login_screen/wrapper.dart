import 'package:flutter/material.dart';
import 'package:localbusiness/screens/home_screen/home.dart';
import 'package:localbusiness/screens/login_screen/login_screen.dart';
import 'package:provider/provider.dart';

import '../../models/user.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<TheUser>(context);
    // return either Authenticate or Home widget
    if (user == null) {
      return LoginScreen();
    } else {
      return HomeScreen();
    }
  }
}
