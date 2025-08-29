// lib/core/app_dimension.dart
import 'package:flutter/material.dart';

class AppDimensions {
  late BuildContext context;
  late double screenWidth;
  late double screenHeight;
  late bool isPortrait;
  late bool isLandscape;
  late EdgeInsets safePadding;

  AppDimensions(this.context) {
    final mediaQuery = MediaQuery.of(context);
    screenWidth = mediaQuery.size.width;
    screenHeight = mediaQuery.size.height;
    isPortrait = screenHeight > screenWidth;
    isLandscape = screenWidth > screenHeight;
    safePadding = mediaQuery.padding;
  }

  // Get responsive width by percentage of screen width
  double widthPercent(double percent) => screenWidth * (percent / 100);

  // Get responsive height by percentage of screen height
  double heightPercent(double percent) => screenHeight * (percent / 100);

  // Common padding/margin values
  double get paddingSmall => widthPercent(2); // ~8px on a 400px-wide screen
  double get paddingMedium => widthPercent(4); // ~16px
  double get paddingLarge => widthPercent(8); // ~32px

  // Common spacing values
  double get spacingSmall => heightPercent(2); // ~16px on an 800px-high screen
  double get spacingMedium => heightPercent(3); // ~24px
  double get spacingLarge => heightPercent(5); // ~40px
  double get spacingExtraLarge => heightPercent(30); // ~240px for top spacing

  // Font sizes
  double get fontSizeSmall => widthPercent(4); // ~16px
  double get fontSizeMedium => widthPercent(5); // ~20px
  double get fontSizeLarge => widthPercent(9); // ~36px
  double get fontSizeXLarge => widthPercent(12); // ~48px

  // Border radius
  double get borderRadius => widthPercent(5); // ~20px
}