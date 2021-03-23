import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class StatementProvider with ChangeNotifier, DiagnosticableTreeMixin {
  String testTitle = "Hello World";

  String getTestTitle() => testTitle;

  void setTitle(String value) {
    testTitle = value;
    notifyListeners();
  }
}
