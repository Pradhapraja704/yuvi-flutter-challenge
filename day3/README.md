# Day 3 – Interactive Navigation and Button Enhancement

## Overview
Day 3 focuses on improving the Habit Tracker application with interactive navigation, button state changes, and smooth page transitions.

## Features Implemented

- **Dynamic Create Habit Button:** The button changes its colour when the user enters a habit name.
- **Interactive Bottom Navigation:** Added navigation between Home, Calendar, Add Habit, Analytics, and Profile screens.
- **Smooth Page Transitions:** Implemented directional slide and fade animations when switching between screens.
- **New Habit Screen Animation:** Added a slide animation when opening and closing the Add Habit screen.
- **Preloaded UI:** Improved the initial loading experience of the Add Habit screen.

## Technologies Used
- Flutter
- Dart
- Material UI
- Flutter Web

## Project Structure
```text
day3/
├── lib/
│   ├── main.dart
│   ├── models/
│   │   └── habit_icon_data.dart
│   ├── screens/
│   │   ├── new_habit_screen.dart
│   │   └── placeholder_screen.dart
│   └── widgets/
│       ├── add_navigation_button.dart
│       ├── bottom_navigation_bar.dart
│       ├── create_habit_button.dart
│       ├── habit_frequency_selector.dart
│       ├── habit_header.dart
│       ├── habit_icon_selector.dart
│       ├── habit_name_section.dart
│       ├── navigation_item.dart
│       └── reminder_time_section.dart
├── test/
├── web/
├── day3_demo.mp4
├── pubspec.yaml
└── README.md
```

## Demo Video
The Day 3 implementation is demonstrated in the following video:

`day3_demo.mp4`

## Learning Outcomes
- Implemented StatefulWidget and setState.
- Learned to handle bottom navigation interactions.
- Used AnimatedSwitcher, AnimatedSlide, and AnimatedOpacity.
- Implemented smooth page transitions.
- Improved UI responsiveness and user interaction.

## Run the Project


flutter pub get
flutter run -d chrome


## Status
Day 3 completed successfully.