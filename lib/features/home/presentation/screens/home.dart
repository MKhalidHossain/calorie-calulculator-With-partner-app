import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shevaandrii/core/themes/app_theme.dart';
import 'package:shevaandrii/core/themes/text_extensions.dart';
import 'package:shevaandrii/core/widgets/circular_percent_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/love_two_color.png',
                        height: 40,
                      ),
                      'Hi, Bob!'.text20Black500(),
                    ],
                  ),
                  Spacer(),
                  IconButton(
                    icon: const Icon(
                      Icons.notifications_outlined,
                      color: Colors.grey,
                      size: 30,
                    ),
                    onPressed: () {},
                  ),
                  SizedBox(width: 10),
                ],
              ),
              const SizedBox(height: 20),

              Container(
                width: double.infinity,
                height: 140,
                decoration: BoxDecoration(
                  color: Color(
                    0xFFF0F8FF,
                  ).withOpacity(0.5), // Dark background for the search bar

                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              const SizedBox(height: 35),

              Container(
                width: double.infinity,

                height: 270,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Color(
                    0xFFF0F8FF,
                  ).withOpacity(0.5), // Dark background for the search bar
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    'Today\'s Progress'.text16Black(),
                    'Sunday, June 8'.text14DarkGrey(),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 16.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CircularPercentWidget(percent: 50, size: 90),
                                const SizedBox(height: 20),
                                Column(
                                  children: [
                                    'Bob'.text16Black(),
                                    '0 / 2000 kcal'.text14Grey(),
                                  ],
                                ),
                              ],
                            ),
                          ),

                          Image.asset(
                            'assets/images/love_two_color.png',
                            height: 60,
                            alignment: Alignment.center,
                          ),
                          const SizedBox(width: 20),
                          // Circular Progress Widget
                          // Invite Partner Button
                          GestureDetector(
                            child: Image.asset(
                              'assets/images/invite_partner.png',
                              height: 130,
                              alignment: Alignment.centerRight,
                            ),
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              'Today\'s Food Log'.text16Black(),
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(
                    0.1,
                  ), // Dark background for the search bar

                  borderRadius: BorderRadius.circular(6),
                ),
                child: Center(
                  child: 'No food entries yet today'.text16LightGrey(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
