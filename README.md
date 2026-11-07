# Yuvi Flutter Challenge – 7-Day Technical Assignment

## Project Overview

This repository contains my work for the 7-Day Flutter Technical Assignment conducted by **Yuvi Labs and Technologies** as part of the ESEC 2026 final round.

The objective is to develop Flutter Web applications by implementing the assigned UI components, following clean coding practices, and maintaining daily development progress through GitHub.

## Objectives

- Learn and apply Flutter and Dart.
- Develop UI components based on the provided design references.
- Build reusable and maintainable widgets.
- Follow Flutter naming conventions and clean coding practices.
- Test and validate applications using Flutter Analyze.
- Maintain independent Flutter projects for each challenge day.
- Document implementation details and learning outcomes.

## Technology Stack

| Technology | Purpose |
|---|---|
| Flutter | UI development framework |
| Dart | Programming language |
| Visual Studio Code | Development environment |
| Google Chrome | Flutter Web execution |
| Google Fonts – Poppins | Typography used in the Day 4 mockup replication |
| Custom PNG Assets | Activity illustrations used in Day 4 |
| Git | Version control |
| GitHub | Source code management |

## Repository Structure

```text
yuvi-flutter-challenge/
│
├── day0/
│   ├── lib/
│   ├── test/
│   ├── web/
│   ├── screenshot.png
│   └── README.md
│
├── day1/
│   ├── lib/
│   ├── test/
│   ├── web/
│   ├── screenshot1.png
│   ├── screenshot2.png
│   └── README.md
│
├── day2/
│   ├── lib/
│   │   ├── models/
│   │   ├── screens/
│   │   └── widgets/
│   ├── test/
│   ├── web/
│   ├── screenshot.png
│   └── README.md
│
├── day3/
│   ├── lib/
│   ├── web/
│   ├── day3_demo.mp4
│   └── README.md
│
├── day4/
│   ├── assets/
│   │   └── activity_icons/
│   │       ├── all_in.png
│   │       ├── cycling.png
│   │       ├── drawing.png
│   │       ├── reading.png
│   │       ├── running.png
│   │       ├── singing.png
│   │       ├── sleeping.png
│   │       └── yoga.png
│   ├── lib/
│   │   ├── models/
│   │   ├── screens/
│   │   ├── widgets/
│   │   └── main.dart
│   ├── test/
│   ├── web/
│   ├── pubspec.yaml
│   └── README.md
│
├── day5/
├── day6/
├── day7/
│
└── README.md
```

Each day contains an independent Flutter project with its own source code, screenshot or demo recording, and documentation.

## Development Progress

| Day | Task | Status |
|---|---|---|
| Day 0 | Flutter Environment Setup | Completed |
| Day 1 | Habit Creation Screen | Completed |
| Day 2 | Bottom Navigation Bar and Code Refactoring | Completed |
| Day 3 | Interactive Navigation and Animations | Completed |
| Day 4 | New Habit Creation Screen – Mockup Replication | Completed |
| Day 5 | Pending | Not Started |
| Day 6 | Pending | Not Started |
| Day 7 | Pending | Not Started |

## Day 0 – Flutter Environment Setup

- Installed and configured the Flutter SDK.
- Configured the Dart SDK.
- Set up Flutter development in Visual Studio Code.
- Configured Flutter Web support.
- Created the initial Flutter project.
- Installed project dependencies.
- Successfully executed the application in Google Chrome.
- Verified the project using Flutter Analyze.
- Created the initial project documentation and screenshot.

## Day 1 – Habit Creation Screen

- Built the Habit Creation screen for the Flutter Habit Tracker application.
- Added a text field for entering a habit name.
- Implemented interactive habit icon selection.
- Added frequency options: Daily, Weekdays, Weekends, and Custom.
- Implemented a reminder time picker.
- Added a Create Habit button with a confirmation message.
- Created a scrollable layout designed for mobile screens.

## Day 2 – Bottom Navigation Bar and Code Refactoring

- Developed a floating bottom navigation bar.
- Implemented Home, Calendar, Add, Analytics, and Profile navigation items.
- Added interactive navigation item selection.
- Created reusable UI components.
- Refactored the original single-file implementation into separate models, screens, and widget files.
- Maintained the existing UI design and functionality.
- Verified the implementation using Flutter Analyze.

## Day 3 – Interactive Navigation and Button Enhancement

- Implemented interactive bottom navigation between Home, Calendar, Add Habit, Analytics, and Profile screens.
- Added dynamic Create Habit button colour changes based on user input.
- Implemented directional page transitions.
- Added smooth slide and fade animations using AnimatedSwitcher, AnimatedSlide, and AnimatedOpacity.
- Implemented an animated transition for the New Habit screen.
- Improved the initial loading experience by preloading the Add Habit screen.

**Demo Video:** `day3/day3_demo.mp4`

## Day 4 – New Habit Creation Screen and Mockup Replication

The focus of Day 4 was to recreate the provided New Habit Creation reference mockup as closely as possible using Flutter.

### Implementation Highlights

- Identified **Poppins** as the font that closely matches the reference mockup.
- Integrated Poppins using the Google Fonts package.
- Replicated the reference screen's typography, colours, spacing, alignment, and overall layout.
- Created and integrated eight custom 3D-style PNG activity icons.
- Replaced standard emoji representations in the activity selector with custom PNG assets.
- Standardized icon dimensions and alignment for visual consistency.
- Organized the implementation into reusable screens, widgets, and model files.

### Custom Activity Icons

| Activity | Asset |
|---|---|
| Yoga | `yoga.png` |
| Singing | `singing.png` |
| Reading | `reading.png` |
| Running | `running.png` |
| Sleeping | `sleeping.png` |
| Drawing | `drawing.png` |
| Cycling | `cycling.png` |
| All In | `all_in.png` |

**Screenshot:** `day4/day4_screenshot.png`

## Running a Project

Navigate to the required project folder. For example, to run Day 4:

```bash
cd day4
```

Install dependencies:

```bash
flutter pub get
```

Run the application in Chrome:

```bash
flutter run -d chrome
```

Analyze the code:

```bash
flutter analyze
```

## Development Guidelines

- Use meaningful and consistent naming conventions.
- Follow Dart and Flutter coding standards.
- Build reusable widgets wherever appropriate.
- Avoid unnecessarily deep widget nesting.
- Maintain separate documentation and screenshots for each day.
- Commit and push completed work to GitHub regularly.

## Repository

**GitHub:** [Pradhapraja704/yuvi-flutter-challenge](https://github.com/Pradhapraja704/yuvi-flutter-challenge)

## Assignment

**Yuvi Labs and Technologies – ESEC 2026**

7-Day Flutter Technical Assignment
