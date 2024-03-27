import 'package:asco_online_tracking/audio/arec_start.dart';
import 'package:asco_online_tracking/logs/logs_refno.dart';
import 'package:asco_online_tracking/main/about.dart';
import 'package:asco_online_tracking/main/accountpage.dart';
import 'package:asco_online_tracking/scanning/scan_start.dart';
import 'package:asco_online_tracking/video/vrec_start.dart';
import 'package:floating_action_bubble/floating_action_bubble.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "homepage",
    theme: ThemeData(
      useMaterial3: false,
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: Colors.red,
      ),
    ),
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final List<Map<String, dynamic>> _allRefCodes = [
    {"id": 1, "refCode": "S0142I090523S", "validity": '2023-09-08'},
    {"id": 2, "refCode": "S0003I090723S", "validity": '2023-09-25'},
    {"id": 3, "refCode": "M0067P091323E", "validity": '2023-10-01'},
    {"id": 4, "refCode": "P0081P090423R", "validity": '2024-09-03'},
    {"id": 5, "refCode": "D0061P090523R", "validity": '2024-09-04'},
  ];

  // This list holds the data for the list view
  List<Map<String, dynamic>> _foundRefCodes = [];

  late Animation<double> _animation;
  late AnimationController _animController;
  IconData currentIcon = Icons.arrow_circle_right;
  Color currentColor = Colors.red;
  Color currentBG = Colors.white;
  bool isMenuOpen = false;

  @override
  initState() {
    _foundRefCodes = _allRefCodes;
    _animController = AnimationController(
      duration: Duration(milliseconds: 200),
      vsync: this,
    );

    final curvedAnimation =
        CurvedAnimation(curve: Curves.easeInOutCubic, parent: _animController);
    _animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);

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
            Icon(Icons.home_filled),
            SizedBox(
              width: 8,
            ),
            Text('Homepage'),
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
            padding: EdgeInsets.only(top: 30, left: 15, right: 15),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                    border: Border.all(
                      color: Colors.black.withOpacity(.8),
                      width: 2.0,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 3.0,
                            bottom: 5.0,
                          ),
                          child: Text(
                            "SCANNERS",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 21,
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                            border: Border.all(
                              color: Colors.black.withOpacity(.8),
                              width: 2.0,
                            ),
                          ),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(10),
                                  child: SizedBox(
                                    width: 100,
                                    height: 100,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => ARecord1()),
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                        elevation: 5,
                                        shadowColor: Colors.black,
                                        padding: EdgeInsets.zero,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                      ),
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Icon(Icons.spatial_audio),
                                            SizedBox(height: 8),
                                            Text('AUDIO'),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(10),
                                  child: SizedBox(
                                    width: 100,
                                    height: 100,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Scan1()),
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.red.shade700,
                                        elevation: 5,
                                        shadowColor: Colors.black,
                                        padding: EdgeInsets.zero,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                      ),
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Icon(Icons.camera_front),
                                            SizedBox(height: 8),
                                            Text('CAMERA'),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(10),
                                  child: SizedBox(
                                    width: 100,
                                    height: 100,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => VRecord1()),
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                        elevation: 5,
                                        shadowColor: Colors.black,
                                        padding: EdgeInsets.zero,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                      ),
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Icon(Icons.video_camera_front),
                                            SizedBox(height: 8),
                                            Text('VIDEO'),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                      border: Border.all(
                        color: Colors.black.withOpacity(.7),
                        width: 2.0,
                      ),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        colors: [
                          Colors.black.withOpacity(0.3),
                          Colors.red.shade700.withOpacity(0.9),
                        ],
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(top: 10, left: 15, right: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 3.0,
                              bottom: 5.0,
                            ),
                            child: Text(
                              "MY LOGS",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                                fontSize: 21,
                              ),
                            ),
                          ),
                          TextField(
                            onChanged: (value) => _runFilter(value),
                            style: TextStyle(
                              color: Colors.red,
                            ),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15),
                                ),
                                borderSide: BorderSide(
                                  color: Colors.red,
                                  width: 4,
                                ),
                              ),
                              hintText: 'Search Ref.Code',
                              hintStyle: TextStyle(
                                color: Colors.red.shade200,
                              ),
                              labelStyle: TextStyle(
                                color: Colors.red,
                              ),
                              suffixIcon: Icon(
                                Icons.search,
                                color: Colors.red,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          _foundRefCodes.isNotEmpty
                              ? Expanded(
                            child: ListView.builder(
                              itemCount: _foundRefCodes.length,
                              itemBuilder: (context, index) => GestureDetector(
                                onTap: () {
                                  // Navigate to the logs_refno.dart screen and pass data as arguments
                                  Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                      builder: (context) => LogsRefNoApp(
                                          referenceNo: _foundRefCodes[index]['refCode']),
                                    ),
                                        (route) => true,
                                  );
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(30),
                                  child: Card(
                                    key: ValueKey(_foundRefCodes[index]["id"]),
                                    color: Colors.red,
                                    elevation: 5,
                                    margin: EdgeInsets.symmetric(vertical: 5),
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
                        ],
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(15.0),
        child: FloatingActionBubble(
          items: [
            Bubble(
              icon: Icons.account_circle,
              iconColor: Colors.red,
              title: 'My Account',
              bubbleColor: Colors.white,
              onPress: () {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (context) => AccountPage(),
                  ),
                  (route) => true,
                );
              },
              titleStyle: TextStyle(
                color: Colors.red,
              ),
            ),
            Bubble(
              icon: Icons.info,
              iconColor: Colors.red,
              title: 'About App',
              bubbleColor: Colors.white,
              onPress: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AboutApp(),
                  ),
                );
              },
              titleStyle: TextStyle(
                color: Colors.red,
              ),
            ),
            Bubble(
              icon: Icons.more_horiz,
              iconColor: Colors.red,
              title: 'Coming soon!',
              bubbleColor: Colors.white,
              onPress: () {},
              titleStyle: TextStyle(
                color: Colors.red,
              ),
            ),
          ],
          animation: _animation,
          onPress: () {
            _animController.isCompleted
                ? _animController.reverse()
                : _animController.forward();
            setState(() {
              isMenuOpen = !isMenuOpen;
              currentIcon = isMenuOpen
                  ? Icons.arrow_circle_left
                  : Icons.arrow_circle_right;
              currentColor = isMenuOpen ? Colors.white : Colors.red.shade700;
              currentBG = isMenuOpen ? Colors.yellow.shade700 : Colors.white;
            });
          },
          iconColor: currentColor,
          iconData: currentIcon,
          backGroundColor: currentBG,
        ),
      ),
    );
  }
}
