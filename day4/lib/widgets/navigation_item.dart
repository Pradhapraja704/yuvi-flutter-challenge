
import 'package:flutter/material.dart';

class NavigationItem extends StatelessWidget {
  final IconData icon;
  final IconData selectedIcon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  final bool showIconFrame;

  const NavigationItem({
    super.key,
    required this.icon,
    required this.selectedIcon,
    required this.label,
    required this.isSelected,
    required this.onTap,
    this.showIconFrame = false,
  });

  @override
  Widget build(BuildContext context) {
    final Color itemColor = isSelected
        ? const Color(0xFFFF7F70)
        : const Color(0xFF666666);

    Widget navigationIcon;

    if (label == 'Home') {
      navigationIcon = CustomPaint(
        size: const Size(23, 23),
        painter: HomeSmileIconPainter(
          color: itemColor,
          isSelected: isSelected,
        ),
      );
    } else if (label == 'Calendar') {
      navigationIcon = CustomPaint(
        size: const Size(23, 23),
        painter: CalendarIconPainter(
          color: itemColor,
          isSelected: isSelected,
        ),
      );
    } else if (label == 'Analytics') {
      navigationIcon = CustomPaint(
        size: const Size(23, 23),
        painter: AnalyticsIconPainter(
          color: itemColor,
          isSelected: isSelected,
        ),
      );
    } else if (label == 'Profile') {
      navigationIcon = CustomPaint(
        size: const Size(23, 23),
        painter: ProfileIconPainter(
          color: itemColor,
          isSelected: isSelected,
        ),
      );
    } else {
      navigationIcon = Icon(
        isSelected ? selectedIcon : icon,
        size: 21,
        color: itemColor,
        weight: 300,
      );
    }

    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 54,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 25,
              child: Center(child: navigationIcon),
            ),
            const SizedBox(height: 2),
            Text(
              label,
              style: TextStyle(
                fontSize: 9,
                fontWeight: FontWeight.w400,
                color: itemColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileIconPainter extends CustomPainter {
  final Color color;
  final bool isSelected;

  ProfileIconPainter({
    required this.color,
    required this.isSelected,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final headCenter = Offset(
      size.width * 0.50,
      size.height * 0.27,
    );

    final headRadius = size.width * 0.17;

    final headPaint = Paint()
      ..color = color
      ..style = isSelected ? PaintingStyle.fill : PaintingStyle.stroke
      ..strokeWidth = 1.6
      ..isAntiAlias = true;

    canvas.drawCircle(
      headCenter,
      headRadius,
      headPaint,
    );

    final shoulderPath = Path()
      ..moveTo(size.width * 0.15, size.height * 0.90)
      ..cubicTo(
        size.width * 0.17,
        size.height * 0.68,
        size.width * 0.32,
        size.height * 0.56,
        size.width * 0.50,
        size.height * 0.56,
      )
      ..cubicTo(
        size.width * 0.68,
        size.height * 0.56,
        size.width * 0.83,
        size.height * 0.68,
        size.width * 0.85,
        size.height * 0.90,
      );

    final shoulderPaint = Paint()
      ..color = color
      ..style = isSelected ? PaintingStyle.fill : PaintingStyle.stroke
      ..strokeWidth = 1.7
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..isAntiAlias = true;

    if (isSelected) {
      final filledBody = Path()
        ..moveTo(size.width * 0.15, size.height * 0.90)
        ..cubicTo(
          size.width * 0.17,
          size.height * 0.68,
          size.width * 0.32,
          size.height * 0.56,
          size.width * 0.50,
          size.height * 0.56,
        )
        ..cubicTo(
          size.width * 0.68,
          size.height * 0.56,
          size.width * 0.83,
          size.height * 0.68,
          size.width * 0.85,
          size.height * 0.90,
        )
        ..close();

      canvas.drawPath(filledBody, shoulderPaint);
    } else {
      canvas.drawPath(shoulderPath, shoulderPaint);
    }
  }

  @override
  bool shouldRepaint(covariant ProfileIconPainter oldDelegate) {
    return oldDelegate.color != color ||
        oldDelegate.isSelected != isSelected;
  }
}

class AnalyticsIconPainter extends CustomPainter {
  final Color color;
  final bool isSelected;

  AnalyticsIconPainter({
    required this.color,
    required this.isSelected,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final outerRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(
        size.width * 0.13,
        size.height * 0.10,
        size.width * 0.74,
        size.height * 0.80,
      ),
      const Radius.circular(4.5),
    );

    final outerPaint = Paint()
      ..color = color
      ..style = isSelected ? PaintingStyle.fill : PaintingStyle.stroke
      ..strokeWidth = 1.7
      ..isAntiAlias = true;

    canvas.drawRRect(outerRect, outerPaint);

    final barColor = isSelected ? Colors.white : color;

    final barPaint = Paint()
      ..color = barColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.6
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true;

    canvas.drawLine(
      Offset(size.width * 0.35, size.height * 0.63),
      Offset(size.width * 0.35, size.height * 0.52),
      barPaint,
    );

    canvas.drawLine(
      Offset(size.width * 0.50, size.height * 0.63),
      Offset(size.width * 0.50, size.height * 0.35),
      barPaint,
    );

    canvas.drawLine(
      Offset(size.width * 0.65, size.height * 0.63),
      Offset(size.width * 0.65, size.height * 0.44),
      barPaint,
    );
  }

  @override
  bool shouldRepaint(covariant AnalyticsIconPainter oldDelegate) {
    return oldDelegate.color != color ||
        oldDelegate.isSelected != isSelected;
  }
}

class CalendarIconPainter extends CustomPainter {
  final Color color;
  final bool isSelected;

  CalendarIconPainter({
    required this.color,
    required this.isSelected,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final calendarRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(
        size.width * 0.13,
        size.height * 0.20,
        size.width * 0.74,
        size.height * 0.70,
      ),
      const Radius.circular(3),
    );

    final bodyPaint = Paint()
      ..color = color
      ..style = isSelected ? PaintingStyle.fill : PaintingStyle.stroke
      ..strokeWidth = 1.7
      ..isAntiAlias = true;

    canvas.drawRRect(calendarRect, bodyPaint);

    final detailColor = isSelected ? Colors.white : color;

    final detailPaint = Paint()
      ..color = detailColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true;

    canvas.drawLine(
      Offset(size.width * 0.13, size.height * 0.43),
      Offset(size.width * 0.87, size.height * 0.43),
      detailPaint,
    );

    canvas.drawLine(
      Offset(size.width * 0.34, size.height * 0.10),
      Offset(size.width * 0.34, size.height * 0.30),
      detailPaint,
    );

    canvas.drawLine(
      Offset(size.width * 0.66, size.height * 0.10),
      Offset(size.width * 0.66, size.height * 0.30),
      detailPaint,
    );

    final dotPaint = Paint()
      ..color = detailColor
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    for (final x in [0.32, 0.50, 0.68]) {
      for (final y in [0.58, 0.76]) {
        if (y == 0.58 || x != 0.68) {
          canvas.drawCircle(
            Offset(size.width * x, size.height * y),
            0.85,
            dotPaint,
          );
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant CalendarIconPainter oldDelegate) {
    return oldDelegate.color != color ||
        oldDelegate.isSelected != isSelected;
  }
}

class HomeSmileIconPainter extends CustomPainter {
  final Color color;
  final bool isSelected;

  HomeSmileIconPainter({
    required this.color,
    required this.isSelected,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final housePath = Path()
      ..moveTo(size.width * 0.12, size.height * 0.45)
      ..cubicTo(
        size.width * 0.22,
        size.height * 0.36,
        size.width * 0.39,
        size.height * 0.15,
        size.width * 0.46,
        size.height * 0.13,
      )
      ..cubicTo(
        size.width * 0.48,
        size.height * 0.11,
        size.width * 0.52,
        size.height * 0.11,
        size.width * 0.54,
        size.height * 0.13,
      )
      ..cubicTo(
        size.width * 0.61,
        size.height * 0.15,
        size.width * 0.78,
        size.height * 0.36,
        size.width * 0.88,
        size.height * 0.45,
      )
      ..quadraticBezierTo(
        size.width * 0.92,
        size.height * 0.49,
        size.width * 0.86,
        size.height * 0.51,
      )
      ..lineTo(size.width * 0.86, size.height * 0.81)
      ..quadraticBezierTo(
        size.width * 0.86,
        size.height * 0.91,
        size.width * 0.76,
        size.height * 0.91,
      )
      ..lineTo(size.width * 0.24, size.height * 0.91)
      ..quadraticBezierTo(
        size.width * 0.14,
        size.height * 0.91,
        size.width * 0.14,
        size.height * 0.81,
      )
      ..lineTo(size.width * 0.14, size.height * 0.51)
      ..quadraticBezierTo(
        size.width * 0.08,
        size.height * 0.49,
        size.width * 0.12,
        size.height * 0.45,
      )
      ..close();

    canvas.drawPath(
      housePath,
      Paint()
        ..color = color
        ..style = isSelected ? PaintingStyle.fill : PaintingStyle.stroke
        ..strokeWidth = 1.8
        ..strokeCap = StrokeCap.round
        ..strokeJoin = StrokeJoin.round
        ..isAntiAlias = true,
    );

    final smilePath = Path()
      ..moveTo(size.width * 0.35, size.height * 0.65)
      ..quadraticBezierTo(
        size.width * 0.50,
        size.height * 0.79,
        size.width * 0.65,
        size.height * 0.65,
      );

    canvas.drawPath(
      smilePath,
      Paint()
        ..color = isSelected ? Colors.white : color
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.6
        ..strokeCap = StrokeCap.round
        ..isAntiAlias = true,
    );
  }

  @override
  bool shouldRepaint(covariant HomeSmileIconPainter oldDelegate) {
    return oldDelegate.color != color ||
        oldDelegate.isSelected != isSelected;
  }
}
