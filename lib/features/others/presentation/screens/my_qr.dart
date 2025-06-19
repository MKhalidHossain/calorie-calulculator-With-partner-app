import 'package:flutter/material.dart';
import 'package:shevaandrii/core/themes/app_theme.dart';
import 'package:shevaandrii/core/themes/text_extensions.dart';

class MyQr extends StatefulWidget {
  const MyQr({super.key});

  @override
  State<MyQr> createState() => _MyQrState();
}

class _MyQrState extends State<MyQr> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AppTheme.withGradientBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,

        body: Column(
          children: [
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back, color: Color(0xFF9CA3AF)),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
            const SizedBox(height: 36),
            "Connect with Your Partner".text20Black700(),
            const SizedBox(height: 12),
            'Track your journey together and stay motivated'.text16DarkBlue(),
            const SizedBox(height: 24),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 54),
              padding: const EdgeInsets.all(16),
              width: double.infinity,
              height: 80,
              decoration: BoxDecoration(
                color: Color(0xFFFFD644).withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Color(0xffFFD644), width: 1),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFFFFD644).withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Image.asset(
                    'assets/icon/profileIcon.png',
                    width: 40,
                    height: 40,
                  ),
                  const SizedBox(width: 16),
                  Container(
                    width: size.width * 0.53,
                    child:
                        'Get 30% off when you invite your partner to join! '
                            .text12DarkGrey(),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFFFFD644).withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  'QR Code Here',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
