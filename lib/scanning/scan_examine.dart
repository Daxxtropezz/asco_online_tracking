import 'dart:io';
import 'package:asco_online_tracking/main/about.dart';
import 'package:flutter/material.dart';
import 'package:before_after/before_after.dart';
import 'package:auto_size_text/auto_size_text.dart';

class Scan3 extends StatefulWidget {
  final List<String> pictures;

  Scan3({required this.pictures});

  @override
  State<Scan3> createState() => _Scan3State();
}

class _Scan3State extends State<Scan3> {
  var value = 0.5;

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
              Icon(Icons.compare),
              SizedBox(width: 8),
              Text("Examine Images"),
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
                'assets/images/bg_main.png',
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
                Container(
                  margin: EdgeInsets.fromLTRB(50, 80, 50, 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'MATERIAL',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24, // Adjust the font size as needed
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        'CAPTURED',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24, // Adjust the font size as needed
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Container(
                          color: Colors.white,
                          child: BeforeAfter(
                            value: value,
                            before: Column(
                              children: [
                                for (var picture in widget.pictures)
                                  Image.file(
                                    File(picture),
                                    width: 400,
                                    height: 400,
                                    fit: BoxFit.fitWidth,
                                  ),
                              ],
                            ),
                            after: Image.asset(
                              'assets/images/asc_logo.png',
                              fit: BoxFit.fitWidth,
                              height: 400,
                              width: 400,
                            ),
                            direction: SliderDirection.horizontal,
                            onValueChanged: (value) {
                              setState(() => this.value = value);
                            },
                            thumbDecoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                color: Colors.blueAccent),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(5),
                        child: SizedBox(
                          width: 250,
                          height: 40,
                          child: AutoSizeText(
                            'Please adjust the slider to compare both images.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.w400,
                            ),
                            maxLines: 2,
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(8, 20, 8, 8),
                        child: SizedBox(
                          width: 275.0,
                          height: 55.0,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AboutApp()),
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
                                    'EXAMINED',
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
}
