import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:asco_online_tracking/frontend/authentication/authenticationpage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "loginpage",
    theme: ThemeData(
      useMaterial3: false,
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: Colors.red,
      ),
    ),
    home: LoginPage(),
  ));
}

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.login),
            SizedBox(width: 8),
            Text("Login"),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 60),
          child: Form(
              child: Column(
            children: [
              Image.asset(
                'assets/asc_logo.png',
                width: 300,
                height: 200,
              ),
            ],
          )),
        ),
      ),
    );
  }
}
