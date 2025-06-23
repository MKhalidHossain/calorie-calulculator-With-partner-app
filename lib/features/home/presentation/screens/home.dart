import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:shevaandrii/core/themes/app_theme.dart';
import 'package:shevaandrii/core/themes/text_extensions.dart';
import 'package:shevaandrii/core/widgets/circular_percent_widget.dart';
import 'package:shevaandrii/features/home/presentation/weiget/food_log_item.dart';

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
        body: SingleChildScrollView(
          child: Padding(
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
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _CalenderForHome(day: 'Mon', date: '8', percent: '50%'),
                        const SizedBox(width: 10),
                        _CalenderForHome(day: 'Mon', date: '9', percent: '60%'),
                        const SizedBox(width: 10),
                        _CalenderForHome(
                          day: 'Tue',
                          date: '10',
                          percent: '70%',
                        ),
                        const SizedBox(width: 10),
                        _CalenderForHome(
                          day: 'Wed',
                          date: '11',
                          percent: '80%',
                        ),
                        const SizedBox(width: 10),
                        _CalenderForHome(
                          day: 'Thu',
                          date: '12',
                          percent: '90%',
                        ),
                        const SizedBox(width: 10),
                        _CalenderForHome(
                          day: 'Fri',
                          date: '13',
                          percent: '100%',
                        ),
                        const SizedBox(width: 10),
                        _CalenderForHome(
                          day: 'Sat',
                          date: '14',
                          percent: '110%',
                        ),
                        const SizedBox(width: 10),
                        _CalenderForHome(
                          day: 'Sun',
                          date: '15',
                          percent: '120%',
                        ),
                        const SizedBox(width: 10),
                        _CalenderForHome(
                          day: 'Mon',
                          date: '16',
                          percent: '130%',
                        ),
                        const SizedBox(width: 10),
                        _CalenderForHome(
                          day: 'Tue',
                          date: '17',
                          percent: '140%',
                        ),
                        const SizedBox(width: 10),
                        _CalenderForHome(
                          day: 'Wed',
                          date: '18',
                          percent: '150%',
                        ),
                        const SizedBox(width: 10),
                        _CalenderForHome(
                          day: 'Thu',
                          date: '19',
                          percent: '160%',
                        ),
                        const SizedBox(width: 10),
                        _CalenderForHome(
                          day: 'Fri',
                          date: '20',
                          percent: '170%',
                        ),
                      ],
                    ),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CircularPercentWidget(percent: 40, size: 90),
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
                FoodLogItem(),
                SizedBox(height: 20),
                FoodLogItem(),

                //this item is for testing purposes
                // Container(
                //   width: double.infinity,
                //   height: 60,
                //   decoration: BoxDecoration(
                //     color: Colors.white.withOpacity(
                //       0.1,
                //     ), // Dark background for the search bar

                //     borderRadius: BorderRadius.circular(6),
                //   ),
                //   child: Center(
                //     child: 'No food entries yet today'.text16LightGrey(),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _CalenderForHome extends StatelessWidget {
  final String day;
  final String date;
  final String percent;

  const _CalenderForHome({
    super.key,
    required this.day,
    required this.date,
    required this.percent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 100,
      color: Colors.white.withOpacity(0.1),
      // decoration: BoxDecoration(
      //   color: Color(
      //     0xFFF0F8FF,
      //   ).withOpacity(0.5), // Dark background for the search bar

      //   borderRadius: BorderRadius.circular(6),
      // ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          day.textColorGrey(12),
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.black, width: 1),
            ),
            child: Center(child: date.textColorGrey(14)),
          ),
          percent.textColorGrey(12),
        ],
      ),
    );
  }
}
