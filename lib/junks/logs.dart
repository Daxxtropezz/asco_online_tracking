import 'package:asco_online_tracking/logs/logs_refno.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "logsapp",
    theme: ThemeData(
      useMaterial3: false,
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: Colors.red,
      ),
    ),
    home: LogsApp(),
  ));
}

class LogsApp extends StatefulWidget {
  LogsApp({super.key});

  @override
  _LogsAppState createState() => _LogsAppState();
}

class _LogsAppState extends State<LogsApp> {
  final List<Map<String, dynamic>> _allRefCodes = [
    {"id": 1, "refCode": "S0142I090523S", "validity": '2023-09-08'},
    {"id": 2, "refCode": "S0003I090723S", "validity": '2023-09-25'},
    {"id": 3, "refCode": "M0067P091323E", "validity": '2023-10-01'},
    {"id": 4, "refCode": "P0081P090423R", "validity": '2024-09-03'},
    {"id": 5, "refCode": "D0061P090523R", "validity": '2024-09-04'},
  ];

  // This list holds the data for the list view
  List<Map<String, dynamic>> _foundRefCodes = [];

  @override
  initState() {
    _foundRefCodes = _allRefCodes;
    super.initState();
  }

  // This function is called whenever the text field changes
  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      results =
          _allRefCodes; // if the search field is empty or only contains white-space, we'll display all ref codes
    } else {
      results = _allRefCodes
          .where((refNumber) => refNumber["refCode"]
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
      // using toLowerCase() to make it case-insensitive
    }

    setState(() {
      _foundRefCodes = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.receipt_long),
            SizedBox(
              width: 8,
            ),
            Text('Recent Logs'),
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
          // below is the list/front page
          Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                TextField(
                  onChanged: (value) => _runFilter(value),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Search Reference Code',
                    suffixIcon: Icon(Icons.search),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: _foundRefCodes.isNotEmpty
                      ? ListView.builder(
                          itemCount: _foundRefCodes.length,
                          itemBuilder: (context, index) => GestureDetector(
                            onTap: () {
                              // Navigate to the logs_refno.dart screen and pass data as arguments
                              Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                  builder: (context) => LogsRefNoApp(
                                      referenceNo: _foundRefCodes[index]
                                          ['refCode']),
                                ),
                                (route) => true,
                              );
                            },
                            child: Card(
                              key: ValueKey(_foundRefCodes[index]["id"]),
                              color: Colors.red,
                              elevation: 5,
                              margin: EdgeInsets.symmetric(vertical: 10),
                              child: ListTile(
                                leading: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.amberAccent,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  // color: Colors.amberAccent,
                                  child: Icon(
                                    Icons.qr_code,
                                    size: 40,
                                    color: Colors.red,
                                  ),
                                ),
                                title: Text(
                                  _foundRefCodes[index]['refCode'],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Text(
                                  'Validity Date: ${_foundRefCodes[index]["validity"].toString()}',
                                  style: TextStyle(
                                    color: Colors.amberAccent,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      : Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.warning,
                                  color: Colors.amber,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Ref.No. not found!',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ],
                            ),
                          ],
                        ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
