import 'package:flutter/material.dart';
import 'package:pet_adoption/core/constants/colors.dart';

class FilterChipWidget extends StatelessWidget {
  final String label;
  final String selected;
  final Function(String) onSelected;

  const FilterChipWidget({
    super.key,
    required this.label,
    required this.selected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = label == selected;

    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: ChoiceChip(
        label: Text(
          label,
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
            color: isSelected ? MyColors.primaryColor : MyColors.textPrimary,
            fontSize: 14,
          ),
        ),
        selected: isSelected,
        onSelected: (_) => onSelected(label),
        selectedColor: MyColors.primaryColor.withValues(alpha: 0.2),
        backgroundColor: Colors.white,
        checkmarkColor: MyColors.black,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        shape: RoundedRectangleBorder(
          side: BorderSide(color: MyColors.primaryColor.withValues(alpha: 0.6)),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
