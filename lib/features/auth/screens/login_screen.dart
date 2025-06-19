import 'package:flutter/material.dart';
import 'package:shevaandrii/core/themes/app_colors.dart';
import 'package:shevaandrii/core/themes/app_gap.dart';
import 'package:shevaandrii/core/themes/app_theme.dart';
import 'package:shevaandrii/core/utils/button/button_widget.dart';
import 'package:shevaandrii/core/utils/button/input_decoration_extensions.dart';
import 'package:shevaandrii/features/widget/app_logo.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AppTheme.withGradientBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
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
                    Expanded(
                      child: Container(
                        height: 8, // Increased height for bold effect
                        margin: EdgeInsets.only(left: 0, right: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.blue[100],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: LinearProgressIndicator(
                            value: 0.1,
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
                Gap.h32,

                // Logo
                Center(child: AppLogo()),
                Gap.h32,

                // Title
                Center(
                  child: Text(
                    "What's your name?",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Gap.h12,

                // Subtitle
                const Center(
                  child: Text(
                    "This helps us personalize your experience",
                    style: TextStyle(fontSize: 14, color: Colors.black54),
                    textAlign: TextAlign.center,
                  ),
                ),
                Gap.h32,
                // TextField
                TextFormField(
                  controller: _nameController,
                  style: TextStyle(color: Colors.transparent),
                  decoration: context.primaryInputDecoration.copyWith(
                    hintText: "Enter your name",
                    hintStyle: TextStyle(color: Colors.grey),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFFF1E287),
                        width: 2,
                      ),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFFF1E287),
                        width: 2,
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                context.primaryButton1(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Scaffold()),
                    );
                  },
                  text: "save",
                ),
                Gap.h24,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
