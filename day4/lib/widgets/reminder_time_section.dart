
import 'package:flutter/material.dart';

class ReminderTimeSection extends StatelessWidget {
  final TimeOfDay selectedTime;
  final VoidCallback onTap;

  const ReminderTimeSection({
    super.key,
    required this.selectedTime,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final formattedTime =
        MaterialLocalizations.of(context).formatTimeOfDay(selectedTime);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Set Reminder',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: Color(0xFF292929),
          ),
        ),
        const SizedBox(height: 8),
        ReminderTimeField(
          time: formattedTime,
          onTap: onTap,
        ),
      ],
    );
  }
}

class ReminderTimeField extends StatelessWidget {
  final String time;
  final VoidCallback onTap;

  const ReminderTimeField({
    super.key,
    required this.time,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(30),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 13,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          children: [
            const Icon(
              Icons.notifications_none,
              color: Color(0xFF555555),
              size: 18,
            ),
            const SizedBox(width: 12),
            Text(
              time,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Color(0xFF292929),
              ),
            ),
            const Spacer(),
            const Icon(
              Icons.access_time,
              color: Color(0xFF555555),
              size: 18,
            ),
          ],
        ),
      ),
    );
  }
}
