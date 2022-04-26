import 'dart:ffi';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Final App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(
        title: 'Introvert Helper',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
// **************************************************************************
// the list of items in the list below; this will be moved into a new page
// **************************************************************************
  final List<int> _items = List<int>.generate(6, (int index) => index);

  List<String> tasks = [
    "Pick Up Litter",
    "Donate To Needy",
    "Help Someone In Need",
    "Make Someone Smile",
    "Tutor Someone For Free",
    "Buy Someone Food",
  ];

// **************************************************************************
// these are CHALLENGE OPPORTUNITIES based on quiz user fills out
// **************************************************************************

  // @override
  Widget _listofOpportunities() {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Color oddItemColor = colorScheme.primary.withOpacity(0.05);
    final Color evenItemColor = colorScheme.primary.withOpacity(0.25);

    return Container(
      padding: EdgeInsets.all(8.0),
      child: ReorderableListView(
          children: <Widget>[
            for (final task in tasks)
              Card(
                color: Colors.lightBlueAccent.shade100,
                key: ValueKey(task),
                elevation: 5.0,
                child: ListTile(
                  title: Text(task),
                  leading: Icon(Icons.task, color: Colors.black),
                ),
              ),
          ],
          onReorder: (oldIndex, newIndex) {
            setState(() {
              if (newIndex > oldIndex) {
                newIndex = newIndex - 1;
              }
            });
            final task = tasks.removeAt(oldIndex);
            tasks.insert(newIndex, task);
          }),
    );
  }

  @override
  Widget _acceptChallenge() {
    bool challenge1 = false;
    bool challenge2 = false;
    bool challenge3 = false;
    bool challenge4 = false;

    return Row(
      children: [
        Text("Challenge"),
        Checkbox(
          value: challenge1,
          onChanged: (bool? value) {
            setState(() {
              challenge1 = false;
            });
          },
        ),
      ],
    );
  }

// **************************************************************************
  // these are GLOBAL variables  to for the four main challenge rings
  // **************************************************************************
  int _counter = 0;

  int _selectedTabIndex = 0;
  double _pickup = 0.0;
  double _donate = 0.0;
  double _help = 0.0;
  double _smile = 0.0;
  int progress = 0;
  String complete1 = "";
  String complete2 = "";
  String complete3 = "";
  String complete4 = "";

  void _onItemTapped(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

// **************************************************************************
  // widget below is for the 4 main rings profile
  // **************************************************************************
  Widget _profileScreen() {
    final size = 80.0;
    final ringWidth = 10.0;

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          // SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Container(
              //   padding: EdgeInsets.only(right: 20),
              //   child: Image(
              //     // width: 300,
              //     height: 60,
              //     image: AssetImage("assets/usericon.png"),
              //     fit: BoxFit.fitWidth,
              //   ),
              // ),
              // Text(
              //   "Your Name Bro",
              //   style: TextStyle(
              //     fontSize: 25,
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          // the row for smiled and met someone
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text(
                    'Pick Up Street Litter',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: size,
                    height: size,
                    // color: Colors.blue,
                    // padding: EdgeInsets.all(20),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        CircularProgressIndicator(
                          strokeWidth: ringWidth,
                          color: Colors.red,
                          backgroundColor: Colors.grey,
                          value: _pickup,
                        ),
                        Center(
                          child: Text(
                            complete1,
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        if (_pickup == 1) {
                          complete1 = "100%";
                        } else {
                          _pickup = _pickup + 0.2;
                          // complete1 = '$progress';
                        }
                      });
                    },
                    child: Text('Update (+)'),
                  ),
                  // ElevatedButton(
                  //   onPressed: () {
                  //     setState(() {
                  //       // _goodDay = _goodDay + 0.2;
                  //     });
                  //   },
                  //   style: ElevatedButton.styleFrom(primary: Colors.green),
                  //   child: Text(
                  //     'Send Challenge',
                  //     style: TextStyle(fontSize: 10),
                  //   ),
                  // ),
                ],
              ),
              Column(
                children: [
                  Text(
                    'Donate To Needy',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: size,
                    height: size,
                    // color: Colors.blue,
                    // padding: EdgeInsets.all(20),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        CircularProgressIndicator(
                          strokeWidth: ringWidth,
                          color: Colors.orange,
                          backgroundColor: Colors.grey,
                          value: _donate,
                        ),
                        Center(
                          child: Text(
                            complete2,
                            style: TextStyle(
                                color: Colors.orange,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        if (_donate == 1) {
                          complete2 = "100%";
                        } else {
                          _donate = _donate + 0.2;
                        }
                      });
                    },
                    child: Text('Update (+)'),
                  ),
                  // ElevatedButton(
                  //   onPressed: () {
                  //     setState(() {
                  //       // _goodDay = _goodDay + 0.2;
                  //     });
                  //   },
                  //   style: ElevatedButton.styleFrom(primary: Colors.green),
                  //   child: Text(
                  //     'Send Challenge',
                  //     style: TextStyle(fontSize: 10),
                  //   ),
                  // ),
                ],
              )
            ],
          ),
          // SizedBox(
          //   height: 10,
          // ),

          // the row for went outwside and good day below
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text(
                    'Help Someone Today',
                    style: TextStyle(fontSize: 15),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: size,
                    height: size,
                    // color: Colors.blue,
                    // padding: EdgeInsets.all(20),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        CircularProgressIndicator(
                          strokeWidth: ringWidth,
                          color: Colors.deepPurple,
                          backgroundColor: Colors.grey,
                          value: _help,
                        ),
                        Center(
                          child: Text(
                            complete3,
                            style: TextStyle(
                                color: Colors.deepPurple,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        if (_help == 1) {
                          complete3 = "100%";
                        } else {
                          _help = _help + 0.2;
                        }
                      });
                    },
                    child: Text('Update (+)'),
                  ),
                  // ElevatedButton(
                  //   onPressed: () {
                  //     setState(() {
                  //       // _goodDay = _goodDay + 0.2;
                  //     });
                  //   },
                  //   style: ElevatedButton.styleFrom(primary: Colors.green),
                  //   child: Text(
                  //     'Send Challenge',
                  //     style: TextStyle(fontSize: 10),
                  //   ),
                  // ),
                ],
              ),
              Column(
                children: [
                  Text(
                    'Make Someone Smile',
                    style: TextStyle(fontSize: 15),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: size,
                    height: size,
                    // color: Colors.blue,
                    // padding: EdgeInsets.all(20),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        CircularProgressIndicator(
                          strokeWidth: ringWidth,
                          color: Colors.pink,
                          backgroundColor: Colors.grey,
                          value: _smile,
                        ),
                        Center(
                          child: Text(
                            complete4,
                            style: TextStyle(
                                color: Colors.pink,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        if (_smile == 1) {
                          complete4 = "100%";
                        } else {
                          _smile = _smile + 0.2;
                        }
                      });
                    },
                    child: Text('Update (+)'),
                  ),
                  // ElevatedButton(
                  //   onPressed: () {
                  //     setState(() {
                  //       // _goodDay = _goodDay + 0.2;
                  //     });
                  //   },
                  //   style: ElevatedButton.styleFrom(primary: Colors.green),
                  //   child: Text(
                  //     'Send Challenge',
                  //     style: TextStyle(fontSize: 10),
                  //   ),
                  // ),
                ],
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _pickup = 0.0;
                _donate = 0.0;
                _help = 0.0;
                _smile = 0.0;
                complete1 = "";
                complete2 = "";
                complete3 = "";
                complete4 = "";
              });
            },
            style: ElevatedButton.styleFrom(primary: Colors.black),
            child: Text(
              'Reset All',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
  // end of widget for entire SCREEN for profile tab

  //----------------------------------------------------------------------------
  //----------------------------------------------------------------------------

  // widget that changes tabs and each case is a screen (containing their own widget)
  // this WIDGET is exclusive to the "Profile" bottom tab though
  Widget _selectTab() {
    switch (_selectedTabIndex) {
      case 0:
        return Text("quiz will go here after ayesha finish",
            style: TextStyle(fontSize: 30));
      case 1:
        return _profileScreen();
      case 2:
        return _listofOpportunities();
      case 3:
        return Text("Other content will go here once we realize what it is",
            style: TextStyle(fontSize: 30));
      default:
        return const Center(child: Icon(Icons.home, size: 20));
    }
  }
  // widget that changes tabs and each case is a screen (containing their own widget)

  // double _smile = 0.0;
  // double _metSomeone = 0.0;
  // double _wentOutside = 0.0;
  // double _goodDay = 0.0;

  @override
  Widget build(BuildContext context) {
    // final size = 80.0;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset(
          'assets/Asset2.png',
          fit: BoxFit.fitWidth,
          width: 50,
        ),
      ),
      body: Center(
        child: _selectTab(),
        // child: Column(
        //   mainAxisAlignment: MainAxisAlignment.end,
        //   children: [
        //     Row(
        //       mainAxisAlignment: MainAxisAlignment.end,
        //       children: [
        //         FloatingActionButton(
        //           onPressed: _incrementCounter,
        //           tooltip: 'Increment',
        //           child: const Icon(
        //             Icons.info_outline_rounded,
        //             size: 50,
        //           ),
        //         ),
        //       ],
        //     ),
        //     SizedBox(
        //       height: 40,
        //     ),
        //   ],
        // ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        // backgroundColor: Colors.black,
        fixedColor: Colors.amber,
        currentIndex: _selectedTabIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.task),
            label: 'Quiz',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.task),
            label: 'Challenges',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
