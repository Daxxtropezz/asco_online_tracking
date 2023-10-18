import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:asco_online_tracking/frontend/authentication/authenticationpage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "registrationpage",
    theme: ThemeData(
      useMaterial3: false,
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: Colors.red,
      ),
    ),
    home: RegistrationPage(),
  ));
}

class RegistrationPage extends StatefulWidget {
  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.app_registration),
            SizedBox(width: 8),
            Text("Register"),
          ],
        ),
      ),
    );
  }
}
