import 'package:flutter/material.dart';

class AgeSelectorWidget extends StatefulWidget {
  const AgeSelectorWidget({super.key});

  @override
  State<AgeSelectorWidget> createState() => _AgeSelectorWidgetState();
}

class _AgeSelectorWidgetState extends State<AgeSelectorWidget> {
  int selectedAge = 30;
  late FixedExtentScrollController scrollController;

  final List<int> ages = List.generate(100, (index) => 1 + index);

  @override
  void initState() {
    super.initState();
    scrollController = FixedExtentScrollController(initialItem: selectedAge - 1);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      alignment: Alignment.center,
      child: ListWheelScrollView.useDelegate(
        controller: scrollController,
        itemExtent: 50,
        onSelectedItemChanged: (index) {
          setState(() {
            selectedAge = ages[index];
          });
        },
        physics: FixedExtentScrollPhysics(),
        overAndUnderCenterOpacity: 0.5,
        childDelegate: ListWheelChildBuilderDelegate(
          childCount: ages.length,
          builder: (context, index) {
            final age = ages[index];
            final isSelected = age == selectedAge;
            return Center(
              child: Text(
                '$age',
                style: TextStyle(
                  fontSize: isSelected ? 22 : 18,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  color: isSelected ? Colors.black : Colors.black54,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
