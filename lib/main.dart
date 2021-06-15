import 'package:flutter/material.dart';
import 'package:flutter_jetchart/pages/home_page.dart';
import 'package:flutter_jetchart/pages/registration_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  SharedPreferences.getInstance().then((prefs) {
    runApp(MyApp(prefs: prefs));
  });
}

class MyApp extends StatelessWidget {
  final SharedPreferences prefs;

  MyApp({this.prefs});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: _decideMainPage(),
    );
  }

  _decideMainPage() {
    if (prefs.getBool('is_verified') != null) {
      if (prefs.getBool('is_verified')) {
        return HomePage(prefs: prefs);
        // return RegistrationPage(prefs: prefs);
      } else {
        return RegistrationPage(prefs: prefs);
      }
    } else {
      return RegistrationPage(prefs: prefs);
    }
  }
}
