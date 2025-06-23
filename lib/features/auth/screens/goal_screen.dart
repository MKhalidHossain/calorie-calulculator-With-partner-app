import 'package:flutter/material.dart';
import 'package:shevaandrii/core/themes/app_colors.dart';
import 'package:shevaandrii/core/themes/app_gap.dart';
import 'package:shevaandrii/core/themes/app_theme.dart';
import 'package:shevaandrii/core/utils/button/button_widget.dart';
import 'package:shevaandrii/features/auth/screens/physical_activity_screen.dart';
import 'package:shevaandrii/features/auth/widget/goad_widget.dart';

class GoalScreen extends StatefulWidget {
  const GoalScreen({super.key});

  @override
  State<GoalScreen> createState() => _GoalScreenState();
}

class _GoalScreenState extends State<GoalScreen> {
  final _formKey = GlobalKey<FormState>();

  String? _selectedGoal;
  bool _showGoalError = false;

  void _onGoalSelected(String goal) {
    setState(() {
      _selectedGoal = goal;
      _showGoalError = false; // Clear error when goal is selected
    });
  }

  String? _validateGoal() {
    if (_showGoalError && _selectedGoal == null) {
      return 'Please select a goal';
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
                                    value: 0.7,
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
                            "What's your Goal?",
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
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black54,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Gap.h160,

                        // Goal selection with validation error
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GoalSelectionWidget(
                              selectedGoal: _selectedGoal,
                              onGoalSelected: _onGoalSelected,
                            ),
                            if (_validateGoal() != null)
                              Padding(
                                padding: EdgeInsets.only(top: 8),
                                child: Text(
                                  _validateGoal()!,
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
                    if (_selectedGoal != null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PlysicalyActivityScreen(),
                        ),
                      );
                    } else {
                      setState(() {
                        _showGoalError = true;
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
