import 'package:asco_online_tracking/frontend/authentication/loginpage.dart';
import 'package:asco_online_tracking/frontend/authentication/registrationpage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "authenticationpage",
    theme: ThemeData(
      useMaterial3: false,
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: Colors.red,
      ),
    ),
    home: AuthenticationPage(),
  ));
}

class AuthenticationPage extends StatefulWidget {
  @override
  State<AuthenticationPage> createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  int userIndex = 0;
  List<Widget> pageList = [LoginPage(), RegistrationPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Row(
      //     children: [
      //       Icon(Icons.home),
      //       SizedBox(width: 8),
      //       Text("Homepage"),
      //     ],
      //   ),
      // ),
      body: Center(
        child: pageList[userIndex],
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
              backgroundColor: Colors.red),
          BottomNavigationBarItem(
              icon: Icon(Icons.app_registration),
              label: 'ASC Register!',
              backgroundColor: Colors.red)
        ],
      ),
    );
  }
}
