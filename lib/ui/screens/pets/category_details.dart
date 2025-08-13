import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_adoption/controllers/pets/categories_controller.dart';
import 'package:pet_adoption/core/constants/colors.dart';
import 'package:pet_adoption/models/category_model.dart';
import 'package:pet_adoption/models/pets_model.dart';
import 'package:pet_adoption/ui/widgets/horizontal_pet_card.dart';
import 'package:pet_adoption/ui/widgets/my_header_title.dart';
import 'package:pet_adoption/ui/widgets/pet_card.dart';

class CategoryDetails extends StatelessWidget {
  final CategoryModel category;
  CategoryDetails({super.key, required this.category});

  final CategoriesController controller = CategoriesController.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              category.name,
              style: Theme.of(
                context,
              ).textTheme.headlineLarge!.copyWith(color: MyColors.primaryColor),
            ),
            const SizedBox(width: 10),
            Image.network(category.image, height: 30, width: 30),
          ],
        ),
        shape: UnderlineInputBorder(
          borderSide: BorderSide(color: MyColors.primaryColor),
          borderRadius: BorderRadius.circular(40),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// ----------- MALE ------------
            MyHeaderTitle(title: "Male", showSeeAll: false),
            const SizedBox(height: 10),
            Obx(() {
              final malePets = controller.pets
                  .where((pet) => pet.gender == "male")
                  .toList();
              return _buildCarousel(malePets);
            }),

            const SizedBox(height: 10),

            /// ----------- FEMALE ------------
            MyHeaderTitle(title: "Female", showSeeAll: false),
            const SizedBox(height: 10),
            Obx(() {
              final femalepets = controller.pets
                  .where((pet) => pet.gender == "female")
                  .toList();
              return _buildCarousel(femalepets);
            }),
            const SizedBox(height: 10),

            /// ----------- ALL ------------
            MyHeaderTitle(title: "Both Genders", showSeeAll: false),
            const SizedBox(height: 10),
            Obx(() => _buildPetGrid(context, controller.pets)),
          ],
        ),
      ),
    );
  }

  Widget _buildCarousel(List<PetsModel> petList) {
    if (petList.isEmpty) {
      return const Text("No pets available");
    }
    return CarouselSlider.builder(
      itemCount: petList.length,
      itemBuilder: (context, index, realIdx) {
        final pet = petList[index];
        return PetCard(height: 150, pet: pet);
      },
      options: CarouselOptions(
        height: 170,
        enlargeCenterPage: true,
        enableInfiniteScroll: false,
        viewportFraction: 0.9,
        autoPlay: true,
      ),
    );
  }

  Widget _buildPetGrid(BuildContext context, List<PetsModel> petList) {
    return GridView.builder(
      itemCount: petList.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: 280,
      ),
      itemBuilder: (context, index) {
        final pet = petList[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: PetGridCard(pet: pet),
        );
      },
    );
  }
}
