// Reusable Chip Widget
import 'package:flutter/material.dart';
import 'package:pet_adoption/core/constants/colors.dart';

class InfoChip extends StatelessWidget {
  final String label;
  final String sub;
  const InfoChip({super.key, required this.label, required this.sub});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: MyColors.primaryColor.withValues(alpha:0.1),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(label, style: TextStyle(color: MyColors.primaryColor)),
        ),
        const SizedBox(height: 4),
        Text(sub, style: const TextStyle(fontSize: 12, color: Colors.grey)),
      ],
    );
  }
}
