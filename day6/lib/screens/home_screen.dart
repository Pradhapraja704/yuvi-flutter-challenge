import 'package:flutter/material.dart';
import '../widgets/home_header.dart';
import '../widgets/daily_progress_card.dart';
import '../widgets/deadline_people_section.dart';
import '../widgets/today_habits_section.dart';

class HomeScreen extends StatelessWidget {
  final VoidCallback onProfileTap;

  const HomeScreen({
    super.key,
    required this.onProfileTap,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F6F4),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 110),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomeHeader(
                onProfileTap: onProfileTap,
              ),
              const SizedBox(height: 18),
              const DailyProgressCard(),
              const SizedBox(height: 18),
              const DeadlinePeopleSection(),
              const SizedBox(height: 25),
              const TodayHabitsSection(),
            ],
          ),
        ),
      ),
    );
  }
}