// import 'dart:ffi';
import 'package:finalproject/list.dart';
import 'package:flutter/material.dart';
// import 'quiz.dart';

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
        return _quiz();
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
//
//
//
//
// **************************************************************************
// list below comes from list.dart
// this lists includes array of all possible challenges users can pick
// we will have 4 array (lists) based on Ayesha's quiz results
// **************************************************************************

  List<listOpportunities> challengenames = [
    listOpportunities("", false),
    listOpportunities("", false),
    listOpportunities("", false),
    listOpportunities("", false),
    listOpportunities("", false),
    listOpportunities("", false),
  ];

  // List<listOpportunities> challengenames = [
  //   listOpportunities("uno", false),
  //   listOpportunities("dos", false),
  //   listOpportunities("tres", false),
  //   listOpportunities("cuatro", false),
  //   listOpportunities("cinco", false),
  //   listOpportunities("seis", false),
  // ];

  List<listOpportunities> selectedThings = [];

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

  List<String> miscCategory = [
    "Donate books",
    "Download 'Be My Eyes'",
    "Use dosomething.org",
    "Download 'Book Share'",
    "Donate on 'Amazon Smile'",
    "Play 'Free Rice'",
  ];

// **************************************************************************
// quiz goes below; we have to figure out how to move it to another page
// **************************************************************************

  Future<void> _showMyDialog2(String output) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Your volunteer category of the week is...'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(output, textScaleFactor: 1.5),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Return'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget _quiz() {
    String dropdownValue = ' ';
    List<String> options = [' ', 'Yes', 'No'];
    @override
    int firstOption = 0;
    int secondOption = 0;
    String output = "";
    List<String> environmentCategory = [
      "Pick-up litter",
      "Collect/make compost",
      "Recycle",
      "Thrift",
      "Eat vegan",
      "Donate Money"
    ];
    List<String> communityCategory = [
      "Tutoring",
      "PenPal Someone",
      "Compliment Someone",
      "Make Someone smile",
      "Donate Food",
      "Sign petitions"
    ];
    void _incrementFirst() {
      setState(() {
        firstOption++;
      });
    }

    void _incrementSecond() {
      setState(() {
        secondOption++;
      });
    }

    void _getCategory() {
      setState(() {
        if (firstOption > secondOption) {
          for (int i = 0; i < environmentCategory.length; i++)
            output += environmentCategory[i] + " \n *";
//output = "Picking up litter, Collecting and making compost, Recycling,
          // "Thrifting, Choosing vegan option, Donating to environmental agency";
        } else if (secondOption > firstOption) {
          for (int i = 0; i < communityCategory.length; i++)
            output += communityCategory[i] + " \n *";
//output = "Tutoring, Penpal someone in need, Give someone a compliment, Make a
          // "stranger smile, Donating to food pantry, Sign human rights petitions";
        } else if (firstOption == secondOption) {
          for (int i = 0; i < miscCategory.length; i++)
            output += miscCategory[i] + " \n *";
//output="Donate books to school, Download and use 'Be My Eyes', Find a
          // "volunteer opportunity @ dosomething.org, Download and use 'Book Share', Donate using 'Amazon Smile', Play 'Free Rice'";
        }
        // _showMyDialog2(challengenames[0].name);
        _showMyDialog2(output);
      });
    }

    void _reset() {
      firstOption = 0;
      secondOption = 0;
      output = "";
    }

    return Center(
      child: Expanded(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Text('1) Are you busy with work or school this week?',
                    textScaleFactor: 1),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.teal.shade100,
                ),
                margin: EdgeInsets.all(30.0),
                padding: EdgeInsets.all(20.0),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.teal[300],
                      onPrimary: Colors.white,
                    ),
                    onPressed: () {
                      _incrementFirst();
                    },
                    child: Text('YES'),
                  ),
                  SizedBox(width: 100),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.teal[300],
                      onPrimary: Colors.white,
                    ),
                    onPressed: () {
                      _incrementSecond();
                    },
                    child: Text('NO'),
                  ),
                ],
              ),
