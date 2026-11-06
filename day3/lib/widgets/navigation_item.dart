
import 'package:flutter/material.dart';

class NavigationItem extends StatelessWidget {
  final IconData icon;
  final IconData selectedIcon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  final bool showIconFrame;

  const NavigationItem({
    super.key,
    required this.icon,
    required this.selectedIcon,
    required this.label,
    required this.isSelected,
    required this.onTap,
    this.showIconFrame = false,
  });

  @override
  Widget build(BuildContext context) {
    final Color itemColor = isSelected
        ? const Color(0xFFFF7F70)
        : const Color(0xFF666666);

    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 54,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 25,
              child: Center(
                child: Icon(
                  isSelected ? selectedIcon : icon,
                  size: 21,
                  color: itemColor,
                  weight: 300,
                ),
              ),
            ),
            const SizedBox(height: 2),
            Text(
              label,
              style: TextStyle(
                fontSize: 9,
                fontWeight: FontWeight.w400,
                color: itemColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
