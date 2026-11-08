import 'package:flutter/material.dart';

class TodayHabitsSection extends StatelessWidget {
  const TodayHabitsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Today's Habits",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF292929),
          ),
        ),
        const SizedBox(height: 15),
        _buildHabitItem(
          icon: Icons.menu_book_rounded,
          title: 'Read 20 pages',
          streak: '12 day streak',
          color: const Color(0xFFE4D6FF),
          isCompleted: true,
        ),
        _buildHabitItem(
          icon: Icons.fitness_center_rounded,
          title: 'Morning Workout',
          streak: '8 day streak',
          color: const Color(0xFFFFD6C9),
          isCompleted: true,
        ),
        _buildHabitItem(
          icon: Icons.water_drop_rounded,
          title: 'Drink 3L Water',
          streak: '5 day streak',
          color: const Color(0xFFD6E5FF),
          isCompleted: false,
        ),
        _buildHabitItem(
          icon: Icons.code_rounded,
          title: 'Practice Coding',
          streak: '15 day streak',
          color: const Color(0xFFD5F0E0),
          isCompleted: false,
        ),
        _buildHabitItem(
          icon: Icons.self_improvement_rounded,
          title: 'Meditation',
          streak: '3 day streak',
          color: const Color(0xFFFFE8B8),
          isCompleted: false,
        ),
      ],
    );
  }

  Widget _buildHabitItem({
    required IconData icon,
    required String title,
    required String streak,
    required Color color,
    required bool isCompleted,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 13),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(17),
      ),
      child: Row(
        children: [
          Container(
            width: 43,
            height: 43,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(13),
            ),
            child: Icon(
              icon,
              color: const Color(0xFF444444),
              size: 22,
            ),
          ),
          const SizedBox(width: 13),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF292929),
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  streak,
                  style: const TextStyle(
                    fontSize: 11,
                    color: Color(0xFF999999),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 27,
            height: 27,
            decoration: BoxDecoration(
              color: isCompleted
                  ? const Color(0xFFFF8278)
                  : Colors.transparent,
              shape: BoxShape.circle,
              border: Border.all(
                color: isCompleted
                    ? const Color(0xFFFF8278)
                    : const Color(0xFFD5D5D5),
                width: 1.5,
              ),
            ),
            child: isCompleted
                ? const Icon(
                    Icons.check_rounded,
                    color: Colors.white,
                    size: 18,
                  )
                : null,
          ),
        ],
      ),
    );
  }
}