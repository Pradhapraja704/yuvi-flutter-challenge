# Day 4 – New Habit Creation Screen

## Overview

Day 4 focuses on recreating the provided New Habit Creation reference mockup in the Flutter Habit Tracker application. The implementation emphasizes matching the reference design's typography, layout, spacing, colours, and activity illustrations.

## Screenshot

![Day 4 Habit Tracker](screenshot.png)

## Implementation Highlights

- Identified **Poppins** as the font that closely matches the reference mockup.
- Integrated Poppins using the Google Fonts package.
- Replicated the reference screen's typography, colours, spacing, alignment, and overall layout.
- Created and integrated eight custom 3D-style PNG activity icons.
- Replaced standard emoji representations in the activity selector with custom PNG assets.
- Standardized icon dimensions and alignment for visual consistency.
- Organized the implementation into reusable screens, widgets, and model files.

## Custom Activity Icons

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

All icons are stored in `assets/activity_icons/`.

## Technologies Used

- Flutter
- Dart
- Google Fonts – Poppins
- Material Design
- Custom PNG assets

## Project Structure

```text
day4/
├── assets/
│   └── activity_icons/
│       ├── all_in.png
│       ├── cycling.png
│       ├── drawing.png
│       ├── reading.png
│       ├── running.png
│       ├── singing.png
│       ├── sleeping.png
│       └── yoga.png
├── lib/
│   ├── models/
│   ├── screens/
│   └── widgets/
├── screenshot.png
└── README.md