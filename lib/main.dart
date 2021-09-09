import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:swagit/user-list.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int _selectedIndex = 0;

  @override
  List<Widget> _widgetOptions = <Widget>[
    Text('Index 2: Home'),
    UsersList(),
    Text('Index 2: Circle'),
    Text('Index 3: Settings'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }




  Widget build(BuildContext context) {

    return Scaffold(
      body:Center(child: _widgetOptions.elementAt(_selectedIndex)),
      bottomNavigationBar: Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
          topRight: Radius.circular(30), topLeft: Radius.circular(30)
          ),
        boxShadow: [
          BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
        ],
      ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed ,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: ''
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.auto_awesome_mosaic),
                  label: ''
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.circle),
                  label: ''
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: ''
              )
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.blue,
            onTap: _onItemTapped,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FloatingActionButton(
          onPressed: (){},
          tooltip: 'Increment',
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}