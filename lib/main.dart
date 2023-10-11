import 'package:asco_online_tracking/frontend/audio/arec_start.dart';
import 'package:asco_online_tracking/frontend/logs/logs.dart';
import 'package:asco_online_tracking/frontend/scanning/scan_start.dart';
import 'package:asco_online_tracking/frontend/video/vrec_start.dart';
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
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double buttonSize = 100.0;
  double buttonWidth = 230.0; // for the width of the SCAN button
  double buttonMargin = 20.0; // increased margin between buttons
  double bRadius = 15.0; // increased margin between buttons
  bool _doubleBackToExitPressedOnce = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Icon(Icons.home),
              SizedBox(width: 8),
              Text("Homepage"),
            ],
          ),
        ),
        body: Stack(
          children: [
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Image.asset(
                'assets/bg_main.png',
                fit: BoxFit.fitWidth,
              ),
            ),
            Container(
              color: Colors.black.withOpacity(0.8),
            ),
            Center(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: Center(
                      child: Text(
                        'ASCo: Track',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 36,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    margin: EdgeInsets.all(40.0),
                  ),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(buttonMargin),
                              child: Container(
                                width: buttonWidth,
                                height: buttonSize,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => Scan1()),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    elevation: 5,
                                    shadowColor: Colors.black,
                                    padding: EdgeInsets.zero,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(bRadius),
                                    ),
                                  ),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(Icons.camera_alt),
                                        SizedBox(height: 8),
                                        Text('SCAN'),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: buttonMargin),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(buttonMargin),
                            child: Container(
                              width: buttonSize,
                              height: buttonSize,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => ARecord1()),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  elevation: 5,
                                  shadowColor: Colors.black,
                                  padding: EdgeInsets.zero,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(bRadius),
                                  ),
                                ),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(Icons.support_agent),
                                      SizedBox(height: 8),
                                      Text('A-REC'),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(buttonMargin),
                            child: Container(
                              width: buttonSize,
                              height: buttonSize,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => VRecord1()),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  elevation: 5,
                                  shadowColor: Colors.black,
                                  padding: EdgeInsets.zero,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(bRadius),
                                  ),
                                ),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(Icons.smart_screen),
                                      SizedBox(height: 8),
                                      Text('V-REC'),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: buttonMargin),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(buttonMargin),
                            child: Container(
                              width: buttonSize,
                              height: buttonSize,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => LogsApp()),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  elevation: 5,
                                  shadowColor: Colors.black,
                                  padding: EdgeInsets.zero,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(bRadius),
                                  ),
                                ),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(Icons.receipt_long),
                                      SizedBox(height: 8),
                                      Text('LOGS'),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(buttonMargin),
                            child: Container(
                              width: buttonSize,
                              height: buttonSize,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => AboutApp()),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  elevation: 5,
                                  shadowColor: Colors.black,
                                  padding: EdgeInsets.zero,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(bRadius),
                                  ),
                                ),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(Icons.info),
                                      SizedBox(height: 8),
                                      Text('ABOUT'),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: buttonMargin),
                ],
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
