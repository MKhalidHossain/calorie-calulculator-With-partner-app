import 'dart:math';

import 'package:flutter/material.dart';

class AppColors {
  /// [Primary Background color]
  static const Color background = Color(0xFF0A0A0A);
  static const Color secondarybackground = Color(0xFF2B2B2B);

  /// [Primary App Colors]
  ///
  static const Color buttonbackgroundcolor = Color(0xFFFEF0D2);
  static const Color lightBlue = Color(0xFFBAD5F0);
  
  static const Color white = Color(0xFFFFFFFF);

  /// [Text colors]
  static const Color textFieldBackground = Color(0xFF121212);
  static const Color textFieldTextiHint = Color(0xFF4C4C4C);
  static const Color textFieldBorder = Color(0xFF1F2937);

  static const Color textLink = Color(0xFF3B82F6);

  static const Color primaryText = Color(0xFF1F2937);
  static const Color secondaryText = Color(0xFF4B5563);
  static const Color secondaryNote = Color(0xFF999999);



  static const Color prymarybackgrounr = Color(0xFFBAD5F0);         
  static const Color secondarybackgrounr = Color(0xFFA1BFE5);
  static const Color thirdbackgrounr = Color(0xFFFFF2D0);

  /// [delete]
  // static const Color containerPolicyColor = Color(0xff2A2A2A);

  // static const Color primary = Color(0x#2B2B2B);
  // static const Color primaryDark = Color(0xFF946329);

  // static const Color secondary = Color(0xFFC0A05C);
  // static const Color textPrimary = secondary;
  // static const Color textSecondary = textPrimary;

  // static const Color icon = Color(0xFF595959);
  // static const Color warningBackground = Color(0xFFFAEBEB);
  // static const Color error = Color(0xFFCE3837);
  // static const Color success = Color(0xFF09B850);
  // static const Color backgroundLight = Color(0xFFDBEBF6);

  // // Button styles (for convenience)
  // static const Color buttonBackground = primary;
  // static const Color buttonText = background; // when background is primary

  // // Add these new form field specific colors
  // static const Color inputBorder = primaryDark; // Light blue-gray border
  // static const Color inputFocusedBorder = primaryDark; // Use your primary blue
  // static const Color inputErrorBorder = error; // Use your existing error red
  // static const Color inputFill = white; // White background
  // static const Color inputHint = textSecondary; // Use your textSecondary
  // static const Color inputLabel = textPrimary; // Use your textPrimary
  // static const Color inputIcon = Color(0xFF70603F);

  // static const Color inputDisabledFill = Color(
  //   0xFFF5F5F5,
  // ); // Light gray for disabled

  // static const Gradient primaryGradient = LinearGradient(
  //   colors: [pinkColor, lightBlue],
  //   begin: Alignment.topLeft,
  //   end: Alignment.bottomRight,
  //   stops: [0.2, 7.0],
  //   transform: GradientRotation(45 * (pi / 180)),
  // );

  static const Gradient primaryGradient = LinearGradient(
    colors: [lightBlue, buttonbackgroundcolor], //buttonbackgroundcolor
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    stops: [0.2, 7.0],
    transform: GradientRotation(45 * (pi / 180)),
  );


}
