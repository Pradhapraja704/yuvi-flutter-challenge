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
| --- | --- |
| Flutter | UI development framework |
| Dart | Programming language |
| Visual Studio Code | Development environment |
| Google Chrome | Flutter Web execution |
| Google Fonts – Poppins | Typography used in the Day 4 mockup replication |
| Nunito Sans | Typography used in the Day 6 Home Dashboard |
| Custom PNG Assets | Activity illustrations and profile avatars |
| Custom Painters & Linear Gradients | Navigation bar styling and dashboard UI enhancements |
| StatefulWidget and setState | Interactive habit completion |
| Git | Version control |
| GitHub | Source code management |

## Repository Structure

```text
yuvi-flutter-challenge/
│
├── day0/
│   ├── lib/
│   │   └── main.dart
│   ├── test/
│   │   └── widget_test.dart
│   ├── web/
│   ├── .gitignore
│   ├── .metadata
│   ├── analysis_options.yaml
│   ├── pubspec.yaml
│   ├── pubspec.lock
│   ├── screenshot.png
│   └── README.md
│
├── day1/
│   ├── lib/
│   │   ├── screens/
│   │   │   └── new_habit_screen.dart
│   │   └── main.dart
│   ├── test/
│   ├── web/
│   ├── .gitignore
│   ├── .metadata
│   ├── analysis_options.yaml
│   ├── pubspec.yaml
│   ├── screenshot1.png
│   ├── screenshot2.png
│   └── README.md
│
├── day2/
│   ├── lib/
│   │   ├── models/
│   │   │   └── habit_icon_data.dart
│   │   ├── screens/
│   │   │   └── new_habit_screen.dart
│   │   ├── widgets/
│   │   │   ├── add_navigation_button.dart
│   │   │   ├── bottom_navigation_bar.dart
│   │   │   ├── create_habit_button.dart
│   │   │   ├── habit_frequency_selector.dart
│   │   │   ├── habit_header.dart
│   │   │   ├── habit_icon_selector.dart
│   │   │   ├── habit_name_section.dart
│   │   │   └── navigation_item.dart
│   │   └── main.dart
│   ├── test/
│   ├── web/
│   ├── .gitignore
│   ├── .metadata
│   ├── analysis_options.yaml
│   ├── pubspec.yaml
│   ├── screenshot.png
│   └── README.md
│
├── day3/
│   ├── lib/
│   │   ├── models/
│   │   ├── screens/
│   │   ├── widgets/
│   │   └── main.dart
│   ├── test/
│   ├── web/
│   ├── .gitignore
│   ├── .metadata
│   ├── analysis_options.yaml
│   ├── pubspec.yaml
│   ├── day3_demo.mp4
│   └── README.md
│
├── day4/
│   ├── assets/
│   │   └── activity_icons/
│   ├── lib/
│   │   ├── models/
│   │   ├── screens/
│   │   ├── widgets/
│   │   └── main.dart
│   ├── test/
│   ├── web/
│   ├── .gitignore
│   ├── .metadata
│   ├── analysis_options.yaml
│   ├── pubspec.yaml
│   ├── screenshot.png
│   └── README.md
│
├── day5/
│   ├── assets/
│   │   └── activity_icons/
│   ├── lib/
│   │   ├── models/
│   │   ├── screens/
│   │   │   ├── home_screen.dart
│   │   │   ├── new_habit_screen.dart
│   │   │   └── placeholder_screen.dart
│   │   └── widgets/
│   │       ├── add_navigation_button.dart
│   │       ├── bottom_navigation_bar.dart
│   │       ├── navigation_item.dart
│   │       └── ...
│   ├── screenshot1.png
│   ├── screenshot2.png
│   └── README.md
│
├── day6/
│   ├── assets/
│   │   ├── activity_icons/
│   │   ├── fonts/
│   │   ├── profile_icons/
│   │   └── profile.png
│   ├── lib/
│   │   ├── models/
│   │   │   └── habit_icon_data.dart
│   │   ├── screens/
│   │   │   ├── home_screen.dart
│   │   │   ├── new_habit_screen.dart
│   │   │   └── placeholder_screen.dart
│   │   ├── widgets/
│   │   │   ├── add_navigation_button.dart
│   │   │   ├── bottom_navigation_bar.dart
│   │   │   ├── create_habit_button.dart
│   │   │   ├── daily_progress_card.dart
│   │   │   ├── deadline_people_section.dart
│   │   │   ├── habit_frequency_selector.dart
│   │   │   ├── habit_header.dart
│   │   │   ├── habit_icon_selector.dart
│   │   │   ├── habit_name_section.dart
│   │   │   ├── home_header.dart
│   │   │   ├── navigation_item.dart
│   │   │   ├── reminder_time_section.dart
│   │   │   └── today_habits_section.dart
│   │   └── main.dart
│   ├── test/
│   │   └── widget_test.dart
│   ├── web/
│   ├── screenshot.png
│   ├── analysis_options.yaml
│   ├── pubspec.yaml
│   ├── pubspec.lock
│   └── README.md
│
├── day7/
│
└── README.md
```

