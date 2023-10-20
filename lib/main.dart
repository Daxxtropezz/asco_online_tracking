import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:asco_online_tracking/frontend/authentication/authpage.dart';
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
    home: MainPage(),
  ));
}

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int duration = 1000;

  String splash_logo = 'assets/asc_tv_logo.png';

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      duration: duration,
      splash: splash_logo,
      nextScreen: AuthPage(),
      splashTransition: SplashTransition.slideTransition,
      backgroundColor: Colors.white,
      splashIconSize: 150,
    );
  }
}
