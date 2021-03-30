import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class StatementProvider with ChangeNotifier, DiagnosticableTreeMixin {
  int _bottomNavIndex = 2;
  String _appTitle = '내방날씨';
  bool _airConOnOff = false;
  bool _boilerOnOff = false;
  bool _humidifierOnOff = false;
  bool _windowOpenClose = false;

  bool get windowOpenClose => _windowOpenClose;

  set windowOpenClose(bool value) {
    _windowOpenClose = value;
    notifyListeners();
  }

  int _airConValue = 0;
  int _boilerValue = 18;
  int _humidifierValue = 0;
  String _boilerMode = '실내';

  String get boilerMode => _boilerMode;

  set boilerMode(String value) {
    _boilerMode = value;
    notifyListeners();
  }

  bool get boilerOnOff => _boilerOnOff;

  set boilerOnOff(bool value) {
    _boilerOnOff = value;
    notifyListeners();
  }

  int get bottomNavIndex => _bottomNavIndex;

  set bottomNavIndex(int value) {
    _bottomNavIndex = value;
    switch (_bottomNavIndex) {
      case 0:
        setAppTitle('내방날씨[창문]');
        break;
      case 1:
        setAppTitle('내방날씨[에어컨]');
        break;
      case 2:
        setAppTitle('내방날씨');
        break;
      case 3:
        setAppTitle('내방날씨[보일러]');
        break;
      case 4:
        setAppTitle('내방날씨[가습기]');
        break;
      default:
        setAppTitle('내방날씨');
        break;
    }
  }

  String get appTitle => _appTitle;

  void setAppTitle(String value) {
    _appTitle = value;
    notifyListeners();
  }

  bool get humidifierOnOff => _humidifierOnOff;

  set humidifierOnOff(bool value) {
    _humidifierOnOff = value;
    notifyListeners();
  }

  int get airConValue => _airConValue;

  bool get airConOnOff => _airConOnOff;

  set airConOnOff(bool value) {
    _airConOnOff = value;
    notifyListeners();
  }

  set airConValue(int value) {
    _airConValue = value;
    notifyListeners();
  }

  int get boilerValue => _boilerValue;

  set boilerValue(int value) {
    _boilerValue = value;
    notifyListeners();
  }

  int get humidifierValue => _humidifierValue;

  set humidifierValue(int value) {
    _humidifierValue = value;
    notifyListeners();
  }
}
