import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:shevaandrii/core/themes/app_theme.dart';
import 'package:shevaandrii/core/themes/text_extensions.dart';
import 'package:shevaandrii/core/widgets/wide_custom_button.dart';

class DescribeMeals extends StatelessWidget {
  const DescribeMeals({super.key});

  @override
  Widget build(BuildContext context) {
    return AppTheme.withGradientBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 60),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(Icons.arrow_back, color: Colors.grey),
                  ),
                  const SizedBox(width: 10),
                  'Log Meal'.text20Black500(),
                ],
              ),
              const SizedBox(height: 36),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  'Describe your meal'.text16Black(),
                  const SizedBox(height: 16),
                  TextField(
                    maxLines: null, // Allows multiline input
                    minLines: 6, // Adjust this based on desired height
                    decoration: InputDecoration(
                      hintText:
                          'E.g. Grilled chicken salad with avocado and olive oil dressing',
                      hintStyle: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 14,
                      ),
                      filled: true,
                      fillColor: Color(0xFFFEF1CF).withOpacity(0.1),
                      contentPadding: const EdgeInsets.all(16),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.grey.shade400),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                    ),
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 36),
                  WideCustomButton(text: 'Analyze', onPressed: () {}),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
