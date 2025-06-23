import 'package:flutter/material.dart';
import 'package:shevaandrii/core/themes/app_colors.dart';
import 'package:shevaandrii/core/themes/app_gap.dart';
import 'package:shevaandrii/core/themes/app_theme.dart';
import 'package:shevaandrii/core/utils/button/button_widget.dart';
import 'package:shevaandrii/features/auth/screens/gender_screen.dart';
import 'package:shevaandrii/features/widget/app_logo.dart';

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({super.key});

  final _formKey = GlobalKey<FormState>();

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
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Gap.h16,
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.arrow_back, color: Colors.black54),
                              onPressed: () => Navigator.pop(context),
                            ),
                            Gap.h4,
                            Expanded(
                              child: Container(
                                height: 8,
                                margin: EdgeInsets.only(left: 0, right: 8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.blue[100],
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: LinearProgressIndicator(
                                    value: 0.2,
                                    backgroundColor: Colors.transparent,
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      AppColors.buttonbackgroundcolor,
                                    ),
                                    minHeight: 8,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Gap.h80,
                        Center(child: AppLogo()),
                        Gap.h40,
                        Center(
                          child: Text(
                            "Hi Bob! Welcome to Couplio",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Gap.h12,
                        Center(
                          child: Text(
                            "We're all about making health goals feel natural and shared.",
                            style: TextStyle(fontSize: 16, color: Colors.black54),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Gap.h22,
                        Center(
                          child: Text(
                            "Let's set things up — it'll only take a moment.",
                            style: TextStyle(fontSize: 16, color: Colors.black54),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Gap.h40, // Adjusted spacing for layout flexibility
                      ],
                    ),
                  ),
                ),
              ),

              // Fixed Bottom Button
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: context.primaryButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => GenderScreen(),
                        ),
                      );
                    }
                  },
                  text: "Continue",
                  icon: Icons.arrow_forward,
                ),
              ),
              Gap.h40,
            ],
          ),
        ),
      ),
    );
  }
}
