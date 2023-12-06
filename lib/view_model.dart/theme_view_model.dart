import 'package:flutter/material.dart';

class ThemeViewModel extends ChangeNotifier {
  ThemeData _themeData;

  ThemeViewModel(this._themeData);

  ThemeData getTheme() => _themeData;

  void setTheme(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }
}
