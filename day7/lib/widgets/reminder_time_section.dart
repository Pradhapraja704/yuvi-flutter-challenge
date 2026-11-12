
import 'dart:math' as math;
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
        '${selectedTime.hourOfPeriod.toString().padLeft(2, '0')}:'
        '${selectedTime.minute.toString().padLeft(2, '0')} '
        '${selectedTime.period == DayPeriod.am ? 'AM' : 'PM'}';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Set Reminder',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            fontVariations: [
              FontVariation('wght', 550),
            ],
            color: Color.fromARGB(255, 0, 0, 0),
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
            const BellIcon(
              size: 18,
              color: Color(0xFF555555),
              strokeWidth: 2,
            ),
            const SizedBox(width: 12),
            Text(
              time,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Color.fromARGB(255, 74, 72, 72),
              ),
            ),
            const Spacer(),
            const Icon(
              Icons.access_time,
              color: Color(0xFF555555),
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}

class BellPainter extends CustomPainter {
  const BellPainter({
    this.color = const Color(0xFF5F5F5F),
    this.strokeWidth = 2.0,
  });

  final Color color;
  final double strokeWidth;

  static const double designWidth = 36;
  static const double designHeight = 35;

  @override
  void paint(Canvas canvas, Size size) {
    final scale = math.min(
      size.width / designWidth,
      size.height / designHeight,
    );

    canvas.save();
    canvas.translate(
      (size.width - designWidth * scale) / 2,
      (size.height - designHeight * scale) / 2,
    );
    canvas.scale(scale);

    canvas.translate(15.5, 16.5);
    canvas.scale(1.08, 1);
    canvas.translate(-15, -16);

    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..isAntiAlias = true;

    final body = Path()
      ..moveTo(4.5, 17.5)
      ..lineTo(4.5, 11)
      ..cubicTo(4.5, 4.5, 9, 0.5, 15, 0.5)
      ..cubicTo(21, 0.5, 25.5, 4.5, 25.5, 11)
      ..lineTo(25.5, 17.5)
      ..cubicTo(27.5, 18.5, 29.5, 20, 29.5, 22)
      ..cubicTo(29.5, 24, 28.5, 25.5, 27, 25.5)
      ..lineTo(3, 25.5)
      ..cubicTo(1.5, 25.5, 0.5, 24, 0.5, 22)
      ..cubicTo(0.5, 20, 2.5, 18.5, 4.5, 17.5)
      ..close();

    final clapper = Path()
      ..moveTo(9.5, 26.5)
      ..cubicTo(9.5, 31.5, 11, 31.5, 15, 31.5)
      ..cubicTo(19, 31.5, 20.5, 31.5, 20.5, 26.5);

    canvas.drawPath(body, paint);
    canvas.drawPath(clapper, paint);

    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant BellPainter oldDelegate) =>
      oldDelegate.color != color ||
      oldDelegate.strokeWidth != strokeWidth;
}

class BellIcon extends StatelessWidget {
  const BellIcon({
    super.key,
    this.size = 48,
    this.color = const Color(0xFF5F5F5F),
    this.strokeWidth = 2.0,
  });

  final double size;
  final Color color;
  final double strokeWidth;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(
        size,
        size * BellPainter.designHeight / BellPainter.designWidth,
      ),
      painter: BellPainter(
        color: color,
        strokeWidth: strokeWidth,
      ),
    );
  }
}
