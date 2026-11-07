
import 'package:flutter/material.dart';

import '../models/habit_icon_data.dart';
import '../widgets/bottom_navigation_bar.dart';
import '../widgets/create_habit_button.dart';
import '../widgets/habit_frequency_selector.dart';
import '../widgets/habit_header.dart';
import '../widgets/habit_icon_selector.dart';
import '../widgets/habit_name_section.dart';
import '../widgets/reminder_time_section.dart';
import 'placeholder_screen.dart';

class NewHabitScreen extends StatefulWidget {
  const NewHabitScreen({super.key});

  @override
  State<NewHabitScreen> createState() => _NewHabitScreenState();
}

class _NewHabitScreenState extends State<NewHabitScreen> {
  int selectedIndex = 0;
  int previousSelectedIndex = 0;
  bool isAddingHabit = false;

  Offset transitionOffset = const Offset(1, 0);

  void selectPage(int index) {
    setState(() {
      if (isAddingHabit) {
        transitionOffset = const Offset(0, -1);
      } else {
        transitionOffset = index > selectedIndex
            ? const Offset(1, 0)
            : const Offset(-1, 0);
      }

      selectedIndex = index;
      isAddingHabit = false;
    });
  }

  void openAddScreen() {
    setState(() {
      previousSelectedIndex = selectedIndex;
      transitionOffset = const Offset(0, 1);
      selectedIndex = -1;
      isAddingHabit = true;
    });
  }

  void closeAddScreen() {
    setState(() {
      transitionOffset = const Offset(0, -1);
      selectedIndex = previousSelectedIndex;
      isAddingHabit = false;
    });
  }

  Widget buildCurrentPage() {
    final pageIndex =
        isAddingHabit ? previousSelectedIndex : selectedIndex;

    switch (pageIndex) {
      case 0:
        return const PlaceholderScreen(
          key: ValueKey('home'),
          title: 'Home',
        );
      case 1:
        return const PlaceholderScreen(
          key: ValueKey('calendar'),
          title: 'Calendar',
        );
      case 2:
        return const PlaceholderScreen(
          key: ValueKey('analytics'),
          title: 'Analytics',
        );
      case 3:
        return const PlaceholderScreen(
          key: ValueKey('profile'),
          title: 'Profile',
        );
      default:
        return const PlaceholderScreen(
          key: ValueKey('home'),
          title: 'Home',
        );
    }
  }

  Widget buildPageTransition(
    Widget child,
    Animation<double> animation,
  ) {
    final isEntering = animation.status != AnimationStatus.reverse;

    final beginOffset = isEntering ? transitionOffset : Offset.zero;

    final endOffset = isEntering ? Offset.zero : -transitionOffset;

    final slideAnimation = Tween<Offset>(
      begin: beginOffset,
      end: endOffset,
    ).animate(
      CurvedAnimation(
        parent: animation,
        curve: Curves.easeInOutCubic,
      ),
    );

    return FadeTransition(
      opacity: animation,
      child: SlideTransition(
        position: slideAnimation,
        child: child,
      ),
    );
  }

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
                  Expanded(
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 350),
                      switchInCurve: Curves.easeInOutCubic,
                      switchOutCurve: Curves.easeInOutCubic,
                      transitionBuilder: buildPageTransition,
                      child: buildCurrentPage(),
                    ),
                  ),
                ],
              ),
              IgnorePointer(
                ignoring: !isAddingHabit,
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 350),
                  curve: Curves.easeInOutCubic,
                  opacity: isAddingHabit ? 1 : 0,
                  child: AnimatedSlide(
                    duration: const Duration(milliseconds: 350),
                    curve: Curves.easeInOutCubic,
                    offset: isAddingHabit
                        ? Offset.zero
                        : const Offset(0, 1),
                    child: ColoredBox(
                      color: const Color(0xFFF8F6F4),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(
                              20, 20, 20, 0,
                            ),
                            child: HabitHeader(
                              onBack: closeAddScreen,
                            ),
                          ),
                          const Expanded(
                            child: NewHabitContent(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 10,
                right: 10,
                bottom: 8,
                child: HabitBottomNavigationBar(
                  selectedIndex: selectedIndex,
                  onItemSelected: selectPage,
                  onAdd: openAddScreen,
                ),
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
  void initState() {
    super.initState();
    habitNameController.addListener(updateButtonState);
  }

  void updateButtonState() {
    setState(() {});
  }

  @override
  void dispose() {
    habitNameController.removeListener(updateButtonState);
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
            isActive: habitNameController.text.trim().isNotEmpty,
          ),
        ],
      ),
    );
  }
}
