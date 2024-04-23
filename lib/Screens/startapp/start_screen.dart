import 'dart:async';

import 'package:flutter/material.dart';
import 'package:projectgrocery/Screens/startapp/getstart_screen.dart';
import 'package:projectgrocery/Screens/homescreens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) => GetStart())));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff53B175),
      body: Center(
        child: Image.asset("assets/image/Group 1.png"),
      ),
    );
  }
}
