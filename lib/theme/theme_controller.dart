import 'package:flutter/material.dart';

// This class manages the app's theme (light or dark mode)
// and notifies listeners when the theme changes.
class ThemeController with ChangeNotifier {
   ThemeMode _themeMode = ThemeMode.system; // default theme based on the device

  // Getter to access the current theme mode
  ThemeMode get themeMode => _themeMode;

 set themeMode(ThemeMode mode){
  _themeMode = mode;
  notifyListeners();
 }
  
   
}
