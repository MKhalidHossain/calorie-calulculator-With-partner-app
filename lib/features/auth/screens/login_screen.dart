import 'package:flutter/material.dart';
import 'package:shevaandrii/core/themes/app_colors.dart';
import 'package:shevaandrii/core/themes/app_gap.dart';
import 'package:shevaandrii/core/themes/app_theme.dart';

class LoginAccount extends StatefulWidget {
  const LoginAccount({super.key});

  @override
  State<LoginAccount> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginAccount> {

  @override
  Widget build(BuildContext context) {
    return AppTheme.withGradientBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Gap.h16,
                      Gap.h80,
                      Text(
                        "Login Your Account",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      Gap.h160,
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          icon: Image.asset(
                            'assets/images/google.png',
                            height: 20,
                          ),
                          label: Text("Continue With Google"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.profilebackground,
                            foregroundColor: AppColors.primaryText,
                            elevation: 1,
                            padding: EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                      Gap.h12,

                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          icon: Image.asset(
                            'assets/images/apple.png',
                            height: 20,
                          ),
                          label: Text("Continue With Apple"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.profilebackground,
                            foregroundColor: AppColors.primaryText,
                            elevation: 1,
                            padding: EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                      Gap.h16,
                      Gap.h32,
                    ],
                  ),
                ),
              ),

              // Footer
              Padding(
                padding: EdgeInsets.only(bottom: 24),
                child: Column(
                  children: [
                    Text(
                      "Your Profile helps us customize your experience",
                      style: TextStyle(fontSize: 12, color: Colors.black54),
                    ),
                    Gap.h4,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.lock, size: 14, color: Colors.green),
                        SizedBox(width: 4),
                        Text(
                          "Your data is secure and private",
                          style: TextStyle(fontSize: 10, color: Colors.black54),
                        ),
                      ],
                    ),
                    Gap.h16,
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
