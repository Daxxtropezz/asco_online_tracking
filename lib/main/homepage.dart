import 'package:asco_online_tracking/audio/arec_start.dart';
import 'package:asco_online_tracking/scanning/scan_start.dart';
import 'package:asco_online_tracking/video/vrec_start.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "homepage",
    theme: ThemeData(
      useMaterial3: false,
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: Colors.red,
      ),
    ),
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double buttonSize = 100.0;

  double buttonWidth = 230.0;

  // for the width of the SCAN button
  double buttonMargin = 10.0;

  // increased margin between buttons
  double bRadius = 15.0;

  // increased margin between buttons
  // bool _doubleBackToExitPressedOnce = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            color: Colors.white.withOpacity(0.6),
          ),
          SingleChildScrollView(
            child: Center(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.all(40.0),
                    child: Center(
                      child: Text(
                        'ASCo: Track',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 36,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
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
                              child: SizedBox(
                                width: buttonWidth,
                                height: buttonSize,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Scan1()),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    elevation: 5,
                                    shadowColor: Colors.black,
                                    padding: EdgeInsets.zero,
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(bRadius),
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
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(buttonMargin),
                              child: SizedBox(
                                width: buttonWidth,
                                height: buttonSize,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ARecord1()),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    elevation: 5,
                                    shadowColor: Colors.black,
                                    padding: EdgeInsets.zero,
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(bRadius),
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
                      ],
                    ),
                  ),
                  SizedBox(height: buttonMargin),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(buttonMargin),
                              child: SizedBox(
                                width: buttonWidth,
                                height: buttonSize,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => VRecord1()),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    elevation: 5,
                                    shadowColor: Colors.black,
                                    padding: EdgeInsets.zero,
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(bRadius),
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
                  ),
                  SizedBox(height: buttonMargin),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
