import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();
  static const Color sucessColor = Color(0xff22C55E);
  static final ThemeData light = ThemeData(
    primaryColor: const Color(0xffE5EBE9),
    secondaryHeaderColor: const Color(0xff0F523A),
    // ignore: deprecated_member_use
    errorColor: const Color(0xffEF4444),
    progressIndicatorTheme:
        const ProgressIndicatorThemeData(color: Color(0xff36AA82)),
        
  );


  static final ThemeData dark = ThemeData(
      primaryColor: const Color(0xffE5EBE9),
      secondaryHeaderColor: const Color(0xff0F523A),
      // ignore: deprecated_member_use
      errorColor: const Color(0xffF87171),
      progressIndicatorTheme:
          const ProgressIndicatorThemeData(color: Color(0xff65C4A0)));

          
}
