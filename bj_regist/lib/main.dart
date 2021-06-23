import 'package:bj_regist/ui/SplashUI.dart';
import 'package:bj_regist/ui/regist/RegistUI.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        "/": (ctx) => SplashUI(),
        "/regist": (ctx) => RegistUI(),
      },
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'F'),
    );
  }
}
