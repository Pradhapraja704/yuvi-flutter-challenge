import 'package:flutter/material.dart';

class DeadlinePeopleSection extends StatelessWidget {
  const DeadlinePeopleSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _buildDeadlineCard(),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _buildPeopleCard(),
        ),
      ],
    );
  }

  Widget _buildDeadlineCard() {
    return Container(
      height: 145,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.calendar_month_rounded,
            color: Color(0xFFFF8278),
            size: 24,
          ),
          const Spacer(),
          const Text(
            'Next Deadline',
            style: TextStyle(
              fontSize: 12,
              color: Color(0xFF888888),
            ),
          ),
          const SizedBox(height: 5),
          const Text(
            'Nov 12',
            style: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.bold,
              color: Color(0xFF292929),
            ),
          ),
          const Text(
            'Project submission',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 10,
              color: Color(0xFF888888),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPeopleCard() {
    return Container(
      height: 145,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.people_alt_rounded,
            color: Color(0xFFFF8278),
            size: 24,
          ),
          const Spacer(),
          const Text(
            'Your People',
            style: TextStyle(
              fontSize: 12,
              color: Color(0xFF888888),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              _buildAvatar('A', const Color(0xFFFFD6C9)),
              _buildAvatar('S', const Color(0xFFD6E5FF)),
              _buildAvatar('R', const Color(0xFFE4D6FF)),
              Container(
                width: 29,
                height: 29,
                decoration: const BoxDecoration(
                  color: Color(0xFFFFE8E2),
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Text(
                    '+2',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFFF7778),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAvatar(String letter, Color color) {
    return Container(
      width: 29,
      height: 29,
      margin: const EdgeInsets.only(right: 4),
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          letter,
          style: const TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.bold,
            color: Color(0xFF444444),
          ),
        ),
      ),
    );
  }
}