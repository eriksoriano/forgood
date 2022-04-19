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
        title: 'Flutter Demo Home Page',
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

  void _onItemTapped(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  // Widget _selectTab() {
  //   switch (_selectedTabIndex) {
  //     case 0:
  //       return const Center(child: Icon(Icons.ac_unit, size: 200));
  //     case 1:
  //       return const Center(child: Icon(Icons.home, size: 200));
  //     case 2:
  //       return const Center(child: Icon(Icons.edit, size: 200));
  //     default:
  //       return const Center(child: Icon(Icons.ac_unit, size: 200));
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Your progress below',
            style: Theme.of(context).textTheme.headline6,
          ),
          Row(
            children: [
              CircularProgressIndicator(
                value: 0.8,
              ),
              CircularProgressIndicator(
                value: 0.4,
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTabIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.ac_unit),
            label: 'cars',
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
