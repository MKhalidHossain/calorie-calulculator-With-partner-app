import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shevaandrii/core/themes/app_theme.dart';
import 'package:shevaandrii/core/themes/text_extensions.dart';
import 'package:shevaandrii/core/widgets/circular_percent_widget.dart';
import 'package:shevaandrii/core/widgets/normal_custom_button.dart';
import 'package:shevaandrii/core/widgets/wide_custom_button.dart';

class PartnerScreen extends StatelessWidget {
  const PartnerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return AppTheme.withGradientBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,

        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 60),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.grey),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  const SizedBox(width: 10),
                  "Hi, you're in Clara's space".text20Black500(),
                ],
              ),
              const SizedBox(height: 65),
              Column(
                children: [
                  CircularPercentWidget(
                    percent: 70,
                    size: 100,
                    isPartner: true,
                  ),
                  const SizedBox(height: 24),
                  "Clara's Daily Progress".text18Black(),
                  const SizedBox(height: 90),
                  GestureDetector(
                    child: Container(
                      height: 110,
                      width: double.infinity,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Color(0xFFFFD644).withOpacity(0.1),
                        border: Border.all(color: Color(0xFFFFD644), width: 1),
                        borderRadius: BorderRadius.circular(12),
                      ),

                      child: Row(
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            color: Color(0xFFFFD644).withOpacity(0.2),
                            child: Icon(
                              Icons.notifications_active_outlined,
                              color: Color(0xFFCA8A04),
                            ),
                          ),
                          SizedBox(width: 20),
                          Container(
                            width: 150,
                            child: Column(
                              children: [
                                'No food logged today'.text16Black(),
                                "Clara hasn't logged any food today"
                                    .text10DarkGrey(),
                              ],
                            ),
                          ),
                          const SizedBox(width: 30),
                          NormalCustomButton(
                            weight: 120,
                            textColor: Color(0xFFCA8A04),
                            fillColor: Color(0xFFFFD644).withOpacity(0.5),
                            text: 'Send Reminder',
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      //Get.to();
                    },
                  ),

                  const SizedBox(height: 24),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: 'Recent Food Logs'.text18Black(),
                      ),
                      const SizedBox(height: 16),
                      Container(
                        width: double.infinity,
                        height: 120,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(
                            0.2,
                          ), // Dark background for the search bar

                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              'No food entries yet today'.text16Grey(),
                              const SizedBox(height: 4),
                              'Clara has not logged any food.'
                                  .text14LightGrey(),
                              const SizedBox(height: 8),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  WideCustomButton(
                    showIcon: true,
                    sufixIcon: Icons.logout,
                    isBlure: true,
                    text: 'Disconnect Partner',
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
