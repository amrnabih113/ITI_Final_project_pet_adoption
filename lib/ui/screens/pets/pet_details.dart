import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pet_adoption/core/constants/colors.dart';
import 'package:pet_adoption/models/pets_model.dart';
import 'package:pet_adoption/ui/screens/pets/adopt_form.dart';
import 'package:pet_adoption/ui/widgets/Pet_section_title.dart';
import 'package:pet_adoption/ui/widgets/favoutare_icon_button.dart';
import 'package:pet_adoption/ui/widgets/icon_button_widget.dart';
import 'package:pet_adoption/ui/widgets/pet_info_ship.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PetDetails extends StatelessWidget {
  final PetsModel pet;

  const PetDetails({super.key, required this.pet});

  @override
  Widget build(BuildContext context) {
    final PageController pageController = PageController();

    return Scaffold(
      bottomSheet: BottomSheet(
        backgroundColor: Colors.white70,
        onClosing: () {},
        enableDrag: false,
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        builder: (context) => Container(
          height: 550,
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Name + Gender
                Row(
                  spacing: 8,
                  children: [
                    Text(
                      pet.name,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(
                      pet.gender.toLowerCase() == "male"
                          ? Icons.male
                          : Icons.female,
                      color: pet.gender.toLowerCase() == "male"
                          ? Colors.blue
                          : Colors.pink,
                      size: 25,
                    ),
                  ],
                ),
                const SizedBox(height: 5),

                // Location
                Row(
                  children: [
                    const Icon(Iconsax.location, size: 16, color: Colors.grey),
                    const SizedBox(width: 4),
                    Text(
                      pet.location,
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Info Chips
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InfoChip(label: pet.breed, sub: "Breed"),
                    InfoChip(label: pet.type, sub: "Type"),
                    InfoChip(label: "${pet.weight} Kg", sub: "Weight"),
                    InfoChip(label: "${pet.age} y/o", sub: "Age"),
                  ],
                ),
                const SizedBox(height: 20),

                // Health
                SectionTitle(title: "Health", icon: Iconsax.health),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Icon(
                      pet.isVaccinated
                          ? Iconsax.shield_tick
                          : Iconsax.shield_cross,
                      size: 18,
                      color: pet.isVaccinated ? Colors.green : Colors.red,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      pet.isVaccinated ? "Vaccinated" : "Not Vaccinated",
                      style: TextStyle(
                        color: pet.isVaccinated ? Colors.green : Colors.red,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                CharacteristicsSection(traits: pet.characteristics),

                const SizedBox(height: 20),

                // Description
                SectionTitle(title: "Description", icon: Iconsax.document_text),
                const SizedBox(height: 6),
                Text(
                  pet.description.isNotEmpty
                      ? pet.description
                      : "No description available for this pet.",
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black87,
                    height: 1.4,
                  ),
                ),

                const SizedBox(height: 30),
                // Adopt Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: pet.isAdopted
                        ? null
                        : () {
                            Get.to(() => AdoptionProcessPage(pet: pet));
                          },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: pet.isAdopted
                          ? Colors.grey
                          : MyColors.primaryColor,
                    ),
                    child: Text(
                      pet.isAdopted ? "Already Adopted" : "Adopt Me",
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

      body: Stack(
        children: [
          Stack(
            children: [
              // Swipeable Images
              SizedBox(
                height: 450,
                child: PageView.builder(
                  controller: pageController,
                  itemCount: pet.images.isNotEmpty ? pet.images.length : 1,
                  itemBuilder: (context, index) {
                    final imageUrl = pet.images.isNotEmpty
                        ? pet.images[index]
                        : "https://via.placeholder.com/500x500";
                    return Image.network(
                      imageUrl,
                      width: double.infinity,
                      height: 500,
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),

              // Page Indicator
              Positioned(
                bottom: 80,
                left: 0,
                right: 0,
                child: Center(
                  child: SmoothPageIndicator(
                    controller: pageController,
                    count: pet.images.isNotEmpty ? pet.images.length : 1,
                    effect: ExpandingDotsEffect(
                      activeDotColor: MyColors.secondaryColor,
                      dotColor: MyColors.secondaryColor.withValues(
                        alpha: 0.3,
                      ), // FIXED
                      dotHeight: 8,
                      dotWidth: 8,
                      expansionFactor: 3,
                    ),
                  ),
                ),
              ),
            ],
          ),

          // Top buttons
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButtonWidget(
                    iconColor: MyColors.primaryColor,
                    icon: Icons.arrow_back,
                    onTap: () => Navigator.pop(context),
                  ),
                  FavoriteIconButton(
                    petId: pet.id,
                    initialValue: false,
                    size: 30,
                    color: MyColors.primaryColor,
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

class CharacteristicsSection extends StatelessWidget {
  final List<String> traits;

  const CharacteristicsSection({super.key, required this.traits});

  @override
  Widget build(BuildContext context) {
    if (traits.isEmpty) {
      return const Text("No characteristics provided");
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(title: "Characteristics", icon: Iconsax.designtools),
        const SizedBox(height: 6),
        ...traits.map((trait) => Text("• $trait")),
      ],
    );
  }
}
