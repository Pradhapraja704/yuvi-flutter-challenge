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
        width: 49,
        height: 49,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFFFA17F),
              Color(0xFFFF7778),
            ],
          ),
        ),
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 29,
          weight: 300,
        ),
      ),
    );
  }
}