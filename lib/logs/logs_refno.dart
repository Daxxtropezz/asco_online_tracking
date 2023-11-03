import 'package:asco_online_tracking/logs/logs_refno.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "logsrefnoapp",
    theme: ThemeData(
      useMaterial3: false,
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: Colors.red,
      ),
    ),
    home: LogsRefNoApp(
      referenceNo: '',
    ),
  ));
}

class LogsRefNoApp extends StatelessWidget {
  final String referenceNo;

  const LogsRefNoApp({Key? key, required this.referenceNo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Ref.No. $referenceNo"),
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
          // below is the list/front page
        ],
      ),
    );
  }
}
