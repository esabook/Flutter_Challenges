import 'dart:async';

import 'package:bj_regist/constant/ColorCons.dart';
import 'package:bj_regist/constant/DimenCons.dart';
import 'package:flutter/material.dart';

class SplashUI extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SplashState();
}

class SplashState extends State<SplashUI> {
  @override
  Widget build(BuildContext context) => Container(
        color: ColorCons.accent,
        child: Center(
          child: Icon(
            Icons.price_change_sharp,
            color: Colors.white,
            size: DimeCons.dimen_86,
          ),
        ),
      );

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() async => Timer(Duration(seconds: 2), nextScreen);

  void nextScreen() {
    Navigator.of(context).pushNamedAndRemoveUntil("/regist", ModalRoute.withName("/"));
  }
}
