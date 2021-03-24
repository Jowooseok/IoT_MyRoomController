import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mdi/mdi.dart';

import 'package:handhouse/statementProvider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => StatementProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hand House',
      home: MyHomePage(title: 'Hand House'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  MyHomePage({this.title});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 2;

  List<Widget> _widgetOptions = [
    //각각의 화면 구성
    Text('hi1'),
    Text('hi2'),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 1,
          child: Row(
            children: [
              Expanded(
                  child: Icon(
                Mdi.bedDoubleOutline,
                size: 40.0,
                color: Colors.grey,
              )),
              Expanded(
                child: Icon(
                  Mdi.weatherSunny,
                  size: 40.0,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 4,
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.amberAccent.shade100,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blueAccent.shade100,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  Mdi.windowOpenVariant,
                  size: 35.0,
                  color: Colors.grey,
                ),
              ),
              Expanded(
                child: Icon(
                  Mdi.airConditioner,
                  size: 35.0,
                  color: Colors.grey,
                ),
              ),
              Expanded(
                child: Icon(
                  Mdi.waterBoiler,
                  size: 35.0,
                  color: Colors.grey,
                ),
              ),
              Expanded(
                child: Icon(
                  Mdi.airHumidifier,
                  size: 35.0,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Row(
            children: [
              Expanded(
                child: ConstrainedBox(
                  constraints:
                      BoxConstraints.tightFor(width: 40.0, height: 40.0),
                  child: ElevatedButton(
                    child: Text(
                      'ON',
                      style: TextStyle(fontSize: 16),
                    ),
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      primary: Colors.blue,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ConstrainedBox(
                  constraints:
                      BoxConstraints.tightFor(width: 40.0, height: 40.0),
                  child: ElevatedButton(
                    child: Text(
                      'OFF',
                      style: TextStyle(fontSize: 16),
                    ),
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: Colors.grey,
                      shape: CircleBorder(),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ConstrainedBox(
                  constraints:
                      BoxConstraints.tightFor(width: 40.0, height: 40.0),
                  child: ElevatedButton(
                    child: Text(
                      'ON',
                      style: TextStyle(fontSize: 16),
                    ),
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      shape: CircleBorder(),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ConstrainedBox(
                  constraints:
                      BoxConstraints.tightFor(width: 40.0, height: 40.0),
                  child: ElevatedButton(
                    child: Text(
                      'OFF',
                      style: TextStyle(fontSize: 16),
                    ),
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: Colors.grey,
                      shape: CircleBorder(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
    Text('hi4'),
    Text('hi5'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          widget.title,
          style: TextStyle(color: Colors.black),
        ),
        leading: Icon(
          Icons.menu,
          color: Colors.black,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Mdi.windowClosedVariant),
            label: '창문',
          ),
          BottomNavigationBarItem(
            icon: Icon(Mdi.airConditioner),
            label: '에어컨',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(Mdi.waterBoiler),
            label: '보일러',
          ),
          BottomNavigationBarItem(
            icon: Icon(Mdi.airHumidifier),
            label: '가습기',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        type: BottomNavigationBarType.fixed,
        onTap: (i) => {
          setState(() {
            _selectedIndex = i;
          })
        },
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
    );
  }
}
