import 'package:asco_online_tracking/frontend/logs/logs_refno.dart';
import 'package:flutter/material.dart';
import 'package:searchable_listview/searchable_listview.dart';

void main() {
  runApp(const LogsApp());
}

class LogsApp extends StatelessWidget {
  const LogsApp({Key? key}) : super(key: key);

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
      title: 'LogsApp',
      theme: ThemeData(
        primarySwatch: Colors.red,
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
                color: Colors.black.withOpacity(0.8),
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
  const RecentLogsApp({Key? key}) : super(key: key);

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
          // Container(
          //   child: Center(
          //     child: Padding(
          //       padding: const EdgeInsets.fromLTRB(50, 50, 50, 10),
          //       child: Text(
          //         'ASCo: Track',
          //         textAlign: TextAlign.center,
          //         style: TextStyle(
          //           color: Colors.white,
          //           fontSize: 36,
          //           fontWeight: FontWeight.w500,
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(30, 40, 30, 10),
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
        await Future.delayed(const Duration(seconds: 5));
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
        return const Divider();
      },
      style: const TextStyle(fontSize: 25),
      emptyWidget: const EmptyView(),
      inputDecoration: InputDecoration(
        labelText: "Reference.No.",
        labelStyle: TextStyle(
          color: Colors.white,
        ),
        fillColor: Colors.white,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.white,
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

  const ASCRefCodeItem({
    Key? key,
    required this.ascRefCode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to the logs_refno.dart screen and pass data as arguments
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) =>
                LogsRefNo(referenceNo: ascRefCode.referenceNo),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 60,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              Icon(
                Icons.qr_code,
                color: Colors.white,
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${ascRefCode.referenceNo}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'Validity Date: ${ascRefCode.refValidity}',
                    style: const TextStyle(
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
  const EmptyView({Key? key}) : super(key: key);

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
            color: Colors.white,
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
