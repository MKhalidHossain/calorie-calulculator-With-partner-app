import 'package:flutter/material.dart';
import 'package:shevaandrii/core/themes/app_colors.dart';
import 'package:shevaandrii/core/themes/app_gap.dart';
import 'package:shevaandrii/core/themes/app_theme.dart';
import 'package:shevaandrii/core/utils/button/button_widget.dart';
import 'package:shevaandrii/features/auth/screens/target_weight_screen.dart';
import 'package:shevaandrii/features/auth/widget/physical_activity_widget.dart';

class PlysicalyActivityScreen extends StatefulWidget {
  const PlysicalyActivityScreen({super.key});

  @override
  State<PlysicalyActivityScreen> createState() => _PlysicalyActivityScreenState();
}

class _PlysicalyActivityScreenState extends State<PlysicalyActivityScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedActivity;
  bool _showActivityError = false;

  void _onActivitySelected(String activity) {
    setState(() {
      _selectedActivity = activity;
      _showActivityError = false; // Clear error when user selects
    });
  }

  String? _validateActivity() {
    if (_showActivityError && _selectedActivity == null) {
      return 'Please select your activity level';
    }
    return null;
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
                                margin: EdgeInsets.only(right: 8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.blue[100],
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: LinearProgressIndicator(
                                    value: 0.8,
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
                            "Your regular physical activity level?",
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
                            "This helps us tailor your experience",
                            style: TextStyle(fontSize: 16, color: Colors.black54),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Gap.h160,

                        // Activity selection + error message
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            PlysicalyActivityWidget(
                              selectedActivity: _selectedActivity,
                              onActivitySelected: _onActivitySelected,
                            ),
                            if (_validateActivity() != null)
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Text(
                                  _validateActivity()!,
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
                    if (_selectedActivity != null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TargetWeightScreen(),
                        ),
                      );
                    } else {
                      setState(() {
                        _showActivityError = true;
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
