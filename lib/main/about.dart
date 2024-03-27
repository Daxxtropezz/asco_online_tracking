import 'package:flutter/material.dart';

class AboutApp extends StatelessWidget {
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
        // appBar: AppBar(
        //   title: Row(
        //     children: [
        //       Icon(
        //         Icons.info,
        //       ),
        //       SizedBox(width: 8),
        //       Text("About This App"),
        //     ],
        //   ),
        // ),
        backgroundColor: Colors.red.shade700,
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              colors: [
                Colors.black.withOpacity(0.3),
                Colors.red.shade700.withOpacity(0.9),
              ],
            ),
          ),
          child: SizedBox(
            width: MediaQuery.of(context).size.width / 1.666,
            height: MediaQuery.of(context).size.height,
            child: Stack(
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
                // Container(
                //   color: Colors.white.withOpacity(0.8),
                // ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 60),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/images/asc_tv_logo.png',
                        scale: 9.5,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "ASCo: Track",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 31,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1,
                          wordSpacing: 2,
                        ),
                      ),
                      Text(
                        'app version 1.0.0',
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.7), fontSize: 20),
                      ),
                    ],
                  ),
                ),
                Positioned.fill(
                  top: 245,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      right: 2,
                      left: 2,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.9),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(45),
                          topRight: Radius.circular(45),
                        ),
                        border: Border.all(
                          color: Colors.black.withOpacity(.8),
                          width: 2.0,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(15.0),
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 40, vertical: 40),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "ABOUT THIS APP",
                                  style: TextStyle(
                                    color: Colors.red.shade700,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 26,
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "ㅤThis is the Ad Standards Council’s monitoring system where the user scans the billboard’s ad postings, commercials and more. This application helps monitor the advertisements of the applicants to see if the final material is equal to the advertisement posted through the social media and more.",
                                  style: TextStyle(
                                      color: Colors.red.shade700, fontSize: 23),
                                  textAlign: TextAlign.justify,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
