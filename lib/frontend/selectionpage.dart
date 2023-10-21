import 'package:asco_online_tracking/frontend/homepage.dart';
import 'package:asco_online_tracking/frontend/logs/logs.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:asco_online_tracking/frontend/about.dart';

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
    home: SelectionPage(),
  ));
}

class SelectionPage extends StatefulWidget {
  @override
  State<SelectionPage> createState() => _SelectionPageState();
}

class _SelectionPageState extends State<SelectionPage> {
  double buttonSize = 100.0;
  double buttonWidth = 230.0;
  double buttonMargin = 20.0; // for the width of the SCAN button
  double bRadius = 15.0; // increased margin between buttons
  bool _doubleBackToExitPressedOnce = false; // increased margin between buttons
  int homeIndex = 1;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  List<Widget> pageList = [LogsApp(), HomePage(), AboutApp()];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        body: WillPopScope(
          onWillPop: _onBackPressed,
          child: Center(
            child: pageList[homeIndex],
          ),
        ),
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.red.shade900.withOpacity(0.26),
          color: Colors.white,
          buttonBackgroundColor: Colors.red,
          animationDuration: Duration(milliseconds: 400),
          index: homeIndex,
          animationCurve: Curves.fastOutSlowIn,
          key: _bottomNavigationKey,
          onTap: (index) {
            setState(() {
              homeIndex = index;
            });
          },
          items: [
            CurvedNavigationBarItem(
              child: Icon(
                Icons.receipt_long,
                color: Colors.black,
                size: 25,
              ),
              label: 'Logs',
              labelStyle: TextStyle(
                color: Colors.red,
                fontSize: 16,
              ),
            ),
            CurvedNavigationBarItem(
              child: Icon(
                Icons.home,
                color: Colors.black,
                size: 40,
              ),
            ),
            CurvedNavigationBarItem(
              child: Icon(
                Icons.info,
                color: Colors.black,
                size: 25,
              ),
              label: 'About',
              labelStyle: TextStyle(
                color: Colors.red,
                fontSize: 16,
              ),
            ),
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
        content: Text("Repeat action to exit"),
        duration: Duration(seconds: 2),
      ),
    );

    Future.delayed(Duration(seconds: 2), () {
      _doubleBackToExitPressedOnce = false;
    });

    return Future.value(false);
  }
}
