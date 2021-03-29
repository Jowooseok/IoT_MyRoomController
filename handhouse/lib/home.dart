import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';

const kMainInformationBoxPadding = EdgeInsets.symmetric(horizontal: 8.0);

class MainHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 7,
          child: Row(
            children: [
              homeExpandedIconContainerM(Mdi.bedDoubleOutline, Colors.grey,
                  Colors.amberAccent.shade100),
              homeExpandedIconContainerM(
                  Mdi.weatherSunny, Colors.amber, Colors.blue.shade100),
            ],
          ),
        ),
        Expanded(
          flex: 3,
          child: Row(
            children: [
              Expanded(
                //창문
                child: Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      homeExpandedOnOffChangeIconM(
                          Mdi.windowOpenVariant, Colors.teal, () {}),
                      homeExpandedOnOffButtonM(
                          'ON', Colors.black, Colors.tealAccent, () {}),
                    ],
                  ),
                ),
              ),
              Expanded(
                //에어컨
                child: Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      homeExpandedOnOffChangeIconM(
                          Mdi.airConditioner, Colors.grey, () {}),
                      homeExpandedOnOffButtonM(
                          'OFF', Colors.white, Colors.grey, () {}),
                    ],
                  ),
                ),
              ),
              Expanded(
                //보일러
                child: Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      homeExpandedOnOffChangeIconM(
                          Mdi.waterBoiler, Colors.teal, () {}),
                      homeExpandedOnOffButtonM(
                          'ON', Colors.black, Colors.tealAccent, () {}),
                    ],
                  ),
                ),
              ),
              Expanded(
                //가습기
                child: Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      homeExpandedOnOffChangeIconM(
                          Mdi.airHumidifier, Colors.teal, () {}),
                      homeExpandedOnOffButtonM(
                          'ON', Colors.black, Colors.tealAccent, () {}),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

Expanded homeExpandedOnOffButtonM(String onOffText, Color textColor,
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

Expanded homeExpandedOnOffChangeIconM(
    MdiIconData iconData, Color iconColor, Function onPressedFunction) {
  return Expanded(
    flex: 3,
    child: Icon(
      iconData, //바뀔 수 있음
      size: 35.0,
      color: iconColor, //바뀔 수 있음
    ),
  );
}

Expanded homeExpandedIconContainerM(
    IconData iconData, Color iconColor, Color boxColor) {
  return Expanded(
    child: Column(
      children: [
        Expanded(
          flex: 2,
          child: Icon(
            iconData, //변할 수 있음
            size: 40.0,
            color: iconColor, //변할 수 있음
          ),
        ),
        Expanded(
          flex: 8,
          child: Padding(
            padding: kMainInformationBoxPadding,
            child: Container(
              decoration: BoxDecoration(
                color: boxColor, //변경 됨
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
