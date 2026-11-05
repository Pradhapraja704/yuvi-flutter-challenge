import 'package:flutter/material.dart';

class HabitHeader extends StatelessWidget {
  const HabitHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: IconButton(
            padding: EdgeInsets.zero,
            onPressed: () => Navigator.maybePop(context),
            icon: const Icon(
              Icons.chevron_left,
              size: 24,
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
                fontWeight: FontWeight.w700,
                color: Color(0xFF222222),
              ),
            ),
          ),
        ),
        Container(
          width: 40,
          height: 40,
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {},
            icon: const Icon(
              Icons.more_vert,
              size: 22,
              color: Color(0xFF333333),
            ),
          ),
        ),
      ],
    );
  }
}