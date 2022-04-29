// import 'dart:ffi';
import 'package:finalproject/list.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  // DO NOT DELETE OR MOVE THIS OUTTA HERE
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ForGood App',
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
//----------------------------------------------------------------------------------
// widget that changes tabs and each case is a screen (containing their own widget)
//----------------------------------------------------------------------------------

  void _onItemTapped(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  Widget _selectTab() {
    switch (_selectedTabIndex) {
      case 0:
        return Text("quiz will go here after ayesha finish",
            style: TextStyle(fontSize: 30));
      case 1:
        return _profileScreen();
      case 2:
        return _selectOpportunities();
      default:
        return const Center(child: Icon(Icons.home, size: 20));
    }
  }
//----------------------------------------------------------------------------------
// widget that changes tabs and each case is a screen (containing their own widget)
//----------------------------------------------------------------------------------

// **************************************************************************
// list below comes from list.dart
// this lists includes array of all possible challenges users can pick
// we will have 4 array (lists) based on Ayesha's quiz results
// **************************************************************************

  List<listOpportunities> challengenames = [
    listOpportunities("Pick Up Litter", false),
    listOpportunities("Donate To Needy", false),
    listOpportunities("Help Someone", false),
    listOpportunities("Make Someone Smile", false),
    listOpportunities("Tutor Someone For Free", false),
    listOpportunities("Smoke Weed with Somebody", false),
    listOpportunities("Sing a song", false),
    listOpportunities("get an A in class", false),
    listOpportunities("Share a lighter with someone", false),
    listOpportunities("Give someone a compliment", false),
    listOpportunities("Help the blind", false),
    listOpportunities("Hug someone", false),
  ];

  List<listOpportunities> selectedThings = [];
// **************************************************************************
// the list of items in the list below; this will be moved into a new page
// **************************************************************************
  // final List<int> _items = List<int>.generate(8, (int index) => index);

  // List<String> tasks = [
  //   "Pick Up Litter",
  //   "Donate To Needy",
  //   "Help Someone",
  //   "Make Someone Smile",
  //   "Tutor Someone For Free",
  //   "Buy Someone Food",
  //   "Buy Someone Water",
  //   "Buy Someone Fruits"
  // ];

// **************************************************************************
// these are CHALLENGE OPPORTUNITIES based on quiz user fills out
// **************************************************************************

  // @override
  // Widget _listofOpportunities() {
  //   final ColorScheme colorScheme = Theme.of(context).colorScheme;
  //   final Color oddItemColor = Color.fromRGBO(139, 200, 89, 1);
  //   final Color evenItemColor = Color.fromRGBO(101, 189, 184, 1);

  //   return Container(
  //     padding: EdgeInsets.all(8.0),
  //     child: ReorderableListView(
  //         children: <Widget>[
  //           for (final task in tasks)
  //             Card(
  //               color: Colors.tealAccent,
  //               key: ValueKey(task),
  //               elevation: 5.0,
  //               child: ListTile(
  //                 title: Text(task),
  //                 leading: Icon(Icons.task, color: Colors.black),
  //               ),
  //             ),
  //         ],
  //         onReorder: (oldIndex, newIndex) {
  //           setState(() {
  //             if (oldIndex < newIndex) {
  //               newIndex = newIndex - 1;
  //               challenge1 = tasks[0];
  //               challenge2 = tasks[1];
  //               challenge3 = tasks[2];
  //               challenge4 = tasks[3];
  //             } else if (oldIndex > newIndex) {
  //               newIndex = oldIndex;
  //               challenge1 = tasks[0];
  //               challenge2 = tasks[1];
  //               challenge3 = tasks[2];
  //               challenge4 = tasks[3];
  //             }
  //           });
  //           final task = tasks.removeAt(oldIndex);
  //           tasks.insert(newIndex, task);
  //         }),
  //   );
  // }

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

// **************************************************************************
  // widget below is for list of opportunities
  // **************************************************************************

  Widget _selectOpportunities() {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: challengenames.length,
              itemBuilder: (BuildContext context, int index) {
                // return item!!!!
                return getListBro(
                  challengenames[index].name,
                  challengenames[index].isSelected,
                  index,
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              selectedThings.length > 0
                  ? ElevatedButton(
                      child: Text(
                        "Selected (${selectedThings.length})",
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        print("Selected (${selectedThings.length})");
                        challenge1 = selectedThings[0].name;
                        challenge2 = selectedThings[1].name;
                        challenge3 = selectedThings[2].name;
                        challenge4 = selectedThings[3].name;
                        complete1 = "";
                        complete2 = "";
                        complete3 = "";
                        complete4 = "";
                        ring1 = 0;
                        ring2 = 0;
                        ring3 = 0;
                        ring4 = 0;
                      },
                    )
                  : Container(),
              selectedThings.length > 0
                  ? ElevatedButton(
                      child: Text(
                        "Take Quiz Again",
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        challenge1 = "";
                        challenge2 = "";
                        challenge3 = "";
                        challenge4 = "";
                        complete1 = "";
                        complete2 = "";
                        complete3 = "";
                        complete4 = "";
                        ring1 = 0;
                        ring2 = 0;
                        ring3 = 0;
                        ring4 = 0;
                      },
                    )
                  : Container(),
            ],
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  Widget getListBro(String name, bool isSelected, int index) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.teal,
        child: Icon(Icons.circle_outlined),
      ),
      title: Text(
        name,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      trailing: isSelected
          ? Icon(
              Icons.check_box,
              color: Colors.black,
            )
          : Icon(
              Icons.check_box_outline_blank,
              color: Colors.grey,
            ),
      onTap: () {
        setState(() {
          challengenames[index].isSelected = !challengenames[index].isSelected;
          // if (challengenames[0].isSelected == true) {
          //   challenge1 = challengenames[0].name;
          // } else {
          //   challenge1 = "";
          // }

          if (challengenames[index].isSelected == true) {
            selectedThings.add(listOpportunities(name, true));
          } else if (challengenames[index].isSelected == false) {
            selectedThings.removeWhere(
                (element) => element.name == challengenames[index].name);
            challenge1 = "";
            challenge2 = "";
            challenge3 = "";
            challenge4 = "";
          }
        });
      },
    );
  }

// **************************************************************************
  // widget below is for the 4 main rings profile
  // **************************************************************************
  Widget _profileScreen() {
    final size = 140.0;
    final ringWidth = 10.0;

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          // SizedBox(
          //   height: 10,
          // ),

          // SizedBox(height: 10.0),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     Container(
          //       padding: EdgeInsets.only(right: 20),
          //       child: Image(
          //         // width: 300,
          //         height: 50,
          //         image: AssetImage("assets/usericon.png"),
          //         fit: BoxFit.fitWidth,
          //       ),
          //     ),
          //     Text(
          //       "Erik Soriano",
          //       style: TextStyle(
          //         fontSize: 25,
          //         fontWeight: FontWeight.bold,
          //       ),
          //     ),
          //   ],
          // ),
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
                                fontSize: 40,
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
                                fontSize: 40,
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
                                fontSize: 40,
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
                                fontSize: 40,
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
                          complete4 = "20%";
                        } else if (ring4 < 0.4) {
                          ring4 = ring4 + 0.2;
                          complete4 = "40%";
                        } else if (ring4 < 0.6) {
                          ring4 = ring4 + 0.2;
                          complete4 = "60%";
                        } else if (ring4 < 0.8) {
                          ring4 = ring4 + 0.2;
                          complete4 = "80%";
                        } else if (ring4 == 0.8) {
                          ring4 = ring4 + 0.2;
                          complete4 = "100%";
                        }
                      });
                    },
                    child: Text('Add Progress'),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 10,
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
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
  // end of widget for entire SCREEN for profile tab

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: new Text(
          'ForGood',
          style: TextStyle(fontSize: 30),
        ),
        actions: [
          // action button
          IconButton(
            icon: Icon(Icons.info),
            iconSize: 40,
            onPressed: () {},
          ),
        ],
        leading: IconButton(
          icon: Image.asset('assets/Asset1.png'),
          onPressed: () {},
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
      body: Center(
        child: _selectTab(),
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
        ],
      ),
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('AlertDialog Title'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('This is a demo alert dialog.'),
                Text('Would you like to approve of this message?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Approve'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
