import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pet_adoption/core/constants/colors.dart';
import 'package:pet_adoption/core/utils/helpers/helper_functions.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = ['Dogs', 'Cats', 'Birds', 'Rabbits', 'Turtles'];

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('My Loved Pets'),
            const SizedBox(width: 6),
            Icon(Iconsax.heart, color: MyColors.primaryBorderDark),
          ],
        ),
        titleTextStyle: Theme.of(
          context,
        ).textTheme.headlineMedium!.copyWith(color: MyColors.primaryColor),
        shape: UnderlineInputBorder(
          borderSide: BorderSide(color: MyColors.primaryColor),
          borderRadius: BorderRadius.circular(40),
        ),
        toolbarHeight: 70,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            CategoryFilterList(selectedIndex: 0, categories: categories),
            const SizedBox(height: 20),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 10,
              separatorBuilder: (context, index) => const SizedBox(height: 20),
              itemBuilder: (context, index) {
                return PetCard(
                  image:
                      'https://images.squarespace-cdn.com/content/v1/54822a56e4b0b30bd821480c/45ed8ecf-0bb2-4e34-8fcf-624db47c43c8/Golden+Retrievers+dans+pet+care.jpeg',

                  name: 'Bella',
                  breed: 'Golden Retriever',
                  gender: 'Male',
                  age: '2 months',
                  location: 'Cairo, Egypt',
                  weight: '4.5 kg',
                  isVaccinated: true,
                  isFavorited: true,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

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
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length + 1,
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          final isSelected = index == selectedIndex;
          final label = index == 0 ? 'All' : categories[index - 1];
          return Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: isSelected
                  ? MyColors.primaryColor.withValues(alpha: 0.1)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: isSelected
                    ? MyColors.primaryColor
                    : MyColors.primaryBorderDark,
                width: 1.2,
              ),
            ),
            child: Text(
              label,
              style: TextStyle(
                color: MyColors.primaryColor,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          );
        },
      ),
    );
  }
}

class PetCard extends StatelessWidget {
  final double height;
  final String image;
  final String name;
  final String breed;
  final String gender;
  final String age;
  final String location;
  final String weight;
  final bool isVaccinated;
  final bool isFavorited;

  const PetCard({
    super.key,
    required this.image,
    required this.name,
    required this.breed,
    required this.gender,
    required this.age,
    required this.location,
    required this.weight,
    required this.isVaccinated,
    required this.isFavorited,
    this.height = 130,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: MyHelperFunctions.getScreenWidth() - 40,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: MyColors.primaryColor),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: MyColors.primaryColor.withValues(alpha: 0.08),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // Pet image
          ClipRRect(
            borderRadius: const BorderRadius.horizontal(
              left: Radius.circular(20),
            ),
            child: Image.network(
              image,
              width: 120,
              height: height + 20,
              fit: BoxFit.cover,
            ),
          ),

          // Details
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Name and gender
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        spacing: 5,
                        children: [
                          Text(
                            name,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),

                          Icon(
                            gender == 'Male' ? Icons.male : Icons.female,
                            color: gender == 'Male'
                                ? Colors.blueAccent
                                : Colors.pinkAccent,
                            size: 18,
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.1),
                                blurRadius: 4,
                              ),
                            ],
                          ),
                          child: Icon(
                            isFavorited
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: isFavorited ? Colors.red : Colors.grey,
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 4),

                  // Breed
                  Text(
                    breed,
                    style: const TextStyle(
                      fontSize: 14,
                      color: MyColors.textSecondary,
                    ),
                  ),

                  const SizedBox(height: 4),

                  // Age and weight
                  Row(
                    children: [
                      Icon(
                        Iconsax.timer_1,
                        size: 14,
                        color: MyColors.textSecondary,
                      ),
                      const SizedBox(width: 4),
                      Text(age, style: const TextStyle(fontSize: 13)),
                      const SizedBox(width: 12),
                      Icon(
                        Iconsax.weight,
                        size: 14,
                        color: MyColors.textSecondary,
                      ),
                      const SizedBox(width: 4),
                      Text(weight, style: const TextStyle(fontSize: 13)),
                    ],
                  ),

                  const SizedBox(height: 4),

                  // Location and vaccine
                  Row(
                    children: [
                      Icon(
                        Iconsax.location,
                        size: 14,
                        color: MyColors.textSecondary,
                      ),
                      const SizedBox(width: 4),
                      Text(location, style: const TextStyle(fontSize: 13)),
                      const SizedBox(width: 12),
                      Icon(
                        Iconsax.shield_tick,
                        size: 14,
                        color: isVaccinated ? Colors.green : Colors.grey,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        isVaccinated ? 'Vaccinated' : 'Not vaccinated',
                        style: TextStyle(
                          fontSize: 13,
                          color: isVaccinated ? Colors.green : Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
