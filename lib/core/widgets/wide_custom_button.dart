import 'package:flutter/material.dart';

class WideCustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool showIcon;
  final IconData? sufixIcon;
  final double height;
  final bool isBlure;

  const WideCustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.showIcon = false,
    this.sufixIcon,
    this.height = 55,
    this.isBlure = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          alignment: Alignment.center,
          backgroundColor:
              isBlure
                  ? Colors.white.withOpacity(.4)
                  : Colors.white, // Make it red like in your design
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (showIcon && sufixIcon != null) ...[
              const SizedBox(width: 5),
              Icon(sufixIcon, color: Colors.black),
            ],
            const SizedBox(width: 20),
            Text(
              text,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w600,
                fontFamily: 'notoSans',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
