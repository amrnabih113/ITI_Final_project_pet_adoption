import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pet_adoption/core/constants/colors.dart';
import 'package:pet_adoption/ui/widgets/categories_list.dart';
import 'package:pet_adoption/ui/widgets/my_body.dart';
import 'package:pet_adoption/ui/widgets/my_header_title.dart';
import 'package:pet_adoption/ui/widgets/my_home_app_bar.dart';
import 'package:pet_adoption/ui/widgets/my_search_bar.dart';
import 'package:pet_adoption/ui/widgets/pet_card.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> categories = [
      'Dogs',
      'Cats',
      'Birds',
      'Rabbits',
      'Turtles',
    ];
    final icons = [
      "assets/categories/dog.png",
      "assets/categories/cat.png",
      "assets/categories/bird.png",
      "assets/categories/rabbit.png",
      "assets/categories/turtle.png",
    ];
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: MyBody(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
          child: Column(
            spacing: 20,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyHomeAppBar(),
              MySearchBar(hintText: "Search for a pet", onPressed: () {}),
              CarouselSlider(
                options: CarouselOptions(
                  height: 150.0,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  viewportFraction: 0.9,
                ),
                items:
                    [
                      "assets/banners/banner1.png",
                      "assets/banners/banner2.png",
                      "assets/banners/banner3.png",
                    ].map((imagePath) {
                      return Builder(
                        builder: (BuildContext context) {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.asset(
                              imagePath,
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          );
                        },
                      );
                    }).toList(),
              ),
              MyHeaderTitle(title: "Categories", showSeeAll: false),

              CategoriesList(categories: categories, icons: icons),

              MyHeaderTitle(title: "Recommended for you", showSeeAll: true),

              GridView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 210,

                  mainAxisSpacing: 12,
                ),

                itemCount: 5,
                itemBuilder: (context, index) {
                  return PetCard(
                    name: "Rocky",
                    age: "2 months",
                    breed: "Golden Retriever",
                    imagePath:
                        "https://images.squarespace-cdn.com/content/v1/54822a56e4b0b30bd821480c/45ed8ecf-0bb2-4e34-8fcf-624db47c43c8/Golden+Retrievers+dans+pet+care.jpeg",
                    isFemale: false,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
