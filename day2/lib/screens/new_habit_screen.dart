import 'package:flutter/material.dart';

import '../models/habit_icon_data.dart';
import '../widgets/bottom_navigation_bar.dart';
import '../widgets/create_habit_button.dart';
import '../widgets/habit_frequency_selector.dart';
import '../widgets/habit_header.dart';
import '../widgets/habit_icon_selector.dart';
import '../widgets/habit_name_section.dart';
import '../widgets/reminder_time_section.dart';

class NewHabitScreen extends StatelessWidget {
  const NewHabitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final textScale = (screenWidth / 375).clamp(1.0, 1.18);

    return MediaQuery(
      data: MediaQuery.of(context).copyWith(
        textScaler: TextScaler.linear(textScale),
      ),
      child: Scaffold(
        backgroundColor: const Color(0xFFF8F6F4),
        body: SafeArea(
          child: Stack(
            fit: StackFit.expand,
            children: [
              Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: HabitHeader(),
                  ),
                  const Expanded(
                    child: NewHabitContent(),
                  ),
                ],
              ),
              const Positioned(
                left: 10,
                right: 10,
                bottom: 8,
                child: HabitBottomNavigationBar(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NewHabitContent extends StatefulWidget {
  const NewHabitContent({super.key});

  @override
  State<NewHabitContent> createState() => _NewHabitContentState();
}

class _NewHabitContentState extends State<NewHabitContent> {
  final TextEditingController habitNameController =
      TextEditingController();

  int selectedIconIndex = 0;
  String selectedFrequency = 'Daily';

  TimeOfDay selectedTime = const TimeOfDay(
    hour: 8,
    minute: 0,
  );

  final List<HabitIconData> habitIcons = [
    HabitIconData('🧘', 'Yoga'),
    HabitIconData('🎵', 'Singing'),
    HabitIconData('📚', 'Reading'),
    HabitIconData('🏃', 'Running'),
    HabitIconData('💤', 'Sleeping'),
    HabitIconData('🎨', 'Drawing'),
    HabitIconData('🚴', 'Cycling'),
    HabitIconData('⊞', 'All In'),
  ];

  @override
  void dispose() {
    habitNameController.dispose();
    super.dispose();
  }

  Future<void> selectReminderTime() async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );

    if (pickedTime != null) {
      setState(() {
        selectedTime = pickedTime;
      });
    }
  }

  void createHabit() {
    final habitName = habitNameController.text.trim();

    if (habitName.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter a habit name.'),
        ),
      );
      return;
    }

    final formattedTime =
        MaterialLocalizations.of(context).formatTimeOfDay(selectedTime);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          '$habitName habit created successfully!',
        ),
      ),
    );

    debugPrint('Habit Name: $habitName');
    debugPrint('Selected Icon: ${habitIcons[selectedIconIndex].name}');
    debugPrint('Frequency: $selectedFrequency');
    debugPrint('Reminder Time: $formattedTime');

    habitNameController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(20, 32, 20, 110),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HabitNameSection(
            controller: habitNameController,
          ),
          const SizedBox(height: 28),
          HabitIconSelector(
            icons: habitIcons,
            selectedIndex: selectedIconIndex,
            onSelected: (index) {
              setState(() {
                selectedIconIndex = index;
              });
            },
          ),
          const SizedBox(height: 28),
          HabitFrequencySelector(
            selectedFrequency: selectedFrequency,
            onSelected: (frequency) {
              setState(() {
                selectedFrequency = frequency;
              });
            },
          ),
          const SizedBox(height: 28),
          ReminderTimeSection(
            selectedTime: selectedTime,
            onTap: selectReminderTime,
          ),
          const SizedBox(height: 24),
          CreateHabitButton(
            onPressed: createHabit,
          ),
        ],
      ),
    );
  }
}