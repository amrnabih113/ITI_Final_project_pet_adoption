
import 'package:flutter/material.dart';
import 'package:pet_adoption/core/constants/colors.dart';
import 'package:pet_adoption/core/constants/sizes.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({super.key, required this.icon, required this.title});
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 5,
      children: [
        Icon(icon, color: MyColors.primaryColor, size: MySizes.iconMd),
        Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }
}
