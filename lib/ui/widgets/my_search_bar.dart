import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pet_adoption/core/constants/colors.dart';

class MySearchBar extends StatelessWidget {
  final String hintText;
  final VoidCallback? onPressed;
  final ValueChanged<String>? onChanged;

  const MySearchBar({
    required this.hintText,
    this.onPressed,
    this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return TextField(
      onTap: onPressed,
      onChanged: onChanged,
      readOnly:
          onPressed !=
          null, // makes it non-editable if onPressed is set (for navigation)
      style: textTheme.bodyLarge?.copyWith(color: MyColors.textPrimary),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: textTheme.titleMedium?.copyWith(
          color: MyColors.textSecondary,
        ),
        prefixIcon: const Icon(
          Iconsax.search_normal_1,
          color: MyColors.primaryColor,
        ),

        // Visual Styling
        filled: true,
        fillColor: MyColors.white,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 14,
          horizontal: 16,
        ),

        // Border Styles
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: MyColors.primaryColor,
            width: 1.5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: MyColors.primaryColor, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: MyColors.primaryColor,
            width: 1.5,
          ),
        ),
      ),
    );
  }
}

