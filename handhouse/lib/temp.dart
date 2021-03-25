import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';

class Asas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
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
                ),
              ),
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
    );
  }
}
