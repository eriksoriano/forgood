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
        primarySwatch: Colors.teal,
      ),
      home: const MyHomePage(
        title: 'For Good App',
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
  final List<int> _items = List<int>.generate(8, (int index) => index);

  List<String> tasks = [
    "Pick Up Litter",
    "Donate To Needy",
    "Help Someone",
    "Make Someone Smile",
    "Tutor Someone For Free",
    "Buy Someone Food",
    "Buy Someone Water",
    "Buy Someone Fruits"
  ];

// **************************************************************************
// these are CHALLENGE OPPORTUNITIES based on quiz user fills out
// **************************************************************************

  // @override
  Widget _listofOpportunities() {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Color oddItemColor = Color.fromRGBO(139, 200, 89, 1);
    final Color evenItemColor = Color.fromRGBO(101, 189, 184, 1);

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
              if (oldIndex < newIndex) {
                newIndex = newIndex - 1;
                challenge1 = tasks[0];
                challenge2 = tasks[1];
                challenge3 = tasks[2];
                challenge4 = tasks[3];
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

  String challenge1 = "";
  String challenge2 = "";
  String challenge3 = "";
  String challenge4 = "";

  int _counter = 0;

  int _selectedTabIndex = 0;
  double ring1 = 0.0;
  double ring2 = 0.0;
  double ring3 = 0.0;
  double ring4 = 0.0;
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
    final size = 110.0;
    final ringWidth = 10.0;

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          // SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.only(right: 20),
                child: Image(
                  // width: 300,
                  height: 50,
                  image: AssetImage("assets/usericon.png"),
                  fit: BoxFit.fitWidth,
                ),
              ),
              Text(
                "Erik Soriano",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          // the row for smiled and met someone
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text(
                    challenge1,
                    textAlign: TextAlign.center,
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
                          color: Color.fromRGBO(120, 195, 137, 1),
                          backgroundColor: Colors.grey,
                          value: ring1,
                        ),
                        Center(
                          child: Text(
                            complete1,
                            style: TextStyle(
                                color: Color.fromRGBO(120, 195, 137, 1),
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
                        if (ring1 == 1) {
                          complete1 = "100%";
                        } else if (ring1 < 0.2) {
                          ring1 = ring1 + 0.2;
                          // complete1 = '$progress';
                          complete1 = "20%";
                        } else if (ring1 < 0.4) {
                          ring1 = ring1 + 0.2;
                          // complete1 = '$progress';
                          complete1 = "40%";
                        } else if (ring1 < 0.6) {
                          ring1 = ring1 + 0.2;
                          // complete1 = '$progress';
                          complete1 = "60%";
                        } else if (ring1 < 0.8) {
                          ring1 = ring1 + 0.2;
                          // complete1 = '$progress';
                          complete1 = "80%";
                        } else if (ring1 == 0.8) {
                          ring1 = ring1 + 0.2;
                          // complete1 = '$progress';
                          complete1 = "100%";
                        }
                      });
                    },
                    child: Text('Add Progress'),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    challenge2,
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
                          color: Color.fromRGBO(101, 189, 184, 1),
                          backgroundColor: Colors.grey,
                          value: ring2,
                        ),
                        Center(
                          child: Text(
                            complete2,
                            style: TextStyle(
                                color: Color.fromRGBO(101, 189, 184, 1),
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
                        if (ring2 == 1) {
                          complete2 = "100%";
                        } else if (ring2 < 0.2) {
                          ring2 = ring2 + 0.2;
                          // complete1 = '$progress';
                          complete2 = "20%";
                        } else if (ring2 < 0.4) {
                          ring2 = ring2 + 0.2;
                          // complete1 = '$progress';
                          complete2 = "40%";
                        } else if (ring2 < 0.6) {
                          ring2 = ring2 + 0.2;
                          // complete1 = '$progress';
                          complete2 = "60%";
                        } else if (ring2 < 0.8) {
                          ring2 = ring2 + 0.2;
                          // complete1 = '$progress';
                          complete2 = "80%";
                        } else if (ring2 == 0.8) {
                          ring2 = ring2 + 0.2;
                          // complete1 = '$progress';
                          complete2 = "100%";
                        }
                      });
                    },
                    child: Text('Add Progress'),
                  ),
                ],
              )
            ],
          ),
          // the row for went outwside and good day below
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text(
                    challenge3,
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
                          color: Color.fromRGBO(82, 184, 232, 1),
                          backgroundColor: Colors.grey,
                          value: ring3,
                        ),
                        Center(
                          child: Text(
                            complete3,
                            style: TextStyle(
                                color: Color.fromRGBO(82, 184, 232, 1),
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
                        if (ring3 == 1) {
                          complete3 = "100%";
                        } else if (ring3 < 0.2) {
                          ring3 = ring3 + 0.2;
                          // complete1 = '$progress';
                          complete3 = "20%";
                        } else if (ring3 < 0.4) {
                          ring3 = ring3 + 0.2;
                          // complete1 = '$progress';
                          complete3 = "40%";
                        } else if (ring3 < 0.6) {
                          ring3 = ring3 + 0.2;
                          // complete1 = '$progress';
                          complete3 = "60%";
                        } else if (ring3 < 0.8) {
                          ring3 = ring3 + 0.2;
                          // complete1 = '$progress';
                          complete3 = "80%";
                        } else if (ring3 == 0.8) {
                          ring3 = ring3 + 0.2;
                          // complete1 = '$progress';
                          complete3 = "100%";
                        }
                      });
                    },
                    child: Text('Add Progress'),
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
                    challenge4,
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
                          color: Color.fromRGBO(139, 200, 89, 1),
                          backgroundColor: Colors.grey,
                          value: ring4,
                        ),
                        Center(
                          child: Text(
                            complete4,
                            style: TextStyle(
                                color: Color.fromRGBO(139, 200, 89, 1),
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
                        if (ring4 == 1) {
                          complete4 = "100%";
                        } else if (ring4 < 0.2) {
                          ring4 = ring4 + 0.2;
                          // complete1 = '$progress';
                          complete4 = "20%";
                        } else if (ring4 < 0.4) {
                          ring4 = ring4 + 0.2;
                          // complete1 = '$progress';
                          complete4 = "40%";
                        } else if (ring4 < 0.6) {
                          ring4 = ring4 + 0.2;
                          // complete1 = '$progress';
                          complete4 = "60%";
                        } else if (ring4 < 0.8) {
                          ring4 = ring4 + 0.2;
                          // complete1 = '$progress';
                          complete4 = "80%";
                        } else if (ring4 == 0.8) {
                          ring4 = ring4 + 0.2;
                          // complete1 = '$progress';
                          complete4 = "100%";
                        }
                      });
                    },
                    child: Text('Add Progress'),
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
                ring1 = 0.0;
                ring2 = 0.0;
                ring3 = 0.0;
                ring4 = 0.0;
                complete1 = "";
                complete2 = "";
                complete3 = "";
                complete4 = "";
                challenge1 = "";
                challenge2 = "";
                challenge3 = "";
                challenge4 = "";
              });
            },
            style: ElevatedButton.styleFrom(primary: Colors.black),
            child: Text(
              'Start Again',
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

  // double ring4 = 0.0;
  // double _metSomeone = 0.0;
  // double _wentOutside = 0.0;
  // double _goodDay = 0.0;

  @override
  Widget build(BuildContext context) {
    // final size = 80.0;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: AppBar(
          centerTitle: true,
          title: Image.asset(
            'assets/Asset2.png',
            fit: BoxFit.contain,
            width: 50,
          ),
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
        fixedColor: Colors.black,
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
