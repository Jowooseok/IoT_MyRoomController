import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mdi/mdi.dart';

import 'package:handhouse/statementProvider.dart';

const kMainInformationBoxPadding = EdgeInsets.symmetric(horizontal: 8.0);

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
      title: '내방 날씨',
      home: MyHomePage(title: '내방 날씨'),
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
  int _selectedIndex = 2; //하단 네비게이션 바 인덱스

  List<Widget> _widgetOptions = [
    //각각의 화면 구성
    Text('hi1'),
    Text('hi2'),
    Column(
      children: [
        Expanded(
          flex: 7,
          child: Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Icon(
                        Mdi.bedDoubleOutline, //변할 수 있음
                        size: 40.0,
                        color: Colors.grey, //변할 수 있음
                      ),
                    ),
                    Expanded(
                      flex: 8,
                      child: Padding(
                        padding: kMainInformationBoxPadding, //변경 됨
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.amberAccent.shade100, //변경 됨
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Icon(
                        Mdi.weatherSunny,
                        size: 40.0,
                        color: Colors.grey,
                      ),
                    ),
                    Expanded(
                      flex: 8,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.blue.shade100,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 3,
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      expandedOnOffChangeIconM(
                          Mdi.windowOpenVariant, Colors.orange),
                      expandedOnOffButtonM(
                          'ON', Colors.black, Colors.tealAccent, () {}),
                    ],
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
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Center(
              child: _widgetOptions.elementAt(_selectedIndex),
            ),
          ),
        ),
      ),
    );
  }
}

Expanded expandedOnOffButtonM(String onOffText, Color textColor,
    Color buttonColor, Function buttonFunction) {
  return Expanded(
    flex: 2,
    child: ElevatedButton(
      child: Text(
        onOffText,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 16,
          color: textColor, //바뀔 수 있음
        ),
      ),
      onPressed: buttonFunction,
      style: ElevatedButton.styleFrom(
        shape: CircleBorder(),
        primary: buttonColor, //바낄수 있음
      ),
    ),
  );
}

Expanded expandedOnOffChangeIconM(MdiIconData iconData, Color iconColor) {
  return Expanded(
    flex: 3,
    child: Icon(
      iconData, //바뀔 수 있음
      size: 35.0,
      color: iconColor, //바뀔 수 있음
    ),
  );
}
