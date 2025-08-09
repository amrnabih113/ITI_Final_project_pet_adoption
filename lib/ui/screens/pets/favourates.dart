import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pet_adoption/core/constants/colors.dart';
import 'package:pet_adoption/ui/widgets/category_filter_list.dart';
import 'package:pet_adoption/ui/widgets/horizontal_pet_card.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = ['All', 'Dogs', 'Cats', 'Birds', 'Rabbits', 'Turtles'];

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
