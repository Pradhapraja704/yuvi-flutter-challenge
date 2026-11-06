
import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons_300.dart';

import 'add_navigation_button.dart';
import 'navigation_item.dart';

class HabitBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemSelected;
  final VoidCallback onAdd;

  const HabitBottomNavigationBar({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
    required this.onAdd,
  });

  Widget buildNavigationItem(
    IconData icon,
    IconData selectedIcon,
    String label,
    int index, {
    bool showIconFrame = false,
  }) {
    return NavigationItem(
      icon: icon,
      selectedIcon: selectedIcon,
      label: label,
      isSelected: selectedIndex == index,
      onTap: () => onItemSelected(index),
      showIconFrame: showIconFrame,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 66,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.10),
            blurRadius: 18,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          buildNavigationItem(
            LucideIcons300.house,
            Icons.home_rounded,
            'Home',
            0,
          ),
          buildNavigationItem(
            LucideIcons300.calendarDays,
            Icons.calendar_month_rounded,
            'Calendar',
            1,
          ),
          AddNavigationButton(onTap: onAdd),
          buildNavigationItem(
            LucideIcons300.chartNoAxesColumnIncreasing,
            Icons.analytics_rounded,
            'Analytics',
            2,
            showIconFrame: true,
          ),
          buildNavigationItem(
            LucideIcons300.userRound,
            Icons.person_rounded,
            'Profile',
            3,
          ),
        ],
      ),
    );
  }
}
