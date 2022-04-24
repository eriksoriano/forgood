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
  final List<int> _items = List<int>.generate(20, (int index) => index);

  // List<String> tasks = [
  //   "A Task",
  //   "B Task",
  //   "C Task",
  //   "D Task",
  //   "E Task",
  //   "F Task",
  //   "G Task",
  //   "H Task"
  // ];

  @override
  Widget _listofOpportunities() {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Color oddItemColor = colorScheme.primary.withOpacity(0.05);
    final Color evenItemColor = colorScheme.primary.withOpacity(0.15);

    return ReorderableListView(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      children: <Widget>[
        for (int index = 0; index < _items.length; index += 1)
          ListTile(
            key: Key('$index'),
            tileColor: _items[index].isOdd ? oddItemColor : evenItemColor,
            title: Text('Suggestion ${_items[index]}'),
          ),
      ],
      onReorder: (int oldIndex, int newIndex) {
        setState(() {
          if (oldIndex < newIndex) {
            newIndex -= 1;
          }
          final int item = _items.removeAt(oldIndex);
          _items.insert(newIndex, item);
        });
      },
    );
    // return Container(
    //   padding: EdgeInsets.all(8.0),
    //   child: ReorderableListView(
    //       children: [
    //         for (final task in tasks)
    //           Card(
    //             color: Colors.lightBlueAccent.shade100,
    //             key: ValueKey(task),
    //             elevation: 5.0,
    //             child: ListTile(
    //               title: Text(task),
    //               leading: Icon(Icons.work, color: Colors.black),
    //             ),
    //           ),
    //       ],
    //       onReorder: (oldIndex, newIndex) {
    //         setState(() {
    //           if (newIndex > oldIndex) {
    //             newIndex = newIndex - 1;
    //           }
    //         });
    //         final task = tasks.removeAt(oldIndex);
    //         tasks.insert(newIndex, task);
    //       }),
    // );
  }

// **************************************************************************
  // these are GLOBAL functions to avoid the four main challenge rings
  // **************************************************************************

  int _selectedTabIndex = 0;
  double _pickup = 0.0;
  double _donate = 0.0;
  double _help = 0.0;
  double _smile = 0.0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

// start of widget for entire SCREEN for profile tab
  Widget _profileScreen() {
    final size = 100.0;

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
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
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text(
                    'Pick Up',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: 10,
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
                          strokeWidth: 10,
                          color: Colors.red,
                          backgroundColor: Colors.grey,
                          value: _pickup,
                        ),
                        Center(
                          child: Text(
                            "0%",
                            style: TextStyle(fontSize: 30),
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
                        _pickup = _pickup + 0.2;
                      });
                    },
                    child: Text('Update (+)'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        // _goodDay = _goodDay + 0.2;
                      });
                    },
                    style: ElevatedButton.styleFrom(primary: Colors.green),
                    child: Text(
                      'Send Challenge',
                      style: TextStyle(fontSize: 10),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    'Donate',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: 10,
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
                          strokeWidth: 10,
                          color: Colors.orange,
                          backgroundColor: Colors.grey,
                          value: _donate,
                        ),
                        Center(
                          child: Text(
                            "0%",
                            style: TextStyle(fontSize: 30),
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
                        _donate = _donate + 0.2;
                      });
                    },
                    child: Text('Update (+)'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        // _goodDay = _goodDay + 0.2;
                      });
                    },
                    style: ElevatedButton.styleFrom(primary: Colors.green),
                    child: Text(
                      'Send Challenge',
                      style: TextStyle(fontSize: 10),
                    ),
                  ),
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
                    'Help Someone',
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
                          strokeWidth: 10,
                          color: Colors.purple,
                          backgroundColor: Colors.grey,
                          value: _help,
                        ),
                        Center(
                          child: Text(
                            "0%",
                            style: TextStyle(fontSize: 30),
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
                        _help = _help + 0.2;
                      });
                    },
                    child: Text('Update (+)'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        // _goodDay = _goodDay + 0.2;
                      });
                    },
                    style: ElevatedButton.styleFrom(primary: Colors.green),
                    child: Text(
                      'Send Challenge',
                      style: TextStyle(fontSize: 10),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    'Make Someone Smile',
                    style: TextStyle(fontSize: 10),
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
                          strokeWidth: 10,
                          color: Colors.pink,
                          backgroundColor: Colors.grey,
                          value: _smile,
                        ),
                        Center(
                          child: Text(
                            "0%",
                            style: TextStyle(fontSize: 30),
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
                        _smile = _smile + 0.2;
                      });
                    },
                    child: Text('Update (+)'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        // _goodDay = _goodDay + 0.2;
                      });
                    },
                    style: ElevatedButton.styleFrom(primary: Colors.green),
                    child: Text(
                      'Send Challenge',
                      style: TextStyle(fontSize: 10),
                    ),
                  ),
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
        return _listofOpportunities();
      case 1:
        return _profileScreen();
      case 2:
        return Text("Other content will go here once we realize what it is",
            style: TextStyle(fontSize: 30));
      default:
        return const Center(child: Icon(Icons.home, size: 200));
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
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Doo-Good App"),
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.person)),
                Tab(icon: Icon(Icons.notifications)),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              _selectTab(),
              Text(
                "Here is the list of challenges/where user can choose to accept or decline, etc.",
                style: TextStyle(fontSize: 40),
              ),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _selectedTabIndex,
            onTap: _onItemTapped,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.task),
                label: 'Quiz',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'My Profile',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.task),
                label: 'Volunteer',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
