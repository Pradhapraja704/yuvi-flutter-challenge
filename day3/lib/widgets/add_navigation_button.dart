
import 'package:flutter/material.dart';

class AddNavigationButton extends StatelessWidget {
  final VoidCallback onTap;

  const AddNavigationButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 44,
        height: 44,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: [
              Color(0xFFFF9B79),
              Color(0xFFFF6F70),
            ],
          ),
        ),
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 26,
        ),
      ),
    );
  }
}
