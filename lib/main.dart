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
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
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
  int _selectedTabIndex = 0;
  double _smile = 0.0;
  double _metSomeone = 0.0;
  double _wentOutside = 0.0;
  double _goodDay = 0.0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = 80.0;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
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
                    height: 100,
                    image: AssetImage("assets/usericon.png"),
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Text(
                  "Your Name Bro",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Text('SOMETHING HERE'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.only(right: 20),
                      child: Image(
                        // width: 300,
                        height: 50,
                        image: AssetImage("assets/trophy.png"),
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(right: 20),
                      child: Image(
                        // width: 300,
                        height: 50,
                        image: AssetImage("assets/trophy.png"),
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(right: 20),
                      child: Image(
                        // width: 300,
                        height: 50,
                        image: AssetImage("assets/trophy.png"),
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    Container(
                      // padding: EdgeInsets.only(right: 20),
                      child: Image(
                        // width: 300,
                        height: 50,
                        image: AssetImage("assets/trophy.png"),
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ],
                )
              ],
            ),
            // Text('WELCOME INTROVER USER'),
            Text(
              'Your Friendly progress below',
              style: Theme.of(context).textTheme.headline6,
            ),
            // the row for smiled and met someone
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      'Smiled',
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      "Completed 1/5",
                      style: TextStyle(fontSize: 15),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: size,
                      height: size,
                      color: Colors.blue,
                      padding: EdgeInsets.all(20),
                      child: CircularProgressIndicator(
                        strokeWidth: 10,
                        color: Colors.white,
                        backgroundColor: Colors.grey,
                        value: _smile,
                      ),
                    ),
                    RaisedButton(
                      onPressed: () {
                        setState(() {
                          _smile = _smile + 0.2;
                        });
                      },
                      child: Text('test1'),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'Met Someone',
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      "Completed 1/5",
                      style: TextStyle(fontSize: 15),
                    ),
                    Container(
                      width: size,
                      height: size,
                      color: Colors.orange,
                      padding: EdgeInsets.all(20),
                      child: CircularProgressIndicator(
                        strokeWidth: 10,
                        color: Colors.white,
                        backgroundColor: Colors.grey,
                        value: _metSomeone,
                      ),
                    ),
                    RaisedButton(
                      onPressed: () {
                        setState(() {
                          _metSomeone = _metSomeone + 0.2;
                        });
                      },
                      child: Text('test2'),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),

            // the row for went outwside and good day below
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      'Went Outside',
                      style: TextStyle(fontSize: 20),
                    ),
                    Container(
                      width: size,
                      height: size,
                      color: Colors.lime,
                      padding: EdgeInsets.all(20),
                      child: CircularProgressIndicator(
                        strokeWidth: 10,
                        color: Colors.white,
                        backgroundColor: Colors.grey,
                        value: _wentOutside,
                      ),
                    ),
                    RaisedButton(
                      onPressed: () {
                        setState(() {
                          _wentOutside = _wentOutside + 0.2;
                        });
                      },
                      child: Text('test3'),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'Good day',
                      style: TextStyle(fontSize: 20),
                    ),
                    Container(
                      width: size,
                      height: size,
                      color: Colors.red,
                      padding: EdgeInsets.all(20),
                      child: CircularProgressIndicator(
                        strokeWidth: 10,
                        color: Colors.white,
                        backgroundColor: Colors.grey,
                        value: _goodDay,
                      ),
                    ),
                    RaisedButton(
                      onPressed: () {
                        setState(() {
                          _goodDay = _goodDay + 0.2;
                        });
                      },
                      child: Text('test4'),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),

            RaisedButton(
              onPressed: () {
                setState(() {
                  _smile = 0.0;
                  _metSomeone = 0.0;
                  _wentOutside = 0.0;
                  _goodDay = 0.0;
                });
              },
              child: Text('RESET ALL'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTabIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.ac_unit),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.edit),
            label: 'edit',
          ),
        ],
      ),
    );
  }
}
