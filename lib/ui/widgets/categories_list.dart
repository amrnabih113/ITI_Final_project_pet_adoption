import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_adoption/controllers/pets/categories_controller.dart';
import 'package:pet_adoption/core/constants/colors.dart';
import 'package:pet_adoption/models/category_model.dart';
import 'package:pet_adoption/ui/screens/pets/category_details.dart';
import 'package:pet_adoption/ui/widgets/category_shimmer.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    final CategoriesController controller = Get.put(CategoriesController());
    return Obx(
      () => controller.isLoading.value
          ? const MyCategoryShimmer()
          : SizedBox(
              height: 80,
              child: Obx(() {
                RxList<CategoryModel> categories = controller.categories;
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: categories.length,
                  itemBuilder: (context, i) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 12.0),
                      child: GestureDetector(
                        onTap: () async {
                          await controller.getCategoryPets(categories[i].name);
                          Get.to(
                            () => CategoryDetails(category: categories[i]),
                          );
                        },
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
                              Image.network(
                                categories[i].image,
                                width: 30,
                                color: MyColors.primaryColor,
                              ),
                              SizedBox(height: 8),
                              Text(
                                categories[i].name,
                                style: Theme.of(context).textTheme.bodyMedium
                                    ?.copyWith(fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              }),
            ),
    );
  }
}
