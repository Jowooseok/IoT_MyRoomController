import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:mdi/mdi.dart';

import 'package:handhouse/statementProvider.dart';

const kMainInformationBoxPadding = EdgeInsets.symmetric(horizontal: 8.0);
const kMainInformationBoxMyRoomIconSize = 35.0;
const kMainInformationBoxMyRoomTextSize = 18.0;
const kMainInformationBoxOutdoorValueTextSize = 16.0;

class MainHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var stateProviders = Provider.of<StatementProvider>(context);
    return Column(
      children: [
        Expanded(
          flex: 7,
          child: Row(
            children: [
              homeExpandedIconContainerM(
                Mdi.homeAnalytics,
                Colors.blueGrey,
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(
                          'assets/images/thermometer.png',
                          width: kMainInformationBoxMyRoomIconSize,
                          height: kMainInformationBoxMyRoomIconSize,
                        ),
                        Text(
                          '17º', //변함
                          style: TextStyle(
                              fontSize: kMainInformationBoxMyRoomTextSize),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(
                          'assets/images/humidity.png',
                          width: kMainInformationBoxMyRoomIconSize,
                          height: kMainInformationBoxMyRoomIconSize,
                        ),
                        Text(
                          stateProviders.humidifierValue.toString() + '%', //변함
                          style: TextStyle(
                              fontSize: kMainInformationBoxMyRoomTextSize),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              homeExpandedIconContainerM(
                Mdi.weatherSunny,
                Colors.blueGrey,
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(Icons.location_on),
                                Center(
                                  child: Text(
                                    '복대동',
                                    style: TextStyle(
                                        fontSize: 16.0, color: Colors.black),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              ' ' + '3월 31일 수요일 오후 9:18',
                              style: TextStyle(
                                  fontSize: 10.0, color: Colors.grey.shade700),
                              textAlign: TextAlign.start,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset(
                                  'assets/images/thermometer.png',
                                  width: kMainInformationBoxMyRoomIconSize,
                                  height: kMainInformationBoxMyRoomIconSize,
                                ),
                                Text(
                                  stateProviders.humidifierValue.toString() +
                                      'º / ' +
                                      stateProviders.humidifierValue
                                          .toString() +
                                      'º ', //변함
                                  style: TextStyle(
                                      fontSize:
                                          kMainInformationBoxOutdoorValueTextSize),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset(
                                  'assets/images/rain2.png',
                                  width: kMainInformationBoxMyRoomIconSize,
                                  height: kMainInformationBoxMyRoomIconSize,
                                ),
                                Text(
                                  ' ' +
                                      stateProviders.humidifierValue
                                          .toString() +
                                      '%', //변함
                                  style: TextStyle(
                                      fontSize:
                                          kMainInformationBoxOutdoorValueTextSize),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(20.0),
                              ),
                              color: Colors.blueGrey),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // homeExpandedIconContainerM(Mdi.weatherSunny, Colors.grey),
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
                      stateProviders.windowOpenClose
                          ? homeExpandedOnOffChangeIconM(
                              Mdi.windowOpenVariant, Colors.blue)
                          : homeExpandedOnOffChangeIconM(
                              Mdi.windowClosedVariant, Colors.grey),
                      stateProviders.windowOpenClose
                          ? homeExpandedOnOffButtonM(
                              'OFF', Colors.white, Colors.grey, () {
                              stateProviders.windowOpenClose = false;
                            })
                          : homeExpandedOnOffButtonM(
                              'ON', Colors.white, Colors.blue, () {
                              stateProviders.windowOpenClose = true;
                            })
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
                      stateProviders.airConOnOff
                          ? homeExpandedOnOffChangeIconM(
                              Mdi.airConditioner, Colors.blue)
                          : homeExpandedOnOffChangeIconM(
                              Mdi.airConditioner, Colors.grey),
                      stateProviders.airConOnOff
                          ? homeExpandedOnOffButtonM(
                              'OFF', Colors.white, Colors.grey, () {
                              stateProviders.airConOnOff = false;
                            })
                          : homeExpandedOnOffButtonM(
                              'ON', Colors.white, Colors.blue, () {
                              stateProviders.airConOnOff = true;
                            })
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
                      stateProviders.boilerOnOff
                          ? homeExpandedOnOffChangeIconM(
                              Mdi.waterBoiler, Colors.blue)
                          : homeExpandedOnOffChangeIconM(
                              Mdi.waterBoilerOff, Colors.grey),
                      stateProviders.boilerOnOff
                          ? homeExpandedOnOffButtonM(
                              'OFF', Colors.white, Colors.grey, () {
                              stateProviders.boilerOnOff = false;
                            })
                          : homeExpandedOnOffButtonM(
                              'ON', Colors.white, Colors.blue, () {
                              stateProviders.boilerOnOff = true;
                            }),
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
                      stateProviders.humidifierOnOff
                          ? homeExpandedOnOffChangeIconM(
                              Mdi.airHumidifier, Colors.blue)
                          : homeExpandedOnOffChangeIconM(
                              Mdi.airHumidifierOff, Colors.grey),
                      stateProviders.humidifierOnOff
                          ? homeExpandedOnOffButtonM(
                              'OFF', Colors.white, Colors.grey, () {
                              stateProviders.humidifierOnOff = false;
                            })
                          : homeExpandedOnOffButtonM(
                              'ON', Colors.white, Colors.blue, () {
                              stateProviders.humidifierOnOff = true;
                            }),
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

Expanded homeExpandedOnOffChangeIconM(MdiIconData iconData, Color iconColor) {
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
    IconData iconData, Color iconColor, Widget childWidget) {
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
              child: childWidget,
              decoration: BoxDecoration(
                //변경 됨
                borderRadius: BorderRadius.circular(20.0),
                border: Border.all(width: 1.0, color: Colors.blueGrey),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
