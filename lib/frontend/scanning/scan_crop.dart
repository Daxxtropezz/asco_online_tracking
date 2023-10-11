import 'dart:io';
import 'package:asco_online_tracking/frontend/scanning/scan_examine.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:cunning_document_scanner/cunning_document_scanner.dart';

class Scan2 extends StatefulWidget {
  @override
  State<Scan2> createState() => _Scan2State();
}

class _Scan2State extends State<Scan2> {
  var value = 0.5;
  List<String> _pictures = [];

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {}

  @override
  Widget build(BuildContext context) {
    bool isAndroid = false;

    try {
      isAndroid = Theme.of(context).platform == TargetPlatform.android;
    } catch (e) {
      isAndroid = false;
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "scan1",
      theme: ThemeData(
        useMaterial3: false,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.red,
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              if (isAndroid)
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              Icon(Icons.crop_rotate),
              SizedBox(width: 8),
              Text("Crop the Advertisement"),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(8, 30, 8, 8),
                  child: Container(
                    child: Text(
                      'Ref.No. 00000000',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                ElevatedButton(
                    onPressed: onPressed, child: const Text("Add Pictures")),
                for (var picture in _pictures) Image.file(File(picture))
              ],
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(8, 20, 8, 8),
                        child: Container(
                          width: 275.0,
                          height: 55.0,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Scan3(pictures: _pictures)),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              elevation: 5,
                              shadowColor: Colors.black,
                              padding: EdgeInsets.zero,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                            child: Align(
                              alignment: Alignment.center,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'CAPTURED',
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 25,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
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
          ],
        ),
      ),
    );
  }

  void onPressed() async {
    List<String> pictures;
    try {
      pictures = await CunningDocumentScanner.getPictures() ?? [];
      if (!mounted) return;
      setState(() {
        _pictures = pictures;
      });
    } catch (exception) {}
  }
}
