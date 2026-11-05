
import 'package:flutter/material.dart';

import 'add_navigation_button.dart';
import 'navigation_item.dart';

class HabitBottomNavigationBar extends StatefulWidget {
  final VoidCallback? onAdd;

  const HabitBottomNavigationBar({
    super.key,
    this.onAdd,
  });

  @override
  State<HabitBottomNavigationBar> createState() =>
      _HabitBottomNavigationBarState();
}

class _HabitBottomNavigationBarState
    extends State<HabitBottomNavigationBar> {
  int selectedIndex = 0;

  void selectItem(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  Widget buildNavigationItem(
    IconData icon,
    String label,
    int index,
  ) {
    return NavigationItem(
      icon: icon,
      label: label,
      isSelected: selectedIndex == index,
      onTap: () => selectItem(index),
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
          buildNavigationItem(
            Icons.home_outlined,
            'Home',
            0,
          ),
          buildNavigationItem(
            Icons.calendar_month_outlined,
            'Calendar',
            1,
          ),
          AddNavigationButton(
            onTap: widget.onAdd ?? () {},
          ),
          buildNavigationItem(
            Icons.analytics_outlined,
            'Analytics',
            2,
          ),
          buildNavigationItem(
            Icons.person_outline,
            'Profile',
            3,
          ),
        ],
      ),
    );
  }
}
