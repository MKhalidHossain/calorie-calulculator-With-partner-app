import 'dart:async';
import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:shevaandrii/core/themes/app_theme.dart';

class AnalyzeScreen extends StatefulWidget {
  final String imagePath;

  const AnalyzeScreen({super.key, required this.imagePath});

  @override
  State<AnalyzeScreen> createState() => _AnalyzeScreenState();
}

class _AnalyzeScreenState extends State<AnalyzeScreen> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    // Simulate 3-second loading
    Timer(const Duration(seconds: 3), () {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppTheme.withGradientBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: _isLoading ? _buildBlurredLoading() : _buildResultView(),
      ),
    );
  }

  Widget _buildBlurredLoading() {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.file(File(widget.imagePath), fit: BoxFit.cover),
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
          child: Container(color: Color(0xFFBAD5F0).withOpacity(0.3)),
        ),
        const Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(color: Colors.white),
              SizedBox(height: 16),
              Text(
                'Analyzing your food...',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              Text(
                'This will just take a few moment',
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildResultView() {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.file(File(widget.imagePath), fit: BoxFit.contain),
        ),
        SafeArea(
          child: Align(
            alignment: Alignment.topLeft,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.grey),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ),
      ],
    );
  }
}
