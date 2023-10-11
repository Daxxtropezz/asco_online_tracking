import 'package:flutter/material.dart';

class AboutApp extends StatelessWidget {
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
      title: "about",
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
              Icon(Icons.receipt_long),
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
                'assets/bg_main.png',
                fit: BoxFit.fitWidth,
              ),
            ),
            Container(
              color: Colors.black.withOpacity(0.8),
            ),
            Container(
              child: Center(
                child: Column(
                  children: [
                    Text(
                      'ASCo: Track',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 36,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              margin: EdgeInsets.all(60.0),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(32, 20, 20, 80),
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Expanded(
                          child: SizedBox(
                            // height: 50,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Text(
                                "ㅤㅤThis is the Ad Standards Council’s monitoring system where the user scans the billboard’s ad postings, commercials and more. This application helps monitor the advertisements of the applicants to see if the final material is equal to the advertisement posted through the social media and more.",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 23),
                                textAlign: TextAlign.justify,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    padding: EdgeInsets.fromLTRB(23, 30, 23, 80),
                    margin: EdgeInsets.all(30.0),
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
// body: Center(
// child: ElevatedButton(
// child: Text("Return"),
// onPressed: (){
// Navigator.pop(context);
// },
// ),
// ),
