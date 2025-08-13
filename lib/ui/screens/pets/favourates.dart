import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pet_adoption/controllers/pets/categories_controller.dart';
import 'package:pet_adoption/controllers/pets/favourates_controller.dart';
import 'package:pet_adoption/core/constants/colors.dart';
import 'package:pet_adoption/ui/widgets/category_filter_list.dart';
import 'package:pet_adoption/ui/widgets/horizontal_pet_card.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = CategoriesController.instance.categories;
    final favouriteController = FavouriteController.instance;

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
      body: RefreshIndicator(
        onRefresh: () async {
          await favouriteController.fetchAllFavourites();
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              CategoryFilterList(categories: categories),
              const SizedBox(height: 20),

              /// Observe filtered pets
              Obx(() {
                final pets = favouriteController.filteredFavouritePets;

                if (pets.isEmpty) {
                  return const Padding(
                    padding: EdgeInsets.only(top: 50),
                    child: Text(
                      "No favourited pets yet — add some!",
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                  );
                }

                return ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: pets.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 20),
                  itemBuilder: (context, index) {
                    final pet = pets[index];
                    return PetCard(pet: pet ,);
                  },
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
