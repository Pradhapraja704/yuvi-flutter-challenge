
import 'package:flutter/material.dart';

const LinearGradient navigationGradient = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [
    Color(0xFFFFA17F),
    Color(0xFFFF7778),
  ],
);

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
    final screenWidth = MediaQuery.sizeOf(context).width;

    final itemWidth = ((screenWidth - 110) / 4).clamp(48.0, 90.0);
    final fontSize = (screenWidth * 0.0293).clamp(9.0, 11.0);

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
          gradient: navigationGradient,
        ),
      );
    } else if (label == 'Calendar') {
      navigationIcon = CustomPaint(
        size: const Size(23, 23),
        painter: CalendarIconPainter(
          color: itemColor,
          isSelected: isSelected,
          gradient: navigationGradient,
        ),
      );
    } else if (label == 'Analytics') {
      navigationIcon = CustomPaint(
        size: const Size(23, 23),
        painter: AnalyticsIconPainter(
          color: itemColor,
          isSelected: isSelected,
          gradient: navigationGradient,
        ),
      );
    } else if (label == 'Profile') {
      navigationIcon = CustomPaint(
        size: const Size(23, 23),
        painter: ProfileIconPainter(
          color: itemColor,
          isSelected: isSelected,
          gradient: navigationGradient,
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
        width: itemWidth,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 25,
              child: Center(child: navigationIcon),
            ),
            const SizedBox(height: 2),
            SizedBox(
              width: itemWidth,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  label,
                  maxLines: 1,
                  softWrap: false,
                  style: TextStyle(
                    fontSize: fontSize,
                    fontWeight: FontWeight.w400,
                    color: isSelected ? null : itemColor,
                    foreground: isSelected
                        ? (Paint()
                          ..shader = navigationGradient.createShader(
                            const Rect.fromLTWH(0, 0, 90, 20),
                          ))
                        : null,
                  ),
                ),
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
  final Gradient gradient;

  ProfileIconPainter({
    required this.color,
    required this.isSelected,
    required this.gradient,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final double w = size.width;
    final double h = size.height;

    final headPaint = Paint()
      ..color = color
      ..style = isSelected ? PaintingStyle.fill : PaintingStyle.stroke
      ..strokeWidth = 1.7
      ..isAntiAlias = true;

    if (isSelected) {
      headPaint.shader = gradient.createShader(
        Rect.fromLTWH(0, 0, w, h),
      );
    }

    canvas.drawCircle(
      Offset(w * 0.50, h * 0.35),
      w * 0.22,
      headPaint,
    );

    final shoulderPath = Path()
      ..moveTo(w * 0.19, h * 0.87)
      ..cubicTo(
        w * 0.19, h * 0.65,
        w * 0.33, h * 0.51,
        w * 0.55, h * 0.55,
      )
      ..cubicTo(
        w * 0.67, h * 0.51,
        w * 0.81, h * 0.65,
        w * 0.81, h * 0.87,
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
        ..moveTo(w * 0.19, h * 0.90)
        ..cubicTo(
          w * 0.19, h * 0.65,
          w * 0.33, h * 0.51,
          w * 0.50, h * 0.51,
        )
        ..cubicTo(
          w * 0.67, h * 0.51,
          w * 0.81, h * 0.65,
          w * 0.81, h * 0.90,
        )
        ..close();

      shoulderPaint.shader = gradient.createShader(
        Rect.fromLTWH(0, 0, w, h),
      );

      canvas.drawPath(filledBody, shoulderPaint);
    } else {
      canvas.drawPath(shoulderPath, shoulderPaint);
    }
  }

  @override
  bool shouldRepaint(covariant ProfileIconPainter oldDelegate) {
    return oldDelegate.color != color ||
        oldDelegate.isSelected != isSelected ||
        oldDelegate.gradient != gradient;
  }
}

class AnalyticsIconPainter extends CustomPainter {
  final Color color;
  final bool isSelected;
  final Gradient gradient;

  AnalyticsIconPainter({
    required this.color,
    required this.isSelected,
    required this.gradient,
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

    if (isSelected) {
      outerPaint.shader = gradient.createShader(
        Rect.fromLTWH(0, 0, size.width, size.height),
      );
    }

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
        oldDelegate.isSelected != isSelected ||
        oldDelegate.gradient != gradient;
  }
}

class CalendarIconPainter extends CustomPainter {
  final Color color;
  final bool isSelected;
  final Gradient gradient;

  CalendarIconPainter({
    required this.color,
    required this.isSelected,
    required this.gradient,
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

    if (isSelected) {
      bodyPaint.shader = gradient.createShader(
        Rect.fromLTWH(0, 0, size.width, size.height),
      );
    }

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
        oldDelegate.isSelected != isSelected ||
        oldDelegate.gradient != gradient;
  }
}

class HomeSmileIconPainter extends CustomPainter {
  final Color color;
  final bool isSelected;
  final Gradient gradient;

  HomeSmileIconPainter({
    required this.color,
    required this.isSelected,
    required this.gradient,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final double w = size.width;
    final double h = size.height;

    final housePath = Path()
      ..moveTo(w * 0.81, h * 0.36)
      ..lineTo(w * 0.58, h * 0.19)
      ..quadraticBezierTo(w * 0.50, h * 0.14, w * 0.42, h * 0.19)
      ..lineTo(w * 0.19, h * 0.36)
      ..quadraticBezierTo(w * 0.13, h * 0.41, w * 0.13, h * 0.48)
      ..lineTo(w * 0.13, h * 0.78)
      ..quadraticBezierTo(w * 0.13, h * 0.90, w * 0.25, h * 0.90)
      ..lineTo(w * 0.75, h * 0.90)
      ..quadraticBezierTo(w * 0.87, h * 0.90, w * 0.87, h * 0.78)
      ..lineTo(w * 0.87, h * 0.48)
      ..quadraticBezierTo(w * 0.87, h * 0.41, w * 0.81, h * 0.36)
      ..close();

    final housePaint = Paint()
      ..color = color
      ..style = isSelected ? PaintingStyle.fill : PaintingStyle.stroke
      ..strokeWidth = 1.7
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..isAntiAlias = true;

    if (isSelected) {
      housePaint.shader = gradient.createShader(
        Rect.fromLTWH(0, 0, w, h),
      );
    }

    canvas.drawPath(housePath, housePaint);

    final smilePath = Path()
      ..moveTo(w * 0.35, h * 0.63)
      ..quadraticBezierTo(
        w * 0.50,
        h * 0.75,
        w * 0.65,
        h * 0.63,
      );

    canvas.drawPath(
      smilePath,
      Paint()
        ..color = isSelected ? Colors.white : color
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.5
        ..strokeCap = StrokeCap.round
        ..isAntiAlias = true,
    );
  }

  @override
  bool shouldRepaint(covariant HomeSmileIconPainter oldDelegate) {
    return oldDelegate.color != color ||
        oldDelegate.isSelected != isSelected ||
        oldDelegate.gradient != gradient;
  }
}
