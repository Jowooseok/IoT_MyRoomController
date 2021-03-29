import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class StatementProvider with ChangeNotifier, DiagnosticableTreeMixin {
  int _bottomNavIndex = 2;
  String _appTitle = '내방날씨';

  int get bottomNavIndex => _bottomNavIndex;

  void setBottomNavIndex(int value) {
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
}