//dropDown(options),
              Container(
                child: Text('2)How are you feeling this week, do you want to ?',
                    textScaleFactor: 1),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.teal.shade100,
                ),
                margin: EdgeInsets.all(30.0),
                padding: EdgeInsets.all(20.0),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.teal[300],
                      onPrimary: Colors.white,
                    ),
                    onPressed: () {
                      _incrementFirst();
                    },
                    child: Text('Leading the pack'),
                  ),
                  SizedBox(width: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.teal[300],
                      onPrimary: Colors.white,
                    ),
                    onPressed: () {
                      _incrementSecond();
                    },
                    child: Text('Following the herd'),
                  ),
                ],
              ),
              Container(
                child: Text('3) Do you prefer the outdoors or indoors?',
                    textScaleFactor: 1),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.teal.shade100,
                ),
                margin: EdgeInsets.all(30.0),
                padding: EdgeInsets.all(20.0),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.teal[300],
                      onPrimary: Colors.white,
                    ),
                    onPressed: () {
                      _incrementFirst();
                    },
                    child: Text('Outdoors'),
                  ),
                  SizedBox(width: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.teal[300],
                      onPrimary: Colors.white,
                    ),
                    onPressed: () {
                      _incrementSecond();
                    },
                    child: Text('Indoors'),
                  ),
                ],
              ),
              Container(
                child: Text('4) Are you free Monday-Friday after 3pm?',
                    textScaleFactor: 1),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.teal.shade100,
                ),
                margin: EdgeInsets.all(30.0),
                padding: EdgeInsets.all(20.0),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.teal[300],
                      onPrimary: Colors.white,
                    ),
                    onPressed: () {
                      _incrementFirst();
                    },
                    child: Text('YES'),
                  ),
                  SizedBox(width: 100),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.teal[300],
                      onPrimary: Colors.white,
                    ),
                    onPressed: () {
                      _incrementSecond();
                    },
                    child: Text('NO'),
                  ),
                ],
              ),
              Container(
                child: Text('5) Do you want to work with animals?',
                    textScaleFactor: 1),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.teal.shade100,
                ),
                margin: EdgeInsets.all(30.0),
                padding: EdgeInsets.all(20.0),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.teal[300],
                      onPrimary: Colors.white,
                    ),
                    onPressed: () {
                      _incrementFirst();
                    },
                    child: Text('YES'),
                  ),
                  SizedBox(width: 100),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.teal[300],
                      onPrimary: Colors.white,
                    ),
                    onPressed: () {
                      _incrementSecond();
                    },
                    child: Text('NO'),
                  ),
                ],
              ),
              Container(
                child: Text('6) Do you want to work with children?',
                    textScaleFactor: 1),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.teal.shade100,
                ),
                margin: EdgeInsets.all(30.0),
                padding: EdgeInsets.all(20.0),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.teal[300],
                      onPrimary: Colors.white,
                    ),
                    onPressed: () {
                      _incrementFirst();
                    },
                    child: Text('YES'),
                  ),
                  SizedBox(width: 100),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.teal[300],
                      onPrimary: Colors.white,
                    ),
                    onPressed: () {
                      _incrementSecond();
                    },
                    child: Text('NO'),
                  ),
                ],
              ),
              Container(
                child: Text('7) Are you free Saturday-Sunday before 11am?',
                    textScaleFactor: 1),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.teal.shade100,
                ),
                margin: EdgeInsets.all(30.0),
                padding: EdgeInsets.all(20.0),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.teal[300],
                      onPrimary: Colors.white,
                    ),
                    onPressed: () {
                      _incrementFirst();
                    },
                    child: Text('YES'),
                  ),
                  SizedBox(width: 100),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.teal[300],
                      onPrimary: Colors.white,
                    ),
                    onPressed: () {
                      _incrementSecond();
                    },
                    child: Text('NO'),
                  ),
                ],
              ),
              Container(
                child: Text(
                    '8) Are you willing to commute 30 minutes every other day?',
                    textScaleFactor: 1),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.teal.shade100,
                ),
                margin: EdgeInsets.all(30.0),
                padding: EdgeInsets.all(20.0),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.teal[300],
                      onPrimary: Colors.white,
                    ),
                    onPressed: () {
                      _incrementFirst();
                    },
                    child: Text('YES'),
                  ),
                  SizedBox(width: 100),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.teal[300],
                      onPrimary: Colors.white,
                    ),
                    onPressed: () {
                      _incrementSecond();
                    },
                    child: Text('NO'),
                  ),
                ],
              ),
              Container(
                child: Text('9) Which do you prefer?', textScaleFactor: 1),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.teal.shade100,
                ),
                margin: EdgeInsets.all(30.0),
                padding: EdgeInsets.all(20.0),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.teal[300],
                      onPrimary: Colors.white,
                    ),
                    onPressed: () {
                      _incrementFirst();
                    },
                    child: Text('Woodworking'),
                  ),
                  SizedBox(width: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.teal[300],
                      onPrimary: Colors.white,
                    ),
                    onPressed: () {
                      _incrementSecond();
                    },
                    child: Text('Developing technology'),
                  ),
                ],
              ),
              Container(
                child: Text('10) Are you free Monday-Friday after 3pm?',
                    textScaleFactor: 1),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.teal.shade100,
                ),
                margin: EdgeInsets.all(30.0),
                padding: EdgeInsets.all(20.0),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.teal[300],
                      onPrimary: Colors.white,
                    ),
                    onPressed: () {
                      _incrementFirst();
                    },
                    child: Text('YES'),
                  ),
                  SizedBox(width: 100),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.teal[300],
                      onPrimary: Colors.white,
                    ),
                    onPressed: () {
                      _incrementSecond();
                    },
                    child: Text('NO'),
                  ),
                ],
              ),
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.teal[500],
                      onPrimary: Colors.white,
                    ),
                    onPressed: () {
                      setState(() {
                        if (firstOption > secondOption) {
                          for (int i = 0; i < environmentCategory.length; i++)
                            challengenames[0].name = environmentCategory[0];
                          challengenames[1].name = environmentCategory[1];
                          challengenames[2].name = environmentCategory[2];
                          challengenames[3].name = environmentCategory[3];
                          challengenames[4].name = environmentCategory[4];
                          challengenames[5].name = environmentCategory[5];
                        } else if (secondOption > firstOption) {
                          for (int i = 0; i < communityCategory.length; i++)
                            challengenames[0].name = communityCategory[0];
                          challengenames[1].name = communityCategory[1];
                          challengenames[2].name = communityCategory[2];
                          challengenames[3].name = communityCategory[3];
                          challengenames[4].name = communityCategory[4];
                          challengenames[5].name = communityCategory[5];
                        } else if (firstOption == secondOption) {
                          for (int i = 0; i < miscCategory.length; i++)
                            challengenames[0].name = miscCategory[0];
                          challengenames[1].name = miscCategory[1];
                          challengenames[2].name = miscCategory[2];
                          challengenames[3].name = miscCategory[3];
                          challengenames[4].name = miscCategory[4];
                          challengenames[5].name = miscCategory[5];
                        }
                      });

                      _getCategory();
                    },
                    child: Text('SUBMIT'),
                  ),
                  SizedBox(width: 20),
                  // ElevatedButton(
                  //   style: ElevatedButton.styleFrom(
                  //     primary: Colors.teal[500],
                  //     onPrimary: Colors.white,
                  //   ),
                  //   onPressed: () {
                  //     _reset();
                  //   },
                  //   child: Text('RESET'),
                  // ),
                ],
              )
