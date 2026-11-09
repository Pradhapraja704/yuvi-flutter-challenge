
import 'dart:math' as math;

import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  final VoidCallback onProfileTap;

  const HomeHeader({
    super.key,
    required this.onProfileTap,
  });

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();

    const weekdays = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday',
    ];

    const months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];

    final formattedDate =
        '${weekdays[now.weekday - 1]}, ${months[now.month - 1]} ${now.day}';

    return Row(
      children: [
        const TuneIcon(
          size: 48,
          iconColor: Color(0xFF1B1B1B),
          circleColor: Color(0xFFFDFDFD),
          strokeWidth: 6.5,
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                formattedDate,
                style: const TextStyle(
                  fontSize: 9,
                  color: Color(0xFF777777),
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 3),
              const Text(
                "Today's Habits",
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  fontVariations: [
                    FontVariation('wght', 550),
                  ],
                  color: Color(0xFF000000),
                ),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: onProfileTap,
          child: ClipOval(
            child: Image.asset(
              'assets/profile.png',
              width: 42,
              height: 42,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}

class TuneIconPainter extends CustomPainter {
  const TuneIconPainter({
    this.iconColor = const Color(0xFF1B1B1B),
    this.circleColor = const Color(0xFFFDFDFD),
    this.strokeWidth = 6.5,
    this.showBackground = true,
  });

  final Color iconColor;
  final Color circleColor;
  final double strokeWidth;
  final bool showBackground;

  static const double _d = 214;
  static const double _gw = 85;
  static const double _gh = 76;

  static const double _rowY = 15.75;
  static const double _knobCx = 29.1;
  static const double _knobW = 26.8;
  static const double _knobH = 26.2;
  static const double _knobRadius = 9;
  static const double _rightLineStart = 52.8;

  @override
  void paint(Canvas canvas, Size size) {
    final scale = math.min(size.width, size.height) / _d;

    canvas.save();
    canvas.translate(
      (size.width - _d * scale) / 2,
      (size.height - _d * scale) / 2,
    );
    canvas.scale(scale);

    if (showBackground) {
      const centre = Offset(_d / 2, _d / 2);

      canvas.drawCircle(
        centre.translate(0, 1),
        _d / 2,
        Paint()
          ..color = const Color(0x0F000000)
          ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 7),
      );

      canvas.drawCircle(
        centre,
        _d / 2,
        Paint()..color = circleColor,
      );
    }

    canvas.translate((_d - _gw) / 2, (_d - _gh) / 2);

    final paint = Paint()
      ..color = iconColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..isAntiAlias = true;

    _drawSlider(canvas, paint);

    canvas.translate(_gw / 2, _gh / 2);
    canvas.rotate(math.pi);
    canvas.translate(-_gw / 2, -_gh / 2);

    _drawSlider(canvas, paint);

    canvas.restore();
  }

  void _drawSlider(Canvas canvas, Paint paint) {
    final half = strokeWidth / 2;

    final knob = RRect.fromRectAndRadius(
      Rect.fromCenter(
        center: const Offset(_knobCx, _rowY),
        width: _knobW,
        height: _knobH,
      ),
      const Radius.circular(_knobRadius),
    );

    canvas.drawLine(
      Offset(half, _rowY),
      Offset(knob.left, _rowY),
      paint,
    );

    canvas.drawLine(
      Offset(_rightLineStart + half, _rowY),
      Offset(_gw - half, _rowY),
      paint,
    );

    canvas.drawRRect(knob, paint);
  }

  @override
  bool shouldRepaint(covariant TuneIconPainter old) =>
      old.iconColor != iconColor ||
      old.circleColor != circleColor ||
      old.strokeWidth != strokeWidth ||
      old.showBackground != showBackground;
}

class TuneIcon extends StatelessWidget {
  const TuneIcon({
    super.key,
    this.size = 120,
    this.iconColor = const Color(0xFF1B1B1B),
    this.circleColor = const Color(0xFFFDFDFD),
    this.strokeWidth = 6.5,
    this.showBackground = true,
  });

  final double size;
  final Color iconColor;
  final Color circleColor;
  final double strokeWidth;
  final bool showBackground;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size.square(size),
      painter: TuneIconPainter(
        iconColor: iconColor,
        circleColor: circleColor,
        strokeWidth: strokeWidth,
        showBackground: showBackground,
      ),
    );
  }
}
