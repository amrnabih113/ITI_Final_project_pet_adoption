
import 'package:flutter/material.dart';
import 'package:pet_adoption/ui/widgets/filter_chip_widget.dart';

class CategoryFilterList extends StatelessWidget {
  const CategoryFilterList({
    super.key,
    required this.selectedIndex,
    required this.categories,
  });

  final int selectedIndex;
  final List<String> categories;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return FilterChipWidget(
            label: categories[index],
            selected: categories[selectedIndex],
            onSelected: (label) => print(label),
          );
        },
      ),
    );
  }
}
