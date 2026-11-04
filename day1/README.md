# Day 1 – Habit Creation Screen

## Overview

Day 1 focuses on building the Habit Creation screen for the Flutter Habit Tracker application. The screen allows users to enter a habit name, select an icon, choose a frequency, and set a reminder time.

## Features Implemented

- **Habit Name:** Text field for entering a habit name.
- **Habit Icon Selection:** Interactive icon selector with multiple options.
- **Frequency Selection:** Options for Daily, Weekdays, Weekends, and Custom.
- **Reminder Time:** Time picker to select a preferred reminder time.
- **Create Habit Button:** Button with a confirmation message.
- **Responsive Layout:** Scrollable layout designed for mobile screens.

## Technologies Used

- Flutter
- Dart
- Material Design 3

## Project Structure

```text
day1/
├── lib/
│   ├── main.dart
│   └── screens/
│       └── new_habit_screen.dart
├── test/
├── web/
├── pubspec.yaml
├── analysis_options.yaml
└── README.md
```

## Run the Application

Install dependencies:


flutter pub get

Run in Chrome:


flutter run -d chrome


Check code quality:


flutter analyze


## Screenshot

The application screenshot is available in `screenshot1.png`.
The application screenshot is available in `screenshot2.png`.

## Learning Outcomes

- Understanding Flutter widget composition.
- Building reusable UI components.
- Managing widget state using `setState()`.
- Handling user input with `TextField`.
- Displaying and handling a time picker.
- Applying Material Design styling.

## Status

**Completed:** Day 1 – Habit Creation Screen