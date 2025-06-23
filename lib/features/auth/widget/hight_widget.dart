import 'package:flutter/material.dart';
import 'package:shevaandrii/core/themes/app_colors.dart';
import 'dart:math';

import 'package:shevaandrii/core/themes/app_gap.dart';

class HeightSelectorWidget extends StatefulWidget {
  const HeightSelectorWidget({super.key});

  @override
  State<HeightSelectorWidget> createState() => _HeightSelectorWidgetState();
}

class _HeightSelectorWidgetState extends State<HeightSelectorWidget> {
  bool isFeet = true;
  int selectedIndex = 8;

  late FixedExtentScrollController scrollController;

  List<String> cmHeights = List.generate(100, (i) => "${130 + i} cm");

  List<String> ftInHeights = List.generate(100, (i) {
    int totalInches = 60 + i;
    int ft = totalInches ~/ 12;
    int inch = totalInches % 12;
    return "$ft ft $inch in";
  });

  @override
  void initState() {
    super.initState();
    scrollController = FixedExtentScrollController(initialItem: selectedIndex);
  }

  void toggleUnit(bool toFeet) {
    setState(() {
      if (isFeet != toFeet) {
        if (toFeet) {
          final cm = 130 + selectedIndex;
          final inches = (cm / 2.54).round();
          selectedIndex = max(0, min(99, inches - 60));
        } else {
          final inches = 60 + selectedIndex;
          final cm = (inches * 2.54).round();
          selectedIndex = max(0, min(99, cm - 130));
        }
        isFeet = toFeet;
        scrollController =
            FixedExtentScrollController(initialItem: selectedIndex);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final activeList = isFeet ? ftInHeights : cmHeights;

    return Container(
      color: Colors.transparent,
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          Gap.h12,
          _buildToggleSwitch(),
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
              physics: const FixedExtentScrollPhysics(),
              childDelegate: ListWheelChildBuilderDelegate(
                builder: (context, index) {
                  if (index < 0 || index >= activeList.length) return null;
                  final isSelected = index == selectedIndex;
                  return Center(
                    child: Text(
                      activeList[index],
                      style: TextStyle(
                        fontSize: isSelected ? 22 : 18,
                        fontWeight: isSelected
                            ? FontWeight.bold
                            : FontWeight.normal,
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
        border: Border.all(color: AppColors.background),
      ),
      child: Row(
        children: [
          _buildSegment("ft", isFeet, () => toggleUnit(true), left: true),
          _buildSegment("cm", !isFeet, () => toggleUnit(false), left: false),
        ],
      ),
    );
  }

  Widget _buildSegment(
      String label, bool selected, VoidCallback onTap,
      {required bool left}) {
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
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