//SizedBox(height:50),
            ],
          ),
        ),
      ),
    );
  }

// **************************************************************************
// end of quiz; we have to figure out how to move it to another page
// **************************************************************************

// **************************************************************************
  // widget below is for list of opportunities
  // **************************************************************************

  Widget _selectOpportunities() {
    return SafeArea(
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Text(
            'Select 4 Challenges Bro',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.teal),
          ),
          SizedBox(
            height: 10,
          ),
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
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              selectedThings.length > 0
                  ? ElevatedButton(
                      child: Text(
                        "Select (${selectedThings.length})",
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        print("Select(${selectedThings.length})");
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
              // selectedThings.length > 0
              // ?
              // ElevatedButton(
              //   child: Text(
              //     "Take Quiz Again",
              //     style: TextStyle(fontSize: 20),
              //   ),
              //   onPressed: () {
              //     challenge1 = "";
              //     challenge2 = "";
              //     challenge3 = "";
              //     challenge4 = "";
              //     complete1 = "";
              //     complete2 = "";
              //     complete3 = "";
              //     complete4 = "";
              //     ring1 = 0;
              //     ring2 = 0;
              //     ring3 = 0;
              //     ring4 = 0;
              //   },
              // )
              // :
              // Container(),
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
              Text(
                challenge1,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15),
              ),
              Text(
                challenge2,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  // Text(
                  //   challenge1,
                  //   textAlign: TextAlign.center,
                  //   style: TextStyle(fontSize: 15),
                  // ),
                  // SizedBox(
                  //   height: 10,
                  // ),
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
                  // Text(
                  //   challenge2,
                  //   style: TextStyle(fontSize: 15),
                  // ),
                  // SizedBox(
                  //   height: 10,
                  // ),
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
              Text(
                challenge3,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15),
              ),
              Text(
                challenge4,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15),
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  // Text(
                  //   challenge3,
                  //   style: TextStyle(fontSize: 15),
                  // ),
                  // SizedBox(
                  //   height: 10,
                  // ),
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
                  // Text(
                  //   challenge4,
                  //   style: TextStyle(fontSize: 15),
                  // ),
                  // SizedBox(
                  //   height: 10,
                  // ),
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
            onPressed: _showMyDialog,
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
          title: const Text(
            'HOW TO USE THIS APP?',
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.teal, fontSize: 30),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('1. Start by filling out the quiz'),
                Text('2. Select four challenges to complete'),
                Text('3. Complete all challegnes within a week'),
                Text('4. Select another 4, and repeat'),
                Text('(Or retake the quiz to reveal new challenges)'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(
                'Okay Bro',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    backgroundColor: Colors.black),
              ),
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
