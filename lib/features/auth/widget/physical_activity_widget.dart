import 'package:flutter/material.dart';
import 'package:shevaandrii/core/themes/app_gap.dart';

class PlysicalyActivityWidget extends StatelessWidget {
  final String? selectedActivity;
  final ValueChanged<String> onActivitySelected;

  const PlysicalyActivityWidget({
    super.key,
    required this.selectedActivity,
    required this.onActivitySelected,
  });

  Widget _buildActivityButton({
    required String label,
    required String imagePath,
    required String value,
  }) {
    final isSelected = selectedActivity == value;

    return GestureDetector(
      onTap: () => onActivitySelected(value),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        margin: EdgeInsets.symmetric(vertical: 8),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white.withOpacity(0.5) : Color(0xFFA1BFE3),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? Colors.white : Colors.white.withOpacity(0.4),
            width: 1.5,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              height: 24,
              width: 24,
            ),
            Gap.h8,
            Flexible(
              child: Text(
                label,
                style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildActivityButton(
          label: 'Sedentary (Little to no exercise)',
          imagePath: 'assets/images/Sedentary.png',
          value: 'Sedentary',
        ),
        _buildActivityButton(
          label: 'Lightly Active (1–2 workouts/week)',
          imagePath: 'assets/images/Lightly Active.png',
          value: 'Lightly Active',
        ),
        _buildActivityButton(
          label: 'Moderately Active (3–4 workouts/week)',
          imagePath: 'assets/images/Moderately Active.png',
          value: 'Moderately Active',
        ),
        _buildActivityButton(
          label: 'Very Active (5–6 workouts/week)',
          imagePath: 'assets/images/Very Active.png',
          value: 'Very Active',
        ),
      ],
    );
  }
}
