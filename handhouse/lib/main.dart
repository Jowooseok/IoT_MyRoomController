import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mdi/mdi.dart';

import 'package:handhouse/statementProvider.dart';
import 'package:handhouse/home.dart';

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
      home: MyHomePage(title: Provider.of<StatementProvider>(context).appTitle),
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
  int _selectedIndex = 1; //하단 네비게이션 바 인덱스

  List<Widget> _widgetOptions = [
    //각각의 화면 구성
    Text('창문'),
    Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                expandedSizedBoxM(),
                expandedValueContainerM("19", Colors.black, Colors.blue),
                expandedColBottomButtonM(
                    'off', Colors.white, () {}, Colors.grey),
              ],
            ),
          ),
          expandedFlexDetailPageUpDownButton(
              Icons.arrow_upward_rounded, () {}, Colors.red.shade300),
          expandedFlexDetailPageUpDownButton(
              Icons.arrow_downward_rounded, () {}, Colors.blue.shade300),
        ],
      ),
    ),
    MainHome(),
    Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                expandedColBottomButtonM(
                    '실내', Colors.white, () {}, Colors.amber),
                expandedValueContainerM("19", Colors.black, Colors.red),
                expandedColBottomButtonM('on', Colors.white, () {}, Colors.red),
              ],
            ),
          ),
          expandedFlexDetailPageUpDownButton(
              Icons.arrow_upward_rounded, () {}, Colors.red.shade300),
          expandedFlexDetailPageUpDownButton(
              Icons.arrow_downward_rounded, () {}, Colors.blue.shade300),
        ],
      ),
    ),
    Row(
      children: [
        expandedSizedBoxM(),
        expandedValueContainerM("19", Colors.black, Colors.blue),
        expandedColBottomButtonM('ON', Colors.white, () {}, Colors.blue),
      ],
    ),
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
        currentIndex: Provider.of<StatementProvider>(context).bottomNavIndex,
        selectedItemColor: Colors.amber[800],
        type: BottomNavigationBarType.fixed,
        onTap: (i) => {
          Provider.of<StatementProvider>(context, listen: false)
              .bottomNavIndex = i,
        },
      ),
      body: Center(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Center(
              child: _widgetOptions.elementAt(
                  Provider.of<StatementProvider>(context).bottomNavIndex),
            ),
          ),
        ),
      ),
    );
  }
}

Expanded expandedSizedBoxM() {
  return Expanded(
    child: SizedBox(),
  );
}

Expanded expandedDetailPageOnOffButtonM(String onOffText, Color textColor,
    Function onPressedFunction, Color buttonColor) {
  return Expanded(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      child: ElevatedButton(
        child: Text(
          onOffText, //변경
          style: TextStyle(
            fontSize: 16,
            color: textColor, //변경
          ),
        ),
        onPressed: onPressedFunction, //변경
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          primary: buttonColor, //변경가능
        ),
      ),
    ),
  );
}

Expanded expandedDetailPageUpDownButtonM(
    IconData upOrDownIcon, Function onPressedFunction, Color buttonColor) {
  return Expanded(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: ElevatedButton(
        child: Icon(
          upOrDownIcon, //변경 요소
          size: 30.0,
        ),
        onPressed: onPressedFunction, //변경
        style: ElevatedButton.styleFrom(
          shape: CircleBorder(),
          primary: buttonColor, // 변경 요소
        ),
      ),
    ),
  );
}

Expanded expandedFlexDetailPageUpDownButton(
    IconData iconData, Function function, Color color) {
  return Expanded(
    flex: 1,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        expandedSizedBoxM(),
        expandedDetailPageUpDownButtonM(iconData, function, color),
        expandedSizedBoxM(),
      ],
    ),
  );
}

Expanded expandedValueContainerM(
    String value, Color textColor, Color borderColor) {
  return Expanded(
    child: Container(
      child: Center(
        child: Text(
          value + 'ºC', //변경
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 32, color: textColor), //변경
        ),
      ),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(width: 2.0, color: borderColor), //변경
      ),
    ),
  );
}

Expanded expandedColBottomButtonM(
    String text, Color textColor, Function function, Color buttonColor) {
  return Expanded(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        expandedSizedBoxM(),
        expandedSizedBoxM(),
        expandedDetailPageOnOffButtonM(text, textColor, function, buttonColor),
      ],
    ),
  );
}
