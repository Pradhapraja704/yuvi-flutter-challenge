
import 'package:flutter/material.dart';

class NewHabitScreen extends StatelessWidget {
  const NewHabitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFF8F6F4),
      body: SafeArea(
        child: NewHabitContent(),
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

  final List<IconData> habitIcons = [
    Icons.water_drop,
    Icons.fitness_center,
    Icons.menu_book,
    Icons.directions_run,
    Icons.self_improvement,
    Icons.restaurant,
    Icons.bedtime,
    Icons.code,
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
        MaterialLocalizations.of(context)
            .formatTimeOfDay(selectedTime);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          '$habitName habit created successfully!',
        ),
      ),
    );

    debugPrint('Habit Name: $habitName');
    debugPrint('Selected Icon: $selectedIconIndex');
    debugPrint('Frequency: $selectedFrequency');
    debugPrint('Reminder Time: $formattedTime');

    habitNameController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HabitHeader(),
          const SizedBox(height: 32),
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
          const SizedBox(height: 32),
          CreateHabitButton(
            onPressed: createHabit,
          ),
        ],
      ),
    );
  }
}

class HabitHeader extends StatelessWidget {
  const HabitHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () => Navigator.maybePop(context),
          icon: const Icon(Icons.arrow_back),
          color: const Color(0xFF333333),
        ),
        const SizedBox(width: 8),
        const Text(
          'Create New Habit',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xFFB7573A),
          ),
        ),
      ],
    );
  }
}

class HabitNameSection extends StatelessWidget {
  final TextEditingController controller;

  const HabitNameSection({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Habit Name',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Color(0xFF333333),
          ),
        ),
        const SizedBox(height: 12),
        TextField(
          controller: controller,
          decoration: const InputDecoration(
            hintText: 'e.g. Drink 2L water',
            filled: true,
            fillColor: Colors.white,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 18,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(12),
              ),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}

class HabitIconSelector extends StatelessWidget {
  final List<IconData> icons;
  final int selectedIndex;
  final ValueChanged<int> onSelected;

  const HabitIconSelector({
    super.key,
    required this.icons,
    required this.selectedIndex,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Choose an Icon',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Color(0xFF333333),
          ),
        ),
        const SizedBox(height: 12),
        HabitIconGrid(
          icons: icons,
          selectedIndex: selectedIndex,
          onSelected: onSelected,
        ),
      ],
    );
  }
}

class HabitIconGrid extends StatelessWidget {
  final List<IconData> icons;
  final int selectedIndex;
  final ValueChanged<int> onSelected;

  const HabitIconGrid({
    super.key,
    required this.icons,
    required this.selectedIndex,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: List.generate(
        icons.length,
        (index) => HabitIconItem(
          icon: icons[index],
          isSelected: selectedIndex == index,
          onTap: () => onSelected(index),
        ),
      ),
    );
  }
}

class HabitIconItem extends StatelessWidget {
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const HabitIconItem({
    super.key,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: Container(
        width: 58,
        height: 58,
        decoration: BoxDecoration(
          color: isSelected
              ? const Color(0xFFFFE5DC)
              : Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: isSelected
                ? const Color(0xFFB7573A)
                : Colors.transparent,
            width: 1.5,
          ),
        ),
        child: Icon(
          icon,
          size: 25,
          color: const Color(0xFFB7573A),
        ),
      ),
    );
  }
}

class HabitFrequencySelector extends StatelessWidget {
  final String selectedFrequency;
  final ValueChanged<String> onSelected;

  const HabitFrequencySelector({
    super.key,
    required this.selectedFrequency,
    required this.onSelected,
  });

  static const List<String> frequencies = [
    'Daily',
    'Weekdays',
    'Weekends',
    'Custom',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'How often?',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Color(0xFF333333),
          ),
        ),
        const SizedBox(height: 12),
        HabitFrequencyOptions(
          frequencies: frequencies,
          selectedFrequency: selectedFrequency,
          onSelected: onSelected,
        ),
      ],
    );
  }
}

class HabitFrequencyOptions extends StatelessWidget {
  final List<String> frequencies;
  final String selectedFrequency;
  final ValueChanged<String> onSelected;

  const HabitFrequencyOptions({
    super.key,
    required this.frequencies,
    required this.selectedFrequency,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: frequencies.map((frequency) {
        return HabitFrequencyItem(
          title: frequency,
          isSelected: selectedFrequency == frequency,
          onTap: () => onSelected(frequency),
        );
      }).toList(),
    );
  }
}

class HabitFrequencyItem extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const HabitFrequencyItem({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 14,
        ),
        decoration: BoxDecoration(
          color: isSelected
              ? const Color(0xFFFFE5DC)
              : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected
                ? const Color(0xFFB7573A)
                : Colors.transparent,
          ),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: const Color(0xFFB7573A),
            fontWeight: isSelected
                ? FontWeight.bold
                : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}

class ReminderTimeSection extends StatelessWidget {
  final TimeOfDay selectedTime;
  final VoidCallback onTap;

  const ReminderTimeSection({
    super.key,
    required this.selectedTime,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final formattedTime =
        MaterialLocalizations.of(context)
            .formatTimeOfDay(selectedTime);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Set Reminder',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Color(0xFF333333),
          ),
        ),
        const SizedBox(height: 12),
        ReminderTimeField(
          time: formattedTime,
          onTap: onTap,
        ),
      ],
    );
  }
}

class ReminderTimeField extends StatelessWidget {
  final String time;
  final VoidCallback onTap;

  const ReminderTimeField({
    super.key,
    required this.time,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 18,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            const Icon(
              Icons.access_time,
              color: Color(0xFFB7573A),
            ),
            const SizedBox(width: 12),
            Text(
              time,
              style: const TextStyle(
                fontSize: 15,
                color: Color(0xFF333333),
              ),
            ),
            const Spacer(),
            const Icon(
              Icons.keyboard_arrow_down,
              color: Color(0xFF777777),
            ),
          ],
        ),
      ),
    );
  }
}

class CreateHabitButton extends StatelessWidget {
  final VoidCallback onPressed;

  const CreateHabitButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 54,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFB7573A),
          foregroundColor: Colors.white,
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        child: const Text(
          'Create Habit',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
