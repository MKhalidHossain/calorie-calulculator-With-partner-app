// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:shevaandrii/core/themes/app_gap.dart';

class GoalSelectionWidget extends StatelessWidget {
  final String? selectedGoal;
  final ValueChanged<String> onGoalSelected;

  const GoalSelectionWidget({
    super.key,
    required this.selectedGoal,
    required this.onGoalSelected,
  });

  Widget _buildGoalButton({
    required String label,
    required String imagePath,
    required String value,
  }) {
    final isSelected = selectedGoal == value;

    return GestureDetector(
      onTap: () => onGoalSelected(value),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        margin: EdgeInsets.symmetric(vertical: 8),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color:
              isSelected
                  ? Colors.white.withOpacity(0.5)
                  : Color(0xFFA1BFE3),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? Colors.white : Colors.white.withOpacity(0.4),
            width: 1.5,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imagePath, height: 24, width: 24),
            Gap.h8,
            Text(
              label,
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.w600,
                fontSize: 16,
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
        _buildGoalButton(
          label: 'Lose weight',
          imagePath: 'assets/images/loseweight.png',
          value: 'lose weight',
        ),
        _buildGoalButton(
          label: 'Gain weight',
          imagePath: 'assets/images/gainweight.png',
          value: 'gain weight',
        ),
        _buildGoalButton(
          label: 'Stay fit',
          imagePath: 'assets/images/stayfit.png',
          value: 'stay fit',
        ),
      ],
    );
  }
}
