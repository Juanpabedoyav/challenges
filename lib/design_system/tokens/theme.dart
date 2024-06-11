import 'package:challenge1/design_system/tokens/colors.dart';
import 'package:flutter/material.dart';

class Themes {
  Themes._();
  static ThemeData defaultTheme = ThemeData(
    fontFamily: 'Poppins',
    primaryColor: BaseColors.brandPrimary,
    textTheme: const TextTheme(
      displayLarge: TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold),
      displayMedium: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
      displaySmall: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),
      headlineLarge: TextStyle(fontSize: 21.0, color: BaseColors.bgWhite),
      bodyLarge: TextStyle(fontSize: 14.0),
      bodyMedium: TextStyle(fontSize: 13.0),
      bodySmall: TextStyle(fontSize: 10.0),
    ),
  );
}