Each day contains an independent Flutter project with its own source code, supporting files, screenshots or demo recordings, and documentation.

## Development Progress

| Day | Task | Status |
| --- | --- | --- |
| Day 0 | Flutter Environment Setup | Completed |
| Day 1 | Habit Creation Screen | Completed |
| Day 2 | Bottom Navigation Bar and Code Refactoring | Completed |
| Day 3 | Interactive Navigation and Animations | Completed |
| Day 4 | New Habit Creation Screen – Mockup Replication | Completed |
| Day 5 | Navigation Bar Refinement & Home Screen | Completed |
| Day 6 | Home Dashboard UI Refinement & Interactive Habit Cards | Completed |
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

**Screenshot:** `day0/screenshot.png`

## Day 1 – Habit Creation Screen

- Built the Habit Creation screen for the Flutter Habit Tracker application.
- Added a text field for entering a habit name.
- Implemented interactive habit icon selection.
- Added frequency options: Daily, Weekdays, Weekends, and Custom.
- Implemented a reminder time picker.
- Added a Create Habit button with a confirmation message.
- Created a scrollable layout designed for mobile screens.

**Screenshot:** `day1/screenshot1.png`
**Screenshot:** `day1/screenshot2.png`

## Day 2 – Bottom Navigation Bar and Code Refactoring

- Developed a floating bottom navigation bar.
- Implemented Home, Calendar, Add, Analytics, and Profile navigation items.
- Added interactive navigation item selection.
- Created reusable UI components.
- Refactored the original single-file implementation into separate models, screens, and widget files.
- Maintained the existing UI design and functionality.
- Verified the implementation using Flutter Analyze.

**Screenshot:** `day2/screenshot.png`

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
| --- | --- |
| Yoga | `yoga.png` |
| Singing | `singing.png` |
| Reading | `reading.png` |
| Running | `running.png` |
| Sleeping | `sleeping.png` |
| Drawing | `drawing.png` |
| Cycling | `cycling.png` |
| All In | `all_in.png` |

**Screenshot:** `day4/screenshot.png`

## Day 5 – Navigation Bar Refinement & Home Screen

The focus of Day 5 was refining the bottom navigation bar and creating the initial layout of the second screen (Home Dashboard) in the Flutter Habit Tracker application.

### Implementation Highlights

#### Navigation Bar Refinement

- Replicated and refined the Home, Calendar, Analytics, and Profile navigation icons to closely match the reference design.
- Implemented an orange-to-pink linear gradient for all selected navigation icons.
- Applied matching gradient styling to selected navigation labels.
- Refined the Profile icon's head and shoulder proportions.
- Improved the plus button with a lighter icon and gradient circular background.
- Adjusted navigation bar dimensions, spacing, rounded corners, and shadow.
- Implemented responsive navigation label sizing to prevent text wrapping across different screen widths.
- Preserved existing navigation functionality.

#### Second Screen – Home Dashboard

- Created the initial basic layout of the Home Dashboard.
- Added a Home screen header.
- Created a Daily Progress card.
- Added Deadline and People sections.
- Created a Today's Habits section with hardcoded sample data.
- Integrated the Home screen into the existing bottom navigation.

The Home Dashboard initially contained a basic UI layout, which was refined further in Day 6.

**Screenshots:**

- `day5/screenshot1.png` (Navigation Bar Refinement)
- `day5/screenshot2.png` (Basic Home Screen Layout)

## Day 6 – Home Dashboard UI Refinement & Interactive Habit Cards

The focus of Day 6 was refining the Home Dashboard UI and adding interactive functionality to the habit cards.

### Implementation Highlights

#### Home Dashboard Refinement

- Refined the Home Dashboard layout.
- Added a header displaying the current date and profile image.
- Integrated the Daily Progress card with completion information and best streak.
- Added custom gradient progress styling.
- Refined the Deadline and People sections.
- Integrated custom calendar and flame icons.
- Added overlapping profile avatars in the People section.
- Used the Nunito Sans font for dashboard typography.
- Removed the separate heading above the habit cards to match the intended layout.

#### Interactive Habit Cards

- Added activity illustrations to the habit cards.
- Displayed habit names and streak information.
- Implemented custom flame icons for streak indicators.
- Added gradient completion indicators for completed habits.
- Implemented tap interactions to toggle individual habit completion states.
- Used StatefulWidget and setState to update the UI when a habit is selected.

Habit completion changes are maintained in the current widget session; persistent storage has not been implemented.

#### Profile Navigation

- Made the profile image in the Home Dashboard clickable.
- Connected the profile image to the Profile navigation tab.
- Integrated the interaction with the existing bottom navigation system.

#### Custom Painters

The dashboard uses custom painters for its visual components:

- `TuneIconPainter`
- `CalendarIconPainter`
- `GradientProgressPainter`
- `FlamePainter`
- `CheckIconPainter`

**Screenshot:** `day6/screenshot.png`

## Running a Project

Navigate to the required project folder. For example, to run Day 6:

```bash
cd day6
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