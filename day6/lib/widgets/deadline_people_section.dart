import 'dart:math';
import 'package:flutter/material.dart';

class DeadlinePeopleSection extends StatelessWidget {
  const DeadlinePeopleSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _buildDeadlineCard(),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _buildPeopleCard(),
        ),
      ],
    );
  }

  Widget _buildDeadlineCard() {
    return Container(
      height: 110,
      padding: const EdgeInsets.only(
        top: 10,
        bottom: 8,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Deadline',
            style: TextStyle(
              fontSize: 13,
              color: Color(0xFF888888),
              fontWeight: FontWeight.w400,
            ),
          ),
          const Spacer(),
          const CalendarIcon(
            size: 30,
            color: Color(0xFF111111),
          ),
          const Spacer(),
          const Text(
            '12 April',
            style: TextStyle(
              fontFamily: 'NunitoSans',
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Color(0xFF292929),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPeopleCard() {
    return Container(
      height: 110,
      padding: const EdgeInsets.only(
        top: 10,
        bottom: 8,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'People',
            style: TextStyle(
              fontSize: 13,
              color: Color(0xFF888888),
              fontWeight: FontWeight.w400,
            ),
          ),
          const Spacer(),
          Transform.translate(
            offset: const Offset(0, 5),
            child: SizedBox(
              height: 50,
              width: 132,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    left: 12,
                    child: _buildAvatar(
                      'assets/profile_icons/avatar_1_girl.png',
                      size: 40,
                    ),
                  ),
                  Positioned(
                    left: 83,
                    child: _buildAvatar(
                      'assets/profile_icons/avatar_3_man.png',
                      size: 40,
                    ),
                  ),
                  Positioned(
                    left: 43,
                    child: _buildAvatar(
                      'assets/profile_icons/avatar_2_boy.png',
                      size: 49,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }

  Widget _buildAvatar(String imagePath, {double size = 46}) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.white,
          width: 1.5,
        ),
      ),
      child: ClipOval(
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class CalendarIcon extends StatelessWidget {
  final double size;
  final Color color;
  final double? strokeWidth;

  const CalendarIcon({
    super.key,
    this.size = 48.0,
    this.color = Colors.black,
    this.strokeWidth,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: CalendarIconPainter(
          color: color,
          strokeWidth: strokeWidth,
        ),
      ),
    );
  }
}

class CalendarIconPainter extends CustomPainter {
  final Color color;
  final double? strokeWidth;

  const CalendarIconPainter({
    this.color = const Color.fromARGB(255, 44, 43, 43),
    this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final double s = min(size.width, size.height);
    if (s <= 0) return;

    final double effectiveStroke = strokeWidth ?? (s * 0.060);
    final double bodyW = s * 0.75;
    final double bodyH = s * 0.75;
    final double cornerRadius = bodyW * 0.20;
    final double lugOverhang = bodyH * 0.125;
    final double totalH = bodyH + lugOverhang;

    final double centerX = size.width / 2.0;
    final double centerY = size.height / 2.0;

    final double bodyTop = centerY - (totalH / 2.0) + lugOverhang;
    final double bodyBottom = bodyTop + bodyH;
    final double bodyLeft = centerX - (bodyW / 2.0);
    final double bodyRight = centerX + (bodyW / 2.0);

    final Paint strokePaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = effectiveStroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..isAntiAlias = true;

    final Paint dotPaint = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final RRect bodyRRect = RRect.fromRectAndRadius(
      Rect.fromLTRB(bodyLeft, bodyTop, bodyRight, bodyBottom),
      Radius.circular(cornerRadius),
    );

    canvas.drawRRect(bodyRRect, strokePaint);

    final double dividerY = bodyTop + (bodyH * 0.33);

    canvas.drawLine(
      Offset(bodyLeft, dividerY),
      Offset(bodyRight, dividerY),
      strokePaint,
    );

    final double lug1X = bodyLeft + (bodyW * 0.275);
    final double lug2X = bodyRight - (bodyW * 0.275);
    final double lugTopY = bodyTop - lugOverhang;
    final double lugBottomY = bodyTop + lugOverhang;

    canvas.drawLine(
      Offset(lug1X, lugTopY),
      Offset(lug1X, lugBottomY),
      strokePaint,
    );

    canvas.drawLine(
      Offset(lug2X, lugTopY),
      Offset(lug2X, lugBottomY),
      strokePaint,
    );

    final double dotRadius = effectiveStroke * 0.70;
    final double row1Y = dividerY + ((bodyBottom - dividerY) * (1.0 / 3.0));
    final double row2Y = dividerY + ((bodyBottom - dividerY) * (2.0 / 3.0));

    final double col1X = lug1X;
    final double col2X = centerX;
    final double col3X = lug2X;

    canvas.drawCircle(Offset(col1X, row1Y), dotRadius, dotPaint);
    canvas.drawCircle(Offset(col2X, row1Y), dotRadius, dotPaint);
    canvas.drawCircle(Offset(col3X, row1Y), dotRadius, dotPaint);

    canvas.drawCircle(Offset(col1X, row2Y), dotRadius, dotPaint);
    canvas.drawCircle(Offset(col2X, row2Y), dotRadius, dotPaint);
  }

  @override
  bool shouldRepaint(covariant CalendarIconPainter oldDelegate) {
    return oldDelegate.color != color ||
        oldDelegate.strokeWidth != strokeWidth;
  }
}