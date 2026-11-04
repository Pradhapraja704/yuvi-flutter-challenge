
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
    debugPrint('Selected Icon: ${habitIcons[selectedIconIndex].name}');
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
        Container(
          width: 40,
          height: 40,
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: IconButton(
            padding: EdgeInsets.zero,
            onPressed: () => Navigator.maybePop(context),
            icon: const Icon(
              Icons.chevron_left,
              size: 24,
              color: Color(0xFF333333),
            ),
          ),
        ),
        const Expanded(
          child: Center(
            child: Text(
              'New Habit',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color(0xFF222222),
              ),
            ),
          ),
        ),
        Container(
          width: 40,
          height: 40,
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {},
            icon: const Icon(
              Icons.more_vert,
              size: 22,
              color: Color(0xFF333333),
            ),
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
          style: const TextStyle(
            fontSize: 13,
            color: Color(0xFF333333),
          ),
          decoration: InputDecoration(
            hintText: 'e.g. Morning Meditation',
            hintStyle: const TextStyle(
              fontSize: 12,
              color: Color(0xFF888888),
            ),
            filled: true,
            fillColor: const Color(0xFFEAEAEA),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 18,
              vertical: 13,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}

class HabitIconData {
  final String emoji;
  final String name;

  const HabitIconData(this.emoji, this.name);
}

class HabitIconSelector extends StatelessWidget {
  final List<HabitIconData> icons;
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
          'Choose Icon',
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
  final List<HabitIconData> icons;
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
    return LayoutBuilder(
      builder: (context, constraints) {
        const spacing = 6.0;
        final itemWidth =
            (constraints.maxWidth - spacing * 3) / 4;

        return Wrap(
          spacing: spacing,
          runSpacing: 6,
          children: List.generate(
            icons.length,
            (index) => SizedBox(
              width: itemWidth,
              height: 69,
              child: HabitIconItem(
                data: icons[index],
                isSelected: selectedIndex == index,
                onTap: () => onSelected(index),
              ),
            ),
          ),
        );
      },
    );
  }
}

class HabitIconItem extends StatelessWidget {
  final HabitIconData data;
  final bool isSelected;
  final VoidCallback onTap;

  const HabitIconItem({
    super.key,
    required this.data,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: Container(
        decoration: BoxDecoration(
          color: isSelected
              ? const Color(0xFFFFE5DC)
              : Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: isSelected
                ? const Color(0xFFFF947B)
                : Colors.transparent,
            width: 1,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              data.emoji,
              style: const TextStyle(fontSize: 25),
            ),
            const SizedBox(height: 3),
            Text(
              data.name,
              maxLines: 1,
              style: const TextStyle(
                fontSize: 10,
                color: Color(0xFF222222),
              ),
            ),
          ],
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
          'Choose Icon',
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
    return LayoutBuilder(
      builder: (context, constraints) {
        const spacing = 8.0;
        final itemWidth =
            (constraints.maxWidth - spacing) / 2;

        return Wrap(
          spacing: spacing,
          runSpacing: 8,
          children: frequencies.map((frequency) {
            return SizedBox(
              width: itemWidth,
              height: 40,
              child: HabitFrequencyItem(
                title: frequency,
                isSelected: selectedFrequency == frequency,
                onTap: () => onSelected(frequency),
              ),
            );
          }).toList(),
        );
      },
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
      borderRadius: BorderRadius.circular(30),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: isSelected
              ? const LinearGradient(
                  colors: [
                    Color(0xFFFF9B79),
                    Color(0xFFFF6F70),
                  ],
                )
              : null,
          color: isSelected ? null : Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 12,
            color: isSelected
                ? const Color(0xFF222222)
                : const Color(0xFF777777),
            fontWeight: isSelected
                ? FontWeight.w500
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
