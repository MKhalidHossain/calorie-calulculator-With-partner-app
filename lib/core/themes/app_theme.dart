import 'package:flutter/material.dart';
import 'package:shevaandrii/core/themes/app_colors.dart';

class AppTheme {
  static LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomLeft,
    colors: [
      AppColors.prymarybackgrounr,
      AppColors.secondarybackgrounr,
      AppColors.thirdbackgrounr,
    ],
  );
  static ThemeData get themeData {
    return ThemeData(
      scaffoldBackgroundColor: Colors.black,
      primaryColor: const Color(0xFF6A11CB),
      fontFamily: 'Roboto',
    );
  }
  static Widget withGradientBackground({required Widget child}) {
    return Container(
      decoration: BoxDecoration(gradient: AppTheme.primaryGradient),
      child: child,
    );
  }
}
