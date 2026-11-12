
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'daily_progress_card.dart' show FlameIcon;

class TodayHabitsSection extends StatefulWidget {
  const TodayHabitsSection({super.key});

  @override
  State<TodayHabitsSection> createState() =>
      _TodayHabitsSectionState();
}

class _TodayHabitsSectionState extends State<TodayHabitsSection> {
  final List<bool> _completed = [
    false,
    false,
    false,
    false,
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildHabitItem(
          index: 0,
          imagePath: 'assets/activity_icons/reading.png',
          fallbackIcon: Icons.menu_book_rounded,
          title: 'Read 20 pages',
          streak: '12 days',
        ),
        _buildHabitItem(
          index: 1,
          imagePath: 'assets/activity_icons/running.png',
          fallbackIcon: Icons.fitness_center_rounded,
          title: 'Morning Workout',
          streak: '8 days',
        ),
        _buildHabitItem(
          index: 2,
          imagePath: 'assets/activity_icons/reading.png',
          fallbackIcon: Icons.code_rounded,
          title: 'Practice Coding',
          streak: '15 days',
        ),
        _buildHabitItem(
          index: 3,
          imagePath: 'assets/activity_icons/yoga.png',
          fallbackIcon: Icons.self_improvement_rounded,
          title: 'Meditation',
          streak: '3 days',
        ),
      ],
    );
  }

  Widget _buildHabitItem({
    required int index,
    required String imagePath,
    required IconData fallbackIcon,
    required String title,
    required String streak,
  }) {
    final isCompleted = _completed[index];

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(19),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          borderRadius: BorderRadius.circular(19),
          onTap: () {
            setState(() {
              _completed[index] = !_completed[index];
            });
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 5,
            ),
            child: Row(
              children: [
                Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF7F7F7),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  alignment: Alignment.center,
                  child: Image.asset(
                    imagePath,
                    width: 44,
                    height: 44,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return Icon(
                        fallbackIcon,
                        size: 27,
                        color: const Color(0xFF555555),
                      );
                    },
                  ),
                ),
                const SizedBox(width: 13),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        title,
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFF292929),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          const FlameIcon(
                            size: 19,
                            color: Color(0xFFE6752A),
                            strokeWidth: 8,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            streak,
                            style: const TextStyle(
                              fontFamily: 'NunitoSans',
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF777777),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 25,
                  height: 25,
                  decoration: BoxDecoration(
                    gradient: isCompleted
                        ? const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color.fromARGB(255, 246, 170, 132),
                              Color(0xFFFF8C75),
                              Color.fromARGB(255, 255, 95, 95),
                            ],
                            stops: [0.0, 0.52, 1.0],
                          )
                        : null,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: isCompleted
                          ? const Color(0xFFFF8278)
                          : const Color(0xFFC8C8C8),
                      width: 1.5,
                    ),
                  ),
                  child: isCompleted
                      ? const CustomPaint(
                          painter: CheckIconPainter(),
                          size: Size(25, 25),
                        )
                      : null,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CheckIconPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;

  const CheckIconPainter({
    this.color = Colors.white,
    this.strokeWidth = 2.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final Path path = Path();
    canvas.scale(size.width / 24.0, size.height / 24.0);

    path.moveTo(7.0, 12.5);
    path.quadraticBezierTo(8.5, 14.5, 10.0, 15.5);
    path.quadraticBezierTo(12.0, 11.0, 17.5, 7.5);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
