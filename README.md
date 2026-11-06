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
| Git | Version control |
| GitHub | Source code management |

## Repository Structure

```text
yuvi-flutter-challenge/
│
├── day0/
│   ├── lib/
│   ├── web/
│   ├── screenshot.png
│   └── README.md
│
├── day1/
│   ├── lib/
│   ├── web/
│   ├── README.md
│   └── screenshots/
│
├── day2/
│   ├── lib/
│   │   ├── models/
│   │   │   └── habit_icon_data.dart
│   │   ├── screens/
│   │   │   └── new_habit_screen.dart
│   │   └── widgets/
│   │       ├── add_navigation_button.dart
│   │       ├── bottom_navigation_bar.dart
│   │       ├── navigation_item.dart
│   │       ├── habit_header.dart
│   │       ├── habit_name_section.dart
│   │       ├── habit_icon_selector.dart
│   │       ├── habit_frequency_selector.dart
│   │       ├── reminder_time_section.dart
│   │       └── create_habit_button.dart
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
| Day 4 | Pending | Not Started |
| Day 5 | Pending | Not Started |
| Day 6 | Pending | Not Started |
| Day 7 | Pending | Not Started |

## Day 2 – Implementation Highlights

- Developed a floating bottom navigation bar.
- Implemented Home, Calendar, Add, Analytics, and Profile navigation items.
- Added interactive navigation item selection.
- Created reusable UI components.
- Refactored the original single-file implementation into separate models, screens, and widget files.
- Maintained the existing UI design and functionality.
- Verified the implementation using Flutter Analyze.

## Day 3 – Implementation Highlights

- Implemented interactive bottom navigation between Home, Calendar, Add, Analytics, and Profile screens.
- Added dynamic Create Habit button colour changes based on user input.
- Implemented directional page transitions.
- Added smooth slide and fade animations using AnimatedSwitcher, AnimatedSlide, and AnimatedOpacity.
- Implemented an animated transition for the New Habit screen.
- Improved the initial loading experience by preloading the Add Habit screen.
- Verified the implementation using Flutter Analyze.

**Demo Video:** `day3/day3_demo.mp4`

## Running a Project

Navigate to the required day folder:


cd day3


Install dependencies:


flutter pub get


Run the application in Chrome:


flutter run -d chrome


Analyze the code:


flutter analyze


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