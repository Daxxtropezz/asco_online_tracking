import 'package:asco_online_tracking/frontend/main/homepage.dart';
import 'package:asco_online_tracking/frontend/logs/logs.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:floating_action_bubble/floating_action_bubble.dart';
import 'package:flutter/material.dart';
import 'package:asco_online_tracking/frontend/main/about.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "selectionpage",
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

class _SelectionPageState extends State<SelectionPage>
    with SingleTickerProviderStateMixin {
  double buttonSize = 100.0;
  double buttonWidth = 230.0;
  double buttonMargin = 20.0; // for the width of the SCAN button
  double bRadius = 15.0; // increased margin between buttons
  bool _doubleBackToExitPressedOnce = false; // increased margin between buttons
  int homeIndex = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  List<Widget> pageList = [HomePage(), AboutApp()];

  late Animation<double> _animation;
  late AnimationController _animController;
  IconData currentIcon = Icons.menu;
  Color currentColor = Colors.white;
  Color currentBG = Colors.red;
  bool isMenuOpen = false;

  @override
  void initState() {
    _animController = AnimationController(
      duration: Duration(milliseconds: 260),
      vsync: this,
    );

    final curvedAnimation =
        CurvedAnimation(curve: Curves.easeInOut, parent: _animController);
    _animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);

    super.initState();
  }

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
          height: 57,
          color: Colors.red,
          buttonBackgroundColor: Colors.white,
          animationDuration: Duration(milliseconds: 400),
          index: homeIndex,
          animationCurve: Curves.easeInOutCubicEmphasized,
          key: _bottomNavigationKey,
          onTap: (index) {
            setState(() {
              homeIndex = index;
            });
          },
          items: [
            CurvedNavigationBarItem(
              child: Icon(
                Icons.home,
                color: homeIndex == 0 ? Colors.red : Colors.white,
                size: 20,
              ),
              label: 'Home',
              labelStyle: TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
            CurvedNavigationBarItem(
              child: Icon(
                Icons.info,
                color: homeIndex == 1 ? Colors.red : Colors.white,
                size: 20,
              ),
              label: 'About',
              labelStyle: TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: FloatingActionBubble(
          items: [
            Bubble(
              icon: Icons.receipt_long,
              iconColor: Colors.white,
              title: 'Recent Logs',
              bubbleColor: Colors.red,
              onPress: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LogsApp(),
                  ),
                );
              },
              titleStyle: TextStyle(
                color: Colors.white,
              ),
            ),
            Bubble(
              icon: Icons.account_circle,
              iconColor: Colors.white,
              title: 'My Account',
              bubbleColor: Colors.red,
              onPress: () {},
              titleStyle: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
          animation: _animation,
          onPress: () {
            _animController.isCompleted
                ? _animController!.reverse()
                : _animController!.forward();
            setState(() {
              isMenuOpen = !isMenuOpen;
              currentIcon = isMenuOpen ? Icons.close : Icons.menu;
              currentColor = isMenuOpen ? Colors.red : Colors.white;
              currentBG = isMenuOpen ? Colors.white : Colors.red;
            });
          },
          iconColor: currentColor,
          iconData: currentIcon,
          backGroundColor: currentBG,
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
