import 'package:asco_online_tracking/authentication/loginpage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "landingpage",
    theme: ThemeData(
      useMaterial3: false,
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: Colors.red,
      ),
    ),
    home: LandingPage(),
  ));
}

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      clipBehavior: Clip.antiAlias,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 2.6,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      colors: [
                        Colors.red.shade900.withOpacity(0.8),
                        Colors.red.shade700.withOpacity(0.9),
                      ],
                    ),
                    borderRadius:
                        BorderRadius.only(topRight: Radius.circular(150)),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 2.6,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(150),
                    ),
                  ),
                  child: Center(
                    child: Image.asset(
                      "assets/images/asc_tv_logo.png",
                      scale: 6.5,
                    ),
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 1.625,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 1.625,
                padding: EdgeInsets.only(top: 40, bottom: 60),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.center,
                    colors: [
                      Colors.red.shade900.withOpacity(0.8),
                      Colors.red.withOpacity(0.9),
                    ],
                  ),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(150),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 60,
                      ),
                      Text(
                        "ASCo: Track",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 31,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1,
                          wordSpacing: 2,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          "Where you monitor advertisement materials.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.white.withOpacity(0.6),
                            fontWeight: FontWeight.w400,
                            letterSpacing: 1,
                            wordSpacing: 2,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Material(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(80),
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                builder: (context) => LoginPage(),
                              ),
                              (route) => false,
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 15, horizontal: 80),
                            child: Text(
                              "Get Started!",
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
