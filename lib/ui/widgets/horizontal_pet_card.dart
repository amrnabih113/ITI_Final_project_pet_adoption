import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pet_adoption/controllers/pets/favourates_controller.dart';
import 'package:pet_adoption/core/constants/colors.dart';
import 'package:pet_adoption/core/utils/helpers/helper_functions.dart';
import 'package:pet_adoption/models/pets_model.dart';
import 'package:pet_adoption/ui/screens/pets/pet_details.dart';
import 'package:pet_adoption/ui/widgets/favoutare_icon_button.dart';

class PetCard extends StatelessWidget {
  final PetsModel pet;
  final double height;

  const PetCard({super.key, required this.pet, this.height = 150});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(() => PetDetails(pet: pet)),
      child: Container(
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
                pet.images.first,
                width: 120,
                height: height + 20,
                fit: BoxFit.cover,
              ),
            ),

            // Details
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 12,
                ),
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
                              pet.name,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                            ),

                            Icon(
                              pet.gender == 'male' ? Icons.male : Icons.female,
                              color: pet.gender == 'male'
                                  ? Colors.blueAccent
                                  : Colors.pinkAccent,
                              size: 18,
                            ),
                          ],
                        ),

                        FavoriteIconButton(
                          petId: pet.id,
                          initialValue: FavouriteController.instance
                              .isFavourite(pet.id),
                        ),
                      ],
                    ),

                    const SizedBox(height: 4),

                    // Breed
                    Text(
                      pet.breed,
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
                        Text(
                          '${pet.age} years',
                          style: const TextStyle(fontSize: 13),
                        ),
                        const SizedBox(width: 12),
                        Icon(
                          Iconsax.weight,
                          size: 14,
                          color: MyColors.textSecondary,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '${pet.weight} kg',
                          style: const TextStyle(fontSize: 13),
                        ),
                      ],
                    ),

                    const SizedBox(height: 4),

                    // Location and vaccine
                    Wrap(
                      children: [
                        Icon(
                          Iconsax.location,
                          size: 14,
                          color: MyColors.textSecondary,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          pet.location,
                          style: const TextStyle(fontSize: 13),
                        ),
                        const SizedBox(width: 12),
                        Row(
                          children: [
                            Icon(
                              Iconsax.shield_tick,
                              size: 14,
                              color: pet.isVaccinated
                                  ? Colors.green
                                  : Colors.grey,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              pet.isVaccinated
                                  ? 'Vaccinated'
                                  : 'Not vaccinated',
                              style: TextStyle(
                                fontSize: 13,
                                color: pet.isVaccinated
                                    ? Colors.green
                                    : Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
