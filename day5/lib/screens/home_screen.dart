import 'package:flutter/material.dart';
import '../widgets/home_header.dart';
import '../widgets/daily_progress_card.dart';
import '../widgets/deadline_people_section.dart';
import '../widgets/today_habits_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F6F4),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 110),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomeHeader(),
              SizedBox(height: 25),
              DailyProgressCard(),
              SizedBox(height: 18),
              DeadlinePeopleSection(),
              SizedBox(height: 25),
              TodayHabitsSection(),
            ],
          ),
        ),
      ),
    );
  }
}