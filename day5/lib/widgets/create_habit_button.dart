
import 'package:flutter/material.dart';

class CreateHabitButton extends StatelessWidget {
  final VoidCallback onPressed;
  final bool isActive;

  const CreateHabitButton({
    super.key,
    required this.onPressed,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: isActive
              ? const Color(0xFFFF7778)
              : const Color(0xFFFF947B),
          foregroundColor: Colors.white,
          elevation: 2,
          padding: EdgeInsets.zero,
          shape: const StadiumBorder(),
        ),
        child: Ink(
          decoration: BoxDecoration(
            gradient: isActive
                ? const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFFFFA17F),
                      Color(0xFFFF7778),
                    ],
                  )
                : null,
            color: isActive ? null : const Color(0xFFFF947B),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Container(
            alignment: Alignment.center,
            child: const Text(
              'Create Habit',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
