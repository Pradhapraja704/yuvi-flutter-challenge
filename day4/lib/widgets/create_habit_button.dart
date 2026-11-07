
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
          backgroundColor: const Color(0xFFFF947B),
          foregroundColor: Colors.white,
          elevation: 2,
          padding: EdgeInsets.zero,
          shape: const StadiumBorder(),
        ).copyWith(
          backgroundColor: WidgetStateProperty.resolveWith((states) {
            if (isActive) {
              return const Color(0xFFFF7778);
            }
            return const Color(0xFFFF947B);
          }),
        ),
        child: Ink(
          decoration: isActive
              ? const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFFFFA17F),
                      Color(0xFFFF7778),
                    ],
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                )
              : null,
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
