import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:noto_3d_emoji/noto_3d_emoji.dart';

import 'screens/new_habit_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await NotoEmoji.initialize(
      url: 'https://meander.sbs/cdn/NotoColorEmoji_vector.ttf',
    );
  } catch (e) {
    debugPrint('Emoji font loading failed: $e');
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Habit Tracker',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF8F6F4),
        fontFamily: GoogleFonts.poppins().fontFamily,
        useMaterial3: true,
      ),
      home: const NewHabitScreen(),
    );
  }
}