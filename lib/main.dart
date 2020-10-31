import 'package:flutter/material.dart';
import 'screens/login_screen/wrapperfinal.dart';
import 'package:localbusiness/screens/map_screen/map_screenfinal.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'models/user.dart';
import 'services/authfinal.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
/*  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.blue[300],
  ));
  runApp(MaterialApp(
    title: 'Local Business Supporter',
    routes: {
      '/login': (_) => Wrapper(),
      '/map': (_) => MapScreen(),
    },
    initialRoute: '/login',
    debugShowCheckedModeBanner: false,
  ));
}
*/

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<TheUser>.value(
      value: AuthService().user,
      child: new MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
