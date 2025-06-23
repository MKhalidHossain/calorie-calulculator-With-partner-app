import 'package:flutter/material.dart';
import 'package:shevaandrii/core/themes/app_colors.dart';
import 'package:shevaandrii/core/themes/app_gap.dart';
import 'package:shevaandrii/core/themes/app_theme.dart';
import 'package:shevaandrii/core/utils/button/button_widget.dart';
import 'package:shevaandrii/features/auth/screens/age_screen.dart';
import 'package:shevaandrii/features/auth/widget/gender_widget.dart';

class GenderScreen extends StatefulWidget {
  const GenderScreen({super.key});

  @override
  State<GenderScreen> createState() => _GenderScreenState();
}

class _GenderScreenState extends State<GenderScreen> {
  final _formKey = GlobalKey<FormState>();

  String? _selectedGender;
  bool _showGenderError = false;

  String? _validateGender() {
    if (_showGenderError && _selectedGender == null) {
      return 'Please select your gender';
    }
    return null;
  }

  void _onGenderSelected(String gender) {
    setState(() {
      _selectedGender = gender;
      _showGenderError = false; // clear error when user selects
    });
  }

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
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Gap.h16,
                        Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.arrow_back, color: Colors.black54),
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
                                    value: 0.3,
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
                        Center(
                          child: Text(
                            "What's your gender?",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Center(
                          child: Text(
                            "This helps us calculate your calorie need",
                            style: TextStyle(fontSize: 16, color: Colors.black54),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Gap.h160,

                        // Gender Selection + Error Message
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GenderSelectionWidget(
                              selectedGender: _selectedGender,
                              onGenderSelected: _onGenderSelected,
                            ),
                            if (_validateGender() != null)
                              Padding(
                                padding: EdgeInsets.only(top: 8),
                                child: Text(
                                  _validateGender()!,
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                          ],
                        ),

                        Gap.h220,
                      ],
                    ),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: context.primaryButton(
                  onPressed: () {
                    if (_selectedGender != null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AgeScreen(),
                        ),
                      );
                    } else {
                      setState(() {
                        _showGenderError = true;
                      });
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
