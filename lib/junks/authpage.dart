import 'package:asco_online_tracking/authentication/loginpage.dart';
import 'package:asco_online_tracking/authentication/registrationpage.dart';
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
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        body: WillPopScope(
          onWillPop: () async {
            final value = await showDialog<bool>(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    backgroundColor: Colors.white,
                    title: Row(
                      children: [
                        Icon(Icons.exit_to_app, color: Colors.redAccent),
                        SizedBox(width: 5),
                        Text(
                          'ASCo: Track',
                          style: TextStyle(color: Colors.red),
                        ),
                      ],
                    ),
                    content: Text(
                      'are you sure you want to exit?',
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                    actions: [
                      ElevatedButton(
                        onPressed: () => Navigator.of(context).pop(false),
                        style: ButtonStyle(
                          iconColor: MaterialStatePropertyAll(Colors.red),
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.white),
                        ),
                        child: Icon(Icons.close),
                      ),
                      ElevatedButton(
                        onPressed: () => Navigator.of(context).pop(true),
                        style: ButtonStyle(
                          iconColor: MaterialStatePropertyAll(Colors.green),
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.white),
                        ),
                        child: Icon(Icons.check),
                      ),
                    ],
                  );
                });
            if (value != null) {
              return Future.value(value);
            } else {
              return Future.value(false);
            }
          },
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
