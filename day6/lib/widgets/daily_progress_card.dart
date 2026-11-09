
import 'dart:math' as math;

import 'package:flutter/material.dart';

class DailyProgressCard extends StatelessWidget {
  const DailyProgressCard({super.key});

  @override
  Widget build(BuildContext context) {
    const progress = 0.62;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFFF8EDE1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Daily Progress',
                  style: TextStyle(
                    color: Color(0xFF77716C),
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 9),
                Text(
                  '2/5 completed',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: Color(0xFF252525),
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 24),
                Row(
                  children: [
                    FlameIcon(
                      size: 17,
                      color: Color(0xFFE6752A),
                      strokeWidth: 8,
                    ),
                    SizedBox(width: 6),
                    Text(
                      'Best streak: 15 days',
                      style: TextStyle(
                        color: Color(0xFF77716C),
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          SizedBox(
            width: 90,
            height: 90,
            child: Stack(
              alignment: Alignment.center,
              children: [
                CustomPaint(
                  size: const Size(90, 90),
                  painter: GradientProgressPainter(
                    progress: progress,
                  ),
                ),
                const Text(
                  '62%',
                  style: TextStyle(
                    color: Color(0xFF252525),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class GradientProgressPainter extends CustomPainter {
  final double progress;

  GradientProgressPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    const strokeWidth = 5.0;
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - strokeWidth) / 2;

    final rect = Rect.fromCircle(
      center: center,
      radius: radius,
    );

    final trackPaint = Paint()
      ..color = const Color(0xFFE9E1D7)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    final progressPaint = Paint()
      ..shader = const LinearGradient(
        colors: [
          Color.fromARGB(255, 255, 90, 101),
          Color.fromARGB(255, 254, 142, 127),
          Color.fromARGB(255, 243, 176, 121),
        ],
      ).createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawCircle(center, radius, trackPaint);

    canvas.drawArc(
      rect,
      -math.pi / 2,
      2 * math.pi * progress,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant GradientProgressPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}

class FlamePainter extends CustomPainter {
  const FlamePainter({
    this.color = const Color(0xFFE6752A),
    this.strokeWidth = 8,
  });

  final Color color;
  final double strokeWidth;

  static const double designWidth = 83;
  static const double designHeight = 113;

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

    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..isAntiAlias = true;

    final outer = Path()
      ..moveTo(36, 5)
      ..cubicTo(42, 9, 52, 16, 52, 30)
      ..lineTo(52, 44)
      ..cubicTo(52, 50, 57, 52.5, 63, 52.5)
      ..cubicTo(66, 52, 68, 47, 70.5, 42.5)
      ..cubicTo(74.5, 44, 79, 50, 79, 70)
      ..arcTo(
        Rect.fromCircle(
          center: const Offset(41, 70),
          radius: 38,
        ),
        0,
        math.pi,
        false,
      )
      ..cubicTo(3, 50, 26, 26, 36, 5)
      ..close();

    final inner = Path()
      ..moveTo(34, 51)
      ..cubicTo(30, 56, 24.5, 60, 24.5, 74)
      ..arcTo(
        Rect.fromCircle(
          center: const Offset(41, 74),
          radius: 16.5,
        ),
        math.pi,
        -math.pi,
        false,
      )
      ..cubicTo(57.5, 64, 40, 68, 34, 51)
      ..close();

    canvas.drawPath(outer, paint);
    canvas.drawPath(inner, paint);

    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant FlamePainter oldDelegate) =>
      oldDelegate.color != color ||
      oldDelegate.strokeWidth != strokeWidth;
}

class FlameIcon extends StatelessWidget {
  const FlameIcon({
    super.key,
    this.size = 120,
    this.color = const Color(0xFFE6752A),
    this.strokeWidth = 8,
  });

  final double size;
  final Color color;
  final double strokeWidth;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size.square(size),
      painter: FlamePainter(
        color: color,
        strokeWidth: strokeWidth,
      ),
    );
  }
}
