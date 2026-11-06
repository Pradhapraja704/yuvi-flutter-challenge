import 'package:flutter/material.dart';
import '../models/habit_icon_data.dart';

class HabitIconSelector extends StatelessWidget {
  final List<HabitIconData> icons;
  final int selectedIndex;
  final ValueChanged<int> onSelected;

  const HabitIconSelector({
    super.key,
    required this.icons,
    required this.selectedIndex,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Choose Activity',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Color(0xFF292929),
          ),
        ),
        const SizedBox(height: 12),
        HabitIconGrid(
          icons: icons,
          selectedIndex: selectedIndex,
          onSelected: onSelected,
        ),
      ],
    );
  }
}

class HabitIconGrid extends StatelessWidget {
  final List<HabitIconData> icons;
  final int selectedIndex;
  final ValueChanged<int> onSelected;

  const HabitIconGrid({
    super.key,
    required this.icons,
    required this.selectedIndex,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        const spacing = 6.0;
        final itemWidth = (constraints.maxWidth - spacing * 3) / 4;

        return Wrap(
          spacing: spacing,
          runSpacing: 6,
          children: List.generate(
            icons.length,
            (index) => SizedBox(
              width: itemWidth,
              height: 85,
              child: HabitIconItem(
                data: icons[index],
                isSelected: selectedIndex == index,
                onTap: () => onSelected(index),
              ),
            ),
          ),
        );
      },
    );
  }
}

class HabitIconItem extends StatelessWidget {
  final HabitIconData data;
  final bool isSelected;
  final VoidCallback onTap;

  const HabitIconItem({
    super.key,
    required this.data,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFF9EBDF) : Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: isSelected
                ? const Color(0xFFEFA08D)
                : Colors.transparent,
            width: 1,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              data.emoji,
              style: const TextStyle(fontSize: 25),
            ),
            const SizedBox(height: 3),
            Text(
              data.name,
              maxLines: 1,
              style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w600,
                color: Color(0xFF292929),
              ),
            ),
          ],
        ),
      ),
    );
  }
}