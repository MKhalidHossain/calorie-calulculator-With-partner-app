import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show Clipboard, ClipboardData;
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:shevaandrii/core/themes/app_theme.dart';
import 'package:shevaandrii/features/others/presentation/screens/premium_plan.dart';

import '../../../home/presentation/screens/home.dart';

class MyQr extends StatefulWidget {
  const MyQr({super.key});

  @override
  State<MyQr> createState() => _MyQrState();
}

class _MyQrState extends State<MyQr> {
  @override
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 2,
      child: AppTheme.withGradientBackground(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 24),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Icon(Icons.arrow_back, color: Colors.grey),
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      "Connect with Your Partner",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "Track your journey together and stay motivated",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14, color: Colors.black54),
                    ),
                    const SizedBox(height: 24),
                    GestureDetector(
                      child: Container(
                        height: 80,
                        width: size.width * 0.7,
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Color(0xFFFFD644).withOpacity(0.1),
                          border: Border.all(
                            color: Color(0xFFFFD644),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: const [
                            Icon(
                              Icons.person_outline,
                              color: Color(0xFFFFD644),
                            ),
                            SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                "Get 30% off when you invite your partner to join!",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        Get.to(PremiumPlan());
                      },
                    ),

                    const SizedBox(height: 24),

                    // TabBar
                    Container(
                      width: 180,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(color: Color(0xFFFFD644)),
                      ),
                      child: TabBar(
                        labelColor: Colors.black,
                        unselectedLabelColor: Colors.black54,
                        indicatorSize: TabBarIndicatorSize.tab,
                        indicator: BoxDecoration(
                          color: Color(0xFFFFD644),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        tabs: const [Tab(text: "My QR"), Tab(text: "Scan QR")],
                      ),
                    ),
                    const SizedBox(height: 24),

                    // TabBarView
                    const Expanded(
                      child: TabBarView(children: [MyQrTab(), ScanQrTab()]),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MyQrTab extends StatelessWidget {
  const MyQrTab({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        // QR Code
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
          ),
          padding: const EdgeInsets.all(16),
          child: QrImageView(
            data: 'https://your-link.com',
            version: QrVersions.auto,
            size: 200,
          ),
        ),
        const SizedBox(height: 12),
        const Text(
          "Your partner can scan this QR code\nto connect with you",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 13, color: Colors.black54),
        ),
        const SizedBox(height: 16),
        const Divider(thickness: 1, indent: 40, endIndent: 40),
        const SizedBox(height: 8),
        const Text("Or share this invite code", style: TextStyle(fontSize: 13)),
        const SizedBox(height: 12),

        // Invite Code Box
        Container(
          width: size.width * 0.7,
          padding: const EdgeInsets.symmetric(horizontal: 0),
          height: 56,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Center(
                  child: Text(
                    textAlign: TextAlign.center,
                    "COUPLE24606",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Clipboard.setData(const ClipboardData(text: "COUPLE24606"));
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(const SnackBar(content: Text("Copied")));
                },
                child: Container(
                  height: 56,
                  width: 56,
                  margin: const EdgeInsets.all(0),
                  padding: const EdgeInsets.all(0),
                  decoration: BoxDecoration(
                    color: Color(0xFFFFD644),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Icon(Icons.copy, size: 18),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        TextButton(
          onPressed: () {
            Get.to(HomeScreen());
          },
          child: const Text("Skip", style: TextStyle(color: Colors.black54)),
        ),
      ],
    );
  }
}

class ScanQrTab extends StatelessWidget {
  const ScanQrTab({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        // QR Code
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
          ),
          padding: const EdgeInsets.all(16),
          child: QrImageView(
            data: 'https://your-link.com',
            version: QrVersions.auto,
            size: 200,
          ),
        ),
        const SizedBox(height: 12),
        const Text(
          "Your partner can scan this QR code\nto connect with you",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 13, color: Colors.black54),
        ),
        const SizedBox(height: 16),
        const Divider(thickness: 1, indent: 40, endIndent: 40),
        const SizedBox(height: 8),
        const Text("Or share this invite code", style: TextStyle(fontSize: 13)),
        const SizedBox(height: 12),

        // Invite Code Box
        Container(
          width: size.width * 0.7,
          padding: const EdgeInsets.symmetric(horizontal: 0),
          height: 56,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Center(
                  child: Text(
                    textAlign: TextAlign.center,
                    "COUPLE24606",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Clipboard.setData(const ClipboardData(text: "COUPLE24606"));
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(const SnackBar(content: Text("Copied")));
                },
                child: Container(
                  height: 56,
                  width: 56,
                  margin: const EdgeInsets.all(0),
                  padding: const EdgeInsets.all(0),
                  decoration: BoxDecoration(
                    color: Color(0xFFFFD644),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Icon(Icons.copy, size: 18),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        TextButton(
          onPressed: () {
            Get.to(HomeScreen());
          },
          child: const Text("Skip", style: TextStyle(color: Colors.black54)),
        ),
      ],
    );
  }
}
