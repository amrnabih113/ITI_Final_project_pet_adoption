

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pet_adoption/core/constants/colors.dart';

class MySearchBar extends StatelessWidget {
  final String hintText;
  final VoidCallback? onPressed;

  const MySearchBar({required this.hintText, this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        filled: false,
        prefixIcon: const Icon(Iconsax.search_normal_1),
        prefixIconColor: MyColors.primaryColor,
        hintStyle: Theme.of(
          context,
        ).textTheme.titleMedium?.copyWith(color: MyColors.textSecondary),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: MyColors.primaryColor, width: 2),
        ),
        hintText: hintText,
      ),
    );
  }
}
