import 'package:flutter/material.dart';

class HabitHeader extends StatelessWidget {
  final VoidCallback onBack;

  const HabitHeader({
    super.key,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 36,
          height: 36,
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: IconButton(
            padding: EdgeInsets.zero,
            onPressed: onBack,
            icon: const Icon(
              Icons.chevron_left,
              size: 22,
              color: Color(0xFF333333),
            ),
          ),
        ),
        const Expanded(
          child: Center(
            child: Text(
              'New Habit',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color(0xFF222222),
              ),
            ),
          ),
        ),
        Container(
          width: 36,
          height: 36,
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {},
            icon: const Icon(
              Icons.more_vert,
              size: 20,
              color: Color(0xFF333333),
            ),
          ),
        ),
      ],
    );
  }
}