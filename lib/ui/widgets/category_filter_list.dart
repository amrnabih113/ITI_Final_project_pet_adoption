import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_adoption/controllers/pets/favourates_controller.dart';
import 'package:pet_adoption/models/category_model.dart';
import 'package:pet_adoption/ui/widgets/filter_chip_widget.dart';

class CategoryFilterList extends StatelessWidget {
  const CategoryFilterList({super.key, required this.categories});

  final List<CategoryModel> categories;

  @override
  Widget build(BuildContext context) {
    final allCategories = [
      CategoryModel(name: "All", image: "", id: '0'),
      ...categories,
    ];

    return SizedBox(
      height: 42,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: allCategories.length,
        itemBuilder: (context, index) {
          final label = allCategories[index].name;
          return Obx(
            () => FilterChipWidget(
              label: label,
              selected: FavouriteController.instance.selectedType.value,
              onSelected: (label) {
                FavouriteController.instance.selectedType.value = label;
                FavouriteController.instance.filterFavouritePets(
                  type: label == "All" ? null : label,
                );
              },
            ),
          );
        },
      ),
    );
  }
}
