import 'package:MMLMobile/Screens/SplashScreen.dart';
import 'package:MMLMobile/screens/HomeScreen.dart';
// import 'package:MMLMobile/screens/LoginScreen.dart';
import 'package:MMLMobile/screens/LoginScreenV.dart';
import 'package:MMLMobile/utils/Preference.dart';
import 'package:MMLMobile/utils/UtilMethods.dart';
import 'package:flutter/material.dart';

void main() async {
  Map<String, String> env = await loadEnvFile("assets/env/.env_production");
  Preference.setItem("BASEURL", env["API_URL"]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
      routes: <String, WidgetBuilder>{
        "/screens/LoginScreen": (BuildContext context) => new LoginScreenV(),
        "/screens/HomeScreen": (BuildContext context) => new HomeScreen(),
        "/screens/SplashScreen": (BuildContext context) => new SplashScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
