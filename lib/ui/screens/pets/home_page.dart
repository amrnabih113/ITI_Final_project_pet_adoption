import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_adoption/core/constants/colors.dart';

import 'package:pet_adoption/core/utils/helpers/helper_functions.dart';
import 'package:pet_adoption/models/pets_model.dart';
import 'package:pet_adoption/ui/screens/pets/search_page.dart';
import 'package:pet_adoption/ui/widgets/categories_list.dart';
import 'package:pet_adoption/ui/widgets/my_body.dart';
import 'package:pet_adoption/ui/widgets/my_header_title.dart';
import 'package:pet_adoption/ui/widgets/my_home_app_bar.dart';
import 'package:pet_adoption/ui/widgets/my_search_bar.dart';
import 'package:pet_adoption/ui/widgets/pet_card.dart';
import 'pet_details.dart';

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
                    SizedBox(height: 20),
                    MySearchBar(
                      hintText: "Search for a pet",
                      onPressed: () => Get.to(() => PetSearchPage(pets: [])),
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
  const _BottomSheetContent();

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
          decoration: BoxDecoration(
            color: MyColors.light,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.5),
                blurRadius: 10,
                spreadRadius: 2,
              ),
            ],
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 20),
                _BannerCarousel(),
                SizedBox(height: 20),
                MyHeaderTitle(title: "Categories", showSeeAll: false),
                _CategorySection(),
                SizedBox(height: 20),
                MyHeaderTitle(title: "Recommended for you", showSeeAll: false),
                SizedBox(height: 10),
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
  const _BannerCarousel();

  final List<String> _images = const [
    "assets/banners/banner1.png",
    "assets/banners/banner2.png",
    "assets/banners/banner3.png",
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 150,
        autoPlay: true,
        enlargeCenterPage: true,
        viewportFraction: 0.9,
      ),
      items: _images.map((imagePath) {
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

// ───── Categories Section ─────
class _CategorySection extends StatelessWidget {
  const _CategorySection();

  final List<String> _categories = const [
    'Dogs',
    'Cats',
    'Birds',
    'Rabbits',
    'Turtles',
  ];
  final List<String> _icons = const [
    "assets/categories/dog.png",
    "assets/categories/cat.png",
    "assets/categories/bird.png",
    "assets/categories/rabbit.png",
    "assets/categories/turtle.png",
  ];

  @override
  Widget build(BuildContext context) {
    return CategoriesList(categories: _categories, icons: _icons);
  }
}

// ───── Pet Grid Section ─────
class _RecommendedPetsGrid extends StatelessWidget {
  const _RecommendedPetsGrid();

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 5,
      shrinkWrap: true,
      padding: EdgeInsets.only(bottom: 40),
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: 270,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => Get.to(
            () => PetDetails(
              pet: PetsModel(
                images: [
                  'https://images.pexels.com/photos/104827/cat-pet-animal-domestic-104827.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                  'https://c8.alamy.com/comp/P6CMJR/a-gray-and-white-domestic-shorthair-cat-with-green-eyes-P6CMJR.jpg',
                ],
                name: 'Milo',
                breed: 'Siamese Cat',
                gender: 'Male',
                age: 2,
                location: 'Alexandria, Egypt',
                weight: 3.2,
                isVaccinated: true,
                characteristics: [
                  'Friendly',
                  'Loyal',
                  'Playful',
                  'Good with kids',
                ],
                createdAt: DateTime.now(),
                id: "",
                type: 'Cat',
                createdBy: "Amr Nabih",
                isAdopted: false,
                description:
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
              ),
            ),
          ),
          child: PetGridCard(
            isFavorited: false,
            onFavoriteToggle: () {},
            image:
                'https://c8.alamy.com/comp/P6CMJR/a-gray-and-white-domestic-shorthair-cat-with-green-eyes-P6CMJR.jpg',
            name: 'Milo',
            breed: 'Siamese Cat',
            gender: 'Male',
            age: '1 year',
            location: 'Alexandria, Egypt',
            weight: '3.2 kg',
            isVaccinated: true,
          ),
        );
      },
    );
  }
}

// ───── Custom Clipper for Wavy Top ─────
class TopWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, 40);

    path.quadraticBezierTo(size.width / 4, 0, size.width / 2, 30);

    path.quadraticBezierTo(size.width * 3 / 4, 60, size.width, 40);

    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
