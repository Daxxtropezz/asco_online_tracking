import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:asco_online_tracking/homepage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "main",
    theme: ThemeData(
      useMaterial3: false,
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: Colors.red,
      ),
    ),
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  int duration = 3000;
  String splash_logo = 'assets/asc_tv_logo.png';

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      duration: duration,
      splash: splash_logo,
      nextScreen: Homepage(),
      splashTransition: SplashTransition.slideTransition,
      backgroundColor: Colors.white,
      splashIconSize: 150,
    );
  }
}
