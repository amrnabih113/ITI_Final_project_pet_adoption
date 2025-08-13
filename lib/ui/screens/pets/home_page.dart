import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_adoption/controllers/auth/user_controller.dart';
import 'package:pet_adoption/controllers/pets/home_page_controller.dart';
import 'package:pet_adoption/controllers/pets/pets_controller.dart';
import 'package:pet_adoption/core/constants/colors.dart';
import 'package:pet_adoption/core/utils/helpers/helper_functions.dart';
import 'package:pet_adoption/ui/screens/navigation_menu.dart';
import 'package:pet_adoption/ui/widgets/categories_list.dart';
import 'package:pet_adoption/ui/widgets/grid_shimmer.dart';
import 'package:pet_adoption/ui/widgets/my_body.dart';
import 'package:pet_adoption/ui/widgets/my_header_title.dart';
import 'package:pet_adoption/ui/widgets/my_home_app_bar.dart';
import 'package:pet_adoption/ui/widgets/my_search_bar.dart';
import 'package:pet_adoption/ui/widgets/pet_card.dart';
import 'package:pet_adoption/ui/widgets/top_wave_clipper.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      extendBody: true,
      body: Stack(
        children: [
          MyBody(
            image: "assets/images/background3.png",
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyHomeAppBar(),
                    const SizedBox(height: 20),
                    MySearchBar(
                      hintText: "Search for a pet",
                      onPressed: () {
                        NavigationController.instance.changePage(1);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          _BottomSheetContent(),
        ],
      ),
    );
  }
}

class _BottomSheetContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: ClipPath(
        clipper: TopWaveClipper(),
        child: Container(
          height: MyHelperFunctions.getScreenHeight() * 0.8,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          color: MyColors.light,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 20),
                _BannerCarousel(),
                const SizedBox(height: 20),
                MyHeaderTitle(title: "Categories", showSeeAll: false),
                CategoriesList(),
                const SizedBox(height: 20),
                MyHeaderTitle(title: "Recommended for you", showSeeAll: false),
                const SizedBox(height: 10),
                _RecommendedPetsGrid(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _BannerCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());

    return CarouselSlider(
      options: CarouselOptions(
        height: 150,
        autoPlay: true,
        enlargeCenterPage: true,
        viewportFraction: 0.9,
      ),
      items: controller.bannerImages.map((imagePath) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
        );
      }).toList(),
    );
  }
}

class _RecommendedPetsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final petsController = Get.put(PetsController());

    return Obx(
      () => petsController.isLoading.value
          ? const GridShimmer()
          : GridView.builder(
              itemCount: petsController.recommendedPets.length,
              shrinkWrap: true,
              padding: const EdgeInsets.only(bottom: 40),
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 270,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
              ),
              itemBuilder: (context, index) {
                final pet = petsController.recommendedPets[index];
                return PetGridCard(pet: pet);
              },
            ),
    );
  }
}
