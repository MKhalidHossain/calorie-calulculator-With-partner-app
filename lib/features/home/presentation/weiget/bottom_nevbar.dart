import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shevaandrii/features/home/presentation/screens/describe_meals.dart';
import 'package:shevaandrii/features/meal/presentation/screens/take_photo_screen.dart';

import '../screens/home.dart';
import '../screens/partner_screen.dart';

class MyCustomBottomNav extends StatefulWidget {
  const MyCustomBottomNav({Key? key}) : super(key: key);

  @override
  State<MyCustomBottomNav> createState() => _MyCustomBottomNavState();
}

class _MyCustomBottomNavState extends State<MyCustomBottomNav>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  bool _showBlurActions = false;
  late TabController _tabController;

  final List<String> _labels = ['Home', 'Partner', 'Settings', ' '];
  final List<IconData> _icons = [
    Icons.home_outlined,
    Icons.people_outline,
    Icons.settings_outlined,
    Icons.block, // Placeholder
  ];

  final List<Widget> _pages = const [
    HomeScreen(),
    PartnerScreen(),
    PartnerScreen(),
    SizedBox(), // Placeholder
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _icons.length, vsync: this);
    _tabController.addListener(() {
      if (!_tabController.indexIsChanging) {
        setState(() {
          _selectedIndex = _tabController.index;
        });
      }
    });
  }

  Widget _tabItem(IconData icon, String label, bool selected, int index) {
    if (index == 3) return const SizedBox(width: 50); // Gap for '+' button
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: selected ? Colors.blue : Colors.black54),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: selected ? Colors.blue : Colors.black54,
            fontWeight: selected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }

  Widget _buildActionPopup() {
    return Positioned(
      bottom: 100,
      right: 20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          _actionButton(
            icon: Icons.camera_alt_outlined,
            label: 'Take a photo',
            color: Colors.blue,
            page: TakePhotoScreen(),
          ),
          const SizedBox(height: 12),
          _actionButton(
            icon: Icons.description_outlined,
            label: 'Describe meal',
            color: Colors.orange,
            page: DescribeMeals(), // Placeholder, replace with actual page
          ),
        ],
      ),
    );
  }

  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _tabController.index = index;
    });
  }

  Widget _actionButton({
    required IconData icon,
    required String label,
    required Color color,
    required Widget page,
  }) {
    return GestureDetector(
      onTap: () {
        Get.to(page);
        // ScaffoldMessenger.of(
        //   context,
        // ).showSnackBar(SnackBar(content: Text('$label tapped')));
        setState(() => _showBlurActions = false);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            Icon(icon, color: color),
            const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          TabBarView(
            controller: _tabController,
            children: _pages,
            physics: const NeverScrollableScrollPhysics(),
          ),

          if (_showBlurActions)
            Positioned.fill(
              child: GestureDetector(
                onTap: () => setState(() => _showBlurActions = false),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                  child: Container(color: Colors.black.withOpacity(0.3)),
                ),
              ),
            ),

          if (_showBlurActions) _buildActionPopup(),
        ],
      ),
      bottomNavigationBar: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 80,
            padding: const EdgeInsets.only(left: 12, right: 60),
            decoration: BoxDecoration(
              color: const Color(0xFFFDF0D2),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 16,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: Column(
              children: [
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () => _onTabTapped(0),
                        child: _tabItem(
                          _icons[0],
                          _labels[0],
                          _selectedIndex == 0,
                          0,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16), //  Large gap between 1st and 2nd
                    Expanded(
                      child: GestureDetector(
                        onTap: () => _onTabTapped(1),
                        child: _tabItem(
                          _icons[1],
                          _labels[1],
                          _selectedIndex == 1,
                          1,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16), //  Large gap between 2nd and 3rd
                    Expanded(
                      child: GestureDetector(
                        onTap: () => _onTabTapped(2),
                        child: _tabItem(
                          _icons[2],
                          _labels[2],
                          _selectedIndex == 2,
                          2,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8), // Smaller gap before 4th
                    const SizedBox(width: 50), // Placeholder for "+" button
                  ],
                ),
              ],
            ),

            // TabBar(
            //   controller: _tabController,
            //   indicatorColor: Colors.transparent,
            //   labelPadding: const EdgeInsets.symmetric(horizontal: 8),
            //   tabs: List.generate(_icons.length, (i) {
            //     return _tabItem(_icons[i], _labels[i], i == _selectedIndex, i);
            //   }),
            // ),
          ),

          // Blur circle background under the + button
          Positioned(
            right: 15,
            top: -34,
            child: Container(
              width: 72,
              height: 72,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.1),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 16,
                    spreadRadius: 2,
                  ),
                ],
              ),
            ),
          ),

          // Floating + button
          Positioned(
            right: 21,
            top: -28,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _showBlurActions = !_showBlurActions;
                });
              },
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xFFFDF0D2),
                  border: Border.all(color: Colors.black26, width: 1),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 4,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
                child: const Center(
                  child: Icon(Icons.add, size: 30, color: Colors.black),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
