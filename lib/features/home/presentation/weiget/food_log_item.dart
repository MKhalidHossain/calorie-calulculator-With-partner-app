import 'package:flutter/material.dart';
import 'package:shevaandrii/core/themes/text_extensions.dart';

class FoodLogItem extends StatelessWidget {
  const FoodLogItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      width: double.infinity,
      height: 140,
      decoration: BoxDecoration(
        color: Color(
          0xFFF0F8FF,
        ).withOpacity(0.5), // Dark background for the search bar

        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Image.asset('assets/images/food.png', fit: BoxFit.cover),
          ),
          SizedBox(width: 8),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    'Grilled Chicken Salad'.text14Black(),
                    SizedBox(width: 40),
                    '320 kcal'.text16Black(),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.access_time, color: Colors.grey),
                        ' 12:30'.text12DarkGrey(),
                      ],
                    ),
                    SizedBox(width: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Image.asset('assets/images/meat.png', height: 20),
                            ' 28'.text12DarkGrey(),
                            '(g)'.text12DarkGrey(),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset('assets/images/corn.png', height: 20),
                            ' 12'.text12DarkGrey(),
                            '(g)'.text12DarkGrey(),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset('assets/images/bread.png', height: 20),
                            ' 18'.text12DarkGrey(),
                            '(g)'.text12DarkGrey(),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          // SizedBox(
          //   width: 60,
          //   child: Column(
          //     children: [
          //       'Grilled Chicken Salad'.text14Black(),
          //       Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         children: [
          //           Icon(Icons.access_time, color: Colors.grey),
          //           'Protein: 30g'.text12DarkGrey(),
          //         ],
          //       ),
          //     ],
          //   ),
          // ),
          // Column(
          //   children: [
          //     '320 kcal'.text16Blue(),
          //     Row(
          //       children: [
          //         Row(
          //           children: [
          //             Image.asset('assets/images/meat.png', height: 20),
          //             ' 28'.text12DarkGrey(),
          //             '(g)'.text12DarkGrey(),
          //           ],
          //         ),
          //         Row(
          //           children: [
          //             Image.asset('assets/images/corn.png', height: 20),
          //             ' 12'.text12DarkGrey(),
          //             '(g)'.text12DarkGrey(),
          //           ],
          //         ),
          //         Row(
          //           children: [
          //             Image.asset('assets/images/bread.png', height: 20),
          //             ' 18'.text12DarkGrey(),
          //             '(g)'.text12DarkGrey(),
          //           ],
          //         ),
          //       ],
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}
