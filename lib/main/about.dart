import 'package:flutter/material.dart';

class AboutApp extends StatefulWidget {
  @override
  State<AboutApp> createState() => _AboutAppState();
}

class _AboutAppState extends State<AboutApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "aboutpage",
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
              Icon(Icons.info),
              SizedBox(width: 8),
              Text("About This App"),
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
              color: Colors.white.withOpacity(0.6),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Center(
                      child: Image.asset(
                        'assets/images/asc_tv_logo.png',
                        width: 100,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'app version 1.0.0',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(32, 20, 20, 80),
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                    padding: EdgeInsets.fromLTRB(23, 30, 23, 80),
                    margin: EdgeInsets.all(20.0),
                    child: Expanded(
                      child: SizedBox(
                        child: Text(
                          "ㅤㅤThis is the Ad Standards Council’s monitoring system where the user scans the billboard’s ad postings, commercials and more. This application helps monitor the advertisements of the applicants to see if the final material is equal to the advertisement posted through the social media and more.",
                          style:
                              TextStyle(color: Colors.white, fontSize: 23),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ),
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
