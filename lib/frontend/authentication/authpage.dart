import 'package:asco_online_tracking/frontend/authentication/loginpage.dart';
import 'package:asco_online_tracking/frontend/authentication/registrationpage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "authpage",
    theme: ThemeData(
      useMaterial3: false,
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: Colors.red,
      ),
    ),
    home: AuthPage(),
  ));
}

class AuthPage extends StatefulWidget {
  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  int userIndex = 0;
  List<Widget> pageList = [LoginPage(), RegistrationPage()];
  bool _doubleBackToExitPressedOnce = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: _onBackPressed,
        child: Center(
          child: pageList[userIndex],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: true,
        showUnselectedLabels: false,
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.shifting,
        onTap: (index) {
          setState(() {
            userIndex = index;
          });
        },
        currentIndex: userIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.login),
            label: 'ASC Login!',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.app_registration),
            label: 'ASC Register!',
            backgroundColor: Colors.red,
          )
        ],
      ),
    );
  }

  Future<bool> _onBackPressed() {
    if (_doubleBackToExitPressedOnce) {
      return Future.value(true);
    }

    _doubleBackToExitPressedOnce = true;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Repeat Action to Exit ASCo: Track"),
        duration: Duration(seconds: 2),
      ),
    );

    Future.delayed(Duration(seconds: 2), () {
      _doubleBackToExitPressedOnce = false;
    });

    return Future.value(false);
  }
}
