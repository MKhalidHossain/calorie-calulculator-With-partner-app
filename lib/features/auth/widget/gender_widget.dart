import 'package:flutter/material.dart';
import 'package:shevaandrii/core/themes/app_colors.dart';
import 'package:shevaandrii/core/themes/app_gap.dart';

class GenderSelectionWidget extends StatefulWidget {
  final String? selectedGender;
  final ValueChanged<String> onGenderSelected;

  const GenderSelectionWidget({
    super.key,
    required this.selectedGender,
    required this.onGenderSelected,
  });

  @override
  State<GenderSelectionWidget> createState() => _GenderSelectionWidgetState();
}

class _GenderSelectionWidgetState extends State<GenderSelectionWidget> {
  Widget _buildGenderButton({
    required String label,
    required IconData icon,
    required String value,
  }) {
    final isSelected = widget.selectedGender == value;

    return GestureDetector(
      onTap: () => widget.onGenderSelected(value),
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
            Icon(icon, color: Colors.black87),
            Gap.h8,
            Text(
              label,
              style: TextStyle(
                color: AppColors.background,
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
        _buildGenderButton(label: 'Male', icon: Icons.male, value: 'male'),
        _buildGenderButton(label: 'Female', icon: Icons.female, value: 'female'),
        _buildGenderButton(label: 'Other', icon: Icons.transgender, value: 'other'),
      ],
    );
  }
}
