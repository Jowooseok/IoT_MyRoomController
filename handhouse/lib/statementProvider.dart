import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class StatementProvider with ChangeNotifier, DiagnosticableTreeMixin {
  int _bottomNavIndex = 0;

  int getBottomNavIndex() => _bottomNavIndex;

  void setBottomNavIndex(int value) {
    _bottomNavIndex = value;
    notifyListeners();
  }
}
