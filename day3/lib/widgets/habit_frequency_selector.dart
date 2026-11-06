import 'package:flutter/material.dart';

class HabitFrequencySelector extends StatelessWidget {
  final String selectedFrequency;
  final ValueChanged<String> onSelected;

  const HabitFrequencySelector({
    super.key,
    required this.selectedFrequency,
    required this.onSelected,
  });

  static const List<String> frequencies = [
    'Daily',
    'Weekdays',
    'Weekends',
    'Custom',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Choose Frequency',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color(0xFF292929),
          ),
        ),
        const SizedBox(height: 12),
        HabitFrequencyOptions(
          frequencies: frequencies,
          selectedFrequency: selectedFrequency,
          onSelected: onSelected,
        ),
      ],
    );
  }
}

class HabitFrequencyOptions extends StatelessWidget {
  final List<String> frequencies;
  final String selectedFrequency;
  final ValueChanged<String> onSelected;

  const HabitFrequencyOptions({
    super.key,
    required this.frequencies,
    required this.selectedFrequency,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        const spacing = 6.0;
        final itemWidth = (constraints.maxWidth - spacing) / 2;

        return Wrap(
          spacing: spacing,
          runSpacing: 6,
          children: frequencies.map((frequency) {
            return SizedBox(
              width: itemWidth,
              height: 40,
              child: HabitFrequencyItem(
                title: frequency,
                isSelected: selectedFrequency == frequency,
                onTap: () => onSelected(frequency),
              ),
            );
          }).toList(),
        );
      },
    );
  }
}

class HabitFrequencyItem extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const HabitFrequencyItem({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(30),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: isSelected
              ? const LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Color(0xFFFFA17F),
                    Color(0xFFFF7778),
                  ],
                )
              : null,
          color: isSelected ? null : Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 13,
            color: isSelected
                ? const Color(0xFF292929)
                : const Color.fromARGB(255, 150, 148, 148),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}