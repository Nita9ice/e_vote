import 'package:flutter/material.dart';

/// AppTheme is a central class that defines both light and dark themes
/// for the entire e-Voting mobile application.
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
    scaffoldBackgroundColor: const Color.fromRGBO(18, 18, 18, 1), // Very dark background

    // Primary color stays the same (Deep Blue)
    primaryColor: const Color.fromRGBO(26, 35, 126, 1),

   
  );
}
