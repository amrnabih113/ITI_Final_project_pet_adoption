import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pet_adoption/controllers/pets/categories_controller.dart';
import 'package:pet_adoption/controllers/pets/filter_controller.dart';
import 'package:pet_adoption/controllers/pets/pets_controller.dart';
import 'package:pet_adoption/core/constants/colors.dart';
import 'package:pet_adoption/ui/widgets/filter_chip_widget.dart';
import 'package:pet_adoption/ui/widgets/my_search_bar.dart';
import 'package:pet_adoption/ui/widgets/pet_card.dart';

class Explore extends StatelessWidget {
  const Explore({super.key});

  @override
  Widget build(BuildContext context) {
    final PetsController petController = PetsController.instance;
    final filterController = Get.put(FilterController());
    final categories = CategoriesController.instance.categories;
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Explore Pets"),
            const SizedBox(width: 6),
            Icon(Iconsax.search_favorite, color: MyColors.primaryBorderDark),
          ],
        ),
        centerTitle: true,
        shape: const UnderlineInputBorder(
          borderSide: BorderSide(color: MyColors.primaryColor),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(40),
            bottomRight: Radius.circular(40),
          ),
        ),
        titleTextStyle: Theme.of(
          context,
        ).textTheme.headlineMedium!.copyWith(color: MyColors.primaryColor),
        toolbarHeight: 70,
        elevation: 0.5,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 10),
            MySearchBar(
              hintText: "Search by name or breed...",
              onChanged: (val) => filterController.updateSearchQuery(val),
            ),
            const SizedBox(height: 10),

            // Species filter chips
            SizedBox(
              height: 40,
              child: Obx(() {
                return ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    FilterChipWidget(
                      label: "All",
                      selected: filterController.selectedSpecies.value,
                      onSelected: (val) => filterController.updateSpecies(val),
                    ),
                    for (final species in categories)
                      FilterChipWidget(
                        label: species.name,
                        selected: filterController.selectedSpecies.value,
                        onSelected: (val) =>
                            filterController.updateSpecies(val),
                      ),
                  ],
                );
              }),
            ),
            const SizedBox(height: 8),

            // Gender dropdown
            Row(
              children: [
                const Text("Gender: "),
                Obx(() {
                  return DropdownButton<String>(
                    value: filterController.selectedGender.value,
                    dropdownColor: MyColors.light,
                    borderRadius: BorderRadius.circular(12),
                    items: ["All", "Male", "Female"]
                        .map(
                          (gender) => DropdownMenuItem(
                            value: gender,
                            child: Text(gender),
                          ),
                        )
                        .toList(),
                    onChanged: (val) =>
                        filterController.updateGender(val ?? "All"),
                  );
                }),
              ],
            ),

            const SizedBox(height: 8),

            // Vaccinated filter
            Obx(() {
              return SwitchListTile(
                title: const Text("Show only vaccinated"),
                value: filterController.showOnlyVaccinated.value,
                activeColor: MyColors.primaryColor,
                onChanged: (val) =>
                    filterController.updateVaccinatedFilter(val),
              );
            }),

            const SizedBox(height: 10),

            // Pet list
            Expanded(
              child: Obx(() {
                final pets = petController.filteredPets(
                  searchQuery: filterController.searchQuery.value,
                  species: filterController.selectedSpecies.value,
                  gender: filterController.selectedGender.value,
                  onlyVaccinated: filterController.showOnlyVaccinated.value,
                );

                if (pets.isEmpty) {
                  return const Center(child: Text("No pets found."));
                }

                return MasonryGridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  itemCount: pets.length,
                  itemBuilder: (context, index) {
                    final pet = pets[index];
                    return PetGridCard(pet: pet);
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
