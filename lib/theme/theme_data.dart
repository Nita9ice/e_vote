import 'package:flutter/material.dart';

// The app theme class define the theme data for the app
class AppTheme {

  // ------------------ LIGHT THEME ------------------
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light, // Sets the base brightness mode to light

    // Scaffold background color for the entire screen
    scaffoldBackgroundColor: const Color.fromRGBO(245, 245, 245, 1),

    // Primary color used for AppBars, buttons, accents
    primaryColor: const Color.fromRGBO(26, 35, 126, 1), // Deep Blue

  );


  // ------------------ DARK THEME ------------------
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark, // Dark mode base brightness

    // Scaffold background for dark mode
    scaffoldBackgroundColor: const Color.fromRGBO(18, 18, 18, 1), 

    // Primary color stays the same (Deep Blue)
    primaryColor: const Color.fromRGBO(26, 35, 126, 1),

   
  );
}
