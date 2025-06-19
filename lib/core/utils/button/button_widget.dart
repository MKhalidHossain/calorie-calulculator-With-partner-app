import 'package:flutter/material.dart';
import 'package:shevaandrii/core/themes/app_colors.dart';
import 'package:shevaandrii/core/themes/text_style.dart';

extension ButtonStyleExtensions on BuildContext {
  Widget primaryButton1({
    required VoidCallback onPressed,
    required String text,
    double? width,
    double? height,
    bool isLoading = false,
  }) {
    return SizedBox(
      width: width ?? 250,
      height: height ?? 48,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.buttonbackgroundcolor,
          foregroundColor: Colors.black,
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(64),
          ),
        ),
        child: isLoading
            ? const SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                ),
              )
            : Text(
                text,
                style: AppText.mdMedium_16.copyWith(color: Colors.black),
              ),
      ),
    );
  }
}

//  example for use this button 
// context.primaryButton1(
//                         height: 40,
//                         width: 97,
//                         onPressed: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(builder: (context) => Scaffold()),
//                           );
//                         },
//                         text: "save",
//                       ),

