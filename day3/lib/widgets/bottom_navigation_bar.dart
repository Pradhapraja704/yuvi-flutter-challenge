import 'package:flutter/material.dart';

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
    String label,
    int index,
  ) {
    return NavigationItem(
      icon: icon,
      label: label,
      isSelected: selectedIndex == index,
      onTap: () => onItemSelected(index),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.10),
            blurRadius: 18,
            spreadRadius: 1,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          buildNavigationItem(Icons.home_outlined, 'Home', 0),
          buildNavigationItem(Icons.calendar_month_outlined, 'Calendar', 1),
          AddNavigationButton(onTap: onAdd),
          buildNavigationItem(Icons.analytics_outlined, 'Analytics', 2),
          buildNavigationItem(Icons.person_outline, 'Profile', 3),
        ],
      ),
    );
  }
}