
import 'package:flutter/material.dart';

class NewHabitScreen extends StatelessWidget {
  const NewHabitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F6F4),
      body: SafeArea(
        child: const NewHabitContent(),
      ),
    );
  }
}

class NewHabitContent extends StatelessWidget {
  const NewHabitContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HabitHeader(),
          SizedBox(height: 32),
          HabitNameSection(),
          SizedBox(height: 28),
          HabitIconSelector(),
          SizedBox(height: 28),
          HabitFrequencySelector(),
          SizedBox(height: 28),
          ReminderTimeSection(),
          SizedBox(height: 32),
          CreateHabitButton(),
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
  const HabitNameSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Habit Name',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Color(0xFF333333),
          ),
        ),
        SizedBox(height: 12),
        TextField(
          decoration: InputDecoration(
            hintText: 'e.g. Drink 2L water',
            filled: true,
            fillColor: Colors.white,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 18,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}

class HabitIconSelector extends StatefulWidget {
  const HabitIconSelector({super.key});

  @override
  State<HabitIconSelector> createState() => _HabitIconSelectorState();
}

class _HabitIconSelectorState extends State<HabitIconSelector> {
  int selectedIndex = 0;

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
          icons: habitIcons,
          selectedIndex: selectedIndex,
          onSelected: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
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

class HabitFrequencySelector extends StatefulWidget {
  const HabitFrequencySelector({super.key});

  @override
  State<HabitFrequencySelector> createState() =>
      _HabitFrequencySelectorState();
}

class _HabitFrequencySelectorState
    extends State<HabitFrequencySelector> {
  String selectedFrequency = 'Daily';

  final List<String> frequencies = [
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
          onSelected: (frequency) {
            setState(() {
              selectedFrequency = frequency;
            });
          },
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

class ReminderTimeSection extends StatefulWidget {
  const ReminderTimeSection({super.key});

  @override
  State<ReminderTimeSection> createState() =>
      _ReminderTimeSectionState();
}

class _ReminderTimeSectionState extends State<ReminderTimeSection> {
  TimeOfDay selectedTime = const TimeOfDay(
    hour: 8,
    minute: 0,
  );

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

  @override
  Widget build(BuildContext context) {
    final formattedTime = MaterialLocalizations.of(context)
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
          onTap: selectReminderTime,
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
  const CreateHabitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 54,
      child: ElevatedButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Create Habit button clicked!'),
            ),
          );
        },
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
