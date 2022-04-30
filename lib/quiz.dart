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
  String dropdownValue = ' ';
  List<String> options = [' ', 'Yes', 'No'];
  @override
  int firstOption = 0;
  int secondOption = 0;
  String output = "";
  List<String> environmentCategory = [
    "Picking up litter",
    "Collecting and making compost",
    "Recycling",
    "Thrifting",
    "Choosing vegan options",
    "Donating to environmental agency"
  ];
  List<String> communityCategory = [
    "Tutoring",
    "PenPal someone in need",
    "Give someone a compliment",
    "Make a stranger smile",
    "Donating food to pantry",
    "Sign human rights petitions"
  ];
  List<String> miscCategory = [
    "Donate books to schools",
    "Download and use 'Be My Eyes'",
    "Find a volunteer opportunity @ dosomething.org",
    "Download and use 'Book Share'",
    "Donate using 'Amazon Smile'",
    "Play 'Free Rice'",
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
        "Thrifting, Choosing vegan option, Donating to environmental agency";
      } else if (secondOption > firstOption) {
        for (int i = 0; i < communityCategory.length; i++)
          output += communityCategory[i] + " \n *";
//output = "Tutoring, Penpal someone in need, Give someone a compliment, Make a
        "stranger smile, Donating to food pantry, Sign human rights petitions";
      } else if (firstOption == secondOption) {
        for (int i = 0; i < miscCategory.length; i++)
          output += miscCategory[i] + " \n *";
//output="Donate books to school, Download and use 'Be My Eyes', Find a
        "volunteer opportunity @ dosomething.org, Download and use 'Book Share', Donate using 'Amazon Smile', Play 'Free Rice'";
      }
      _showMyDialog(output);
    });
  }

  Future<void> _showMyDialog(String output) async {
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

  void _reset() {
    firstOption = 0;
    secondOption = 0;
    output = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
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
                  child: Text(
                      '2)How are you feeling this week, do you want to ?',
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
                        _getCategory();
                      },
                      child: Text('SUBMIT'),
                    ),
                    SizedBox(width: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.teal[500],
                        onPrimary: Colors.white,
                      ),
                      onPressed: () {
                        _reset();
                      },
                      child: Text('RESET'),
                    ),
                  ],
                )
//SizedBox(height:50),
              ],
            ),
          ),
        ),
      ),
// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
