import 'package:flutter/material.dart';
import 'package:shevaandrii/core/themes/app_colors.dart';
import 'package:shevaandrii/core/themes/app_gap.dart';
import 'package:shevaandrii/core/themes/app_theme.dart';
import 'package:shevaandrii/core/utils/button/button_widget.dart';
import 'package:shevaandrii/features/auth/screens/goal_screen.dart';
import 'package:shevaandrii/features/auth/widget/weight_widget.dart';

class WeightScreen extends StatelessWidget {
  WeightScreen({super.key});

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
                              icon: Icon(
                                Icons.arrow_back,
                                color: Colors.black54,
                              ),
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
                                    value: 0.6,
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
                            "what is your weight",
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
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black54,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Gap.h80,
                        SizedBox(
                          height: 400,
                          child: WeightSelectorWidget(),
                        ),
                        //WeightSelectorWidget(),
                        Gap.h220,
                      ],
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),
                child: context.primaryButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => GoalScreen()),
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
