import 'package:asco_online_tracking/frontend/logs/logs_refno.dart';
import 'package:flutter/material.dart';
import 'package:searchable_listview/searchable_listview.dart';

void main() {
  runApp(LogsApp());
}

class LogsApp extends StatefulWidget {
  LogsApp({Key? key}) : super(key: key);

  @override
  State<LogsApp> createState() => _LogsAppState();
}

class _LogsAppState extends State<LogsApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LogsApp',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Icon(Icons.receipt_long),
              SizedBox(width: 8),
              Text("Recent Logs"),
            ],
          ),
        ),
        body: SafeArea(
          child: Stack(
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
              RecentLogsApp(),
            ],
          ),
        ),
      ),
    );
  }
}

class RecentLogsApp extends StatefulWidget {
  RecentLogsApp({Key? key}) : super(key: key);

  @override
  State<RecentLogsApp> createState() => _RecentLogsAppState();
}

class _RecentLogsAppState extends State<RecentLogsApp> {
  final List<ASCRefCode> ascRefCodes = [
    ASCRefCode(referenceNo: 'S0142I090523S', refValidity: '2023-09-08'),
    ASCRefCode(referenceNo: 'S0003I090723S', refValidity: '2023-09-25'),
    ASCRefCode(referenceNo: 'M0067P091323E', refValidity: '2023-10-01'),
    ASCRefCode(referenceNo: 'P0081P090423R', refValidity: '2024-09-03'),
    ASCRefCode(referenceNo: 'D0061P090523R', refValidity: '2024-09-04'),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.fromLTRB(30, 40, 30, 10),
              child: renderAsynchSearchableListview(),
            ),
          ),
        ],
      ),
    );
  }

  Widget sliverListViewBuilder() {
    return SearchableList<ASCRefCode>.sliver(
      initialList: ascRefCodes,
      filter: (query) {
        return ascRefCodes
            .where((element) => element.referenceNo.contains(query))
            .toList();
      },
      builder: (list, index, item) {
        return ASCRefCodeItem(ascRefCode: list[index]);
      },
    );
  }

  Widget renderAsynchSearchableListview() {
    return SearchableList<ASCRefCode>.async(
      builder: (displayedList, itemIndex, item) {
        return ASCRefCodeItem(ascRefCode: displayedList[itemIndex]);
      },
      asyncListCallback: () async {
        await Future.delayed(Duration(seconds: 5));
        return ascRefCodes;
      },
      asyncListFilter: (query, list) {
        return ascRefCodes
            .where((element) =>
                element.referenceNo.contains(query) ||
                element.refValidity.contains(query))
            .toList();
      },
      seperatorBuilder: (context, index) {
        return Divider();
      },
      style: TextStyle(fontSize: 25),
      emptyWidget: EmptyView(),
      inputDecoration: InputDecoration(
        labelText: "Reference.No.",
        labelStyle: TextStyle(
          color: Colors.black,
        ),
        fillColor: Colors.black,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
            width: 3.0,
          ),
          borderRadius: BorderRadius.circular(18.0),
        ),
      ),
    );
  }
}

class ASCRefCodeItem extends StatelessWidget {
  final ASCRefCode ascRefCode;

  ASCRefCodeItem({
    Key? key,
    required this.ascRefCode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to the logs_refno.dart screen and pass data as arguments
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) =>
                LogsRefNo(referenceNo: ascRefCode.referenceNo),
          ),
          (route) => true,
        );
      },
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Container(
          height: 60,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Icon(
                Icons.qr_code,
                color: Colors.white,
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${ascRefCode.referenceNo}',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'Validity Date: ${ascRefCode.refValidity}',
                    style: TextStyle(
                      color: Colors.amberAccent,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EmptyView extends StatelessWidget {
  EmptyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.warning,
          color: Colors.yellow,
        ),
        SizedBox(width: 8),
        Text(
          'No Reference.No. found!',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}

class ASCRefCode {
  String referenceNo;
  String refValidity;

  ASCRefCode({
    required this.referenceNo,
    required this.refValidity,
  });
}
