import 'package:flutter/material.dart';

class HabitNameSection extends StatelessWidget {
  final TextEditingController controller;

  const HabitNameSection({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Habit Name',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Color(0xFF292929),
          ),
        ),
        const SizedBox(height: 12),
        TextField(
          controller: controller,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: Color(0xFF292929),
          ),
          decoration: InputDecoration(
            hintText: 'e.g. Morning Meditation',
            hintStyle: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Color(0xFF777777),
            ),
            filled: true,
            fillColor: const Color(0xFFEAEAEA),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 18,
              vertical: 13,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}