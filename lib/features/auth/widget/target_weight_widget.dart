import 'package:flutter/material.dart';
import 'package:shevaandrii/core/themes/app_colors.dart';
import 'dart:math';

import 'package:shevaandrii/core/themes/app_gap.dart';

class TargetWeightSelectorWidget extends StatefulWidget {
  const TargetWeightSelectorWidget({super.key});

  @override
  State<TargetWeightSelectorWidget> createState() =>
      _WeightSelectorWidgetState();
}

class _WeightSelectorWidgetState extends State<TargetWeightSelectorWidget> {
  bool isKg = true;
  int selectedIndex = 30;

  late FixedExtentScrollController scrollController;

  final List<String> kgWeights = List.generate(100, (i) => "${30 + i} kg");
  final List<String> lbWeights = List.generate(100, (i) {
    final lbs = 66 + i; // ~30 kg = 66 lbs
    return "$lbs lbs";
  });

  @override
  void initState() {
    super.initState();
    scrollController = FixedExtentScrollController(initialItem: selectedIndex);
  }

  void toggleUnit(bool toKg) {
    setState(() {
      if (isKg != toKg) {
        if (toKg) {
          final lbs = 66 + selectedIndex;
          final kg = (lbs / 2.205).round();
          selectedIndex = max(0, min(99, kg - 30));
        } else {
          final kg = 30 + selectedIndex;
          final lbs = (kg * 2.205).round();
          selectedIndex = max(0, min(99, lbs - 66));
        }
        isKg = toKg;
        scrollController = FixedExtentScrollController(
          initialItem: selectedIndex,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final activeList = isKg ? kgWeights : lbWeights;

    return Container(
      color: Colors.transparent,
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          Gap.h12,
          _buildToggleSwitch(),
          Gap.h22,
          Container(
            height: 100,
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Color(0xFFABC2D5),
              border: Border.all(color: AppColors.thirdbackgrounr, width: 2),
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/images/gemini.png',
                    height: 60,
                    width: 60,
                    fit: BoxFit.cover,
                  ),
                ),
                Gap.h12,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '5% weight loss!',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Gap.h4,
                      Text(
                        'You will loss 9 lb to reach your targate!',
                        style: TextStyle(fontSize: 14, color: Colors.black87),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          Gap.h12,
          Expanded(
            child: ListWheelScrollView.useDelegate(
              controller: scrollController,
              itemExtent: 50,
              onSelectedItemChanged: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
              physics: FixedExtentScrollPhysics(),
              childDelegate: ListWheelChildBuilderDelegate(
                builder: (context, index) {
                  if (index < 0 || index >= activeList.length) return null;
                  final isSelected = index == selectedIndex;
                  return Center(
                    child: Text(
                      activeList[index],
                      style: TextStyle(
                        fontSize: isSelected ? 22 : 18,
                        fontWeight:
                            isSelected ? FontWeight.bold : FontWeight.normal,
                        color: isSelected ? Colors.black : Colors.black54,
                      ),
                    ),
                  );
                },
                childCount: activeList.length,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildToggleSwitch() {
    return Container(
      width: 120,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: Colors.black12),
      ),
      child: Row(
        children: [
          _buildSegment("kg", isKg, () => toggleUnit(true), left: true),
          _buildSegment("lbs", !isKg, () => toggleUnit(false), left: false),
        ],
      ),
    );
  }

  Widget _buildSegment(
    String label,
    bool selected,
    VoidCallback onTap, {
    required bool left,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: selected ? Colors.yellow : Colors.transparent,
            borderRadius: BorderRadius.horizontal(
              left: Radius.circular(left ? 4 : 0),
              right: Radius.circular(!left ? 4 : 0),
            ),
          ),
          alignment: Alignment.center,
          child: Text(
            label,
            style: const TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
