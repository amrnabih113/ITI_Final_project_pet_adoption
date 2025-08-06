import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_adoption/core/constants/colors.dart';
import 'package:pet_adoption/ui/screens/pets/category_details.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({
    super.key,
    required this.categories,
    required this.icons,
  });

  final List<String> categories;
  final List<String> icons;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: categories.length,
        itemBuilder: (context, i) {
          return Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: GestureDetector(
              onTap: () => Get.to(() => CategoryDetails()),
              child: Container(
                width: 80,
                decoration: BoxDecoration(
                  color: MyColors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: MyColors.primaryColor),
                  //shape: BoxShape.circle,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      icons[i],
                      width: 30,
                      color: MyColors.primaryColor,
                    ),
                    SizedBox(height: 8),
                    Text(
                      categories[i],
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
