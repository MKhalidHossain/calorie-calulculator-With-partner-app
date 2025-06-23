import 'package:flutter/material.dart';
import 'package:shevaandrii/core/themes/app_theme.dart';
import 'package:shevaandrii/core/themes/text_extensions.dart';
import 'package:shevaandrii/core/widgets/wide_custom_button.dart';

class PremiumPlan extends StatelessWidget {
  const PremiumPlan({super.key});

  @override
  Widget build(BuildContext context) {
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
                    onPressed: () => Navigator.pop(context),
                  ),
                  const Spacer(),
                ],
              ),
              const SizedBox(height: 20),
              "Choose Your Premium Plan".text24Black(),
              const SizedBox(height: 30),
              PremiumPlanContainer(
                headingText: 'Monthly Plan',
                priceText: "4.99",
                packTypeText: ' month',
              ),
              const SizedBox(height: 12),
              PremiumPlanContainer(
                headingText: 'Yearly Plan',
                priceText: "39.99",
                packTypeText: ' year',
                endText: 'Save 33%',
              ),
              const SizedBox(height: 20),
              WideCustomButton(
                text: 'Start Free 3-day Trial',
                onPressed: () {},
              ),
              const Spacer(),
              'Cancel anytime. No hidden fees.'.text14Black(),
              const SizedBox(height: 10),
              'By subscribing, you agree to our Terms of Service and Privacy Policy.'
                  .text12BlackCenter(),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}

class PremiumPlanContainer extends StatelessWidget {
  final String headingText;
  final String priceText;
  final String packTypeText;
  final String endText;

  const PremiumPlanContainer({
    super.key,
    required this.headingText,
    required this.priceText,
    required this.packTypeText,
    this.endText = '',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      width: double.infinity,
      height: 90,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          headingText.text14Black(),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              '\$'.text24Black(),
              priceText.text24Black(),

              '/'.text14Black(),
              packTypeText.text14Black(),
              Spacer(),
              if (endText.isNotEmpty)
                Text(
                  endText,
                  style: TextStyle(
                    color: Color(0xFF19649F),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'notosans',
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
