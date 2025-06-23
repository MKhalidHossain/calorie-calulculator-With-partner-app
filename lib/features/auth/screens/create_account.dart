import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shevaandrii/core/themes/app_colors.dart';
import 'package:shevaandrii/core/themes/app_gap.dart';
import 'package:shevaandrii/core/themes/app_theme.dart';
import 'package:shevaandrii/features/settings/screens/privacy_policy_screen.dart';
import 'package:shevaandrii/features/settings/screens/terms_conditions_screen.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount ({super.key});

  @override
  State<CreateAccount> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<CreateAccount> {
  bool _agreeToTerms = false;

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
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                              margin: EdgeInsets.only(right: 8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.blue[100],
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: LinearProgressIndicator(
                                  value: 1,
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
                      Text(
                        "Create Your Account",
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
                      Row(
                        children: [
                          Checkbox(
                            value: _agreeToTerms,
                            onChanged: (value) {
                              setState(() {
                                _agreeToTerms = value ?? false;
                              });
                            },
                          ),
                          Expanded(
                            child: RichText(
                              text: TextSpan(
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 14,
                                ),
                                children: [
                                  TextSpan(text: 'Agree to our '),
                                  TextSpan(
                                    text: 'Terms of Service',
                                    style: TextStyle(
                                      color: Colors.blue,
                                      decoration: TextDecoration.underline,
                                    ),
                                    recognizer:
                                        TapGestureRecognizer()
                                          ..onTap = () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder:
                                                    (context) =>
                                                        TermsConditions(),
                                              ),
                                            );
                                          },
                                  ),
                                  TextSpan(text: ' and '),
                                  TextSpan(
                                    text: 'Privacy Policy',
                                    style: TextStyle(
                                      color: Colors.blue,
                                      decoration: TextDecoration.underline,
                                    ),
                                    recognizer:
                                        TapGestureRecognizer()
                                          ..onTap = () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder:
                                                    (context) =>
                                                        PrivacyPolicy(),
                                              ),
                                            );
                                          },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
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
