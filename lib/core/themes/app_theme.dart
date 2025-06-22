import 'package:flutter/material.dart';

class AppTheme {
  static LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomLeft,
    colors: [Color(0xFFBAD5F0), Color(0xFFA1BFE5), Color(0xFFFFF2D0)],
    stops: [0.2, 0.6, 1.0],
  );
  static ThemeData get themeData {
    return ThemeData(
      scaffoldBackgroundColor: Colors.black,
      primaryColor: const Color(0xFF6A11CB),
      fontFamily: 'notoSans',
    );
  }

  static Widget withGradientBackground({required Widget child}) {
    return Container(
      decoration: BoxDecoration(gradient: AppTheme.primaryGradient),
      child: child,
    );
  }
}
