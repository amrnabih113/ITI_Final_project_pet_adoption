import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pet_adoption/controllers/pets/favourates_controller.dart';
import 'package:pet_adoption/core/constants/colors.dart';
import 'package:pet_adoption/models/pets_model.dart';
import 'package:pet_adoption/ui/screens/pets/pet_details.dart';
import 'package:pet_adoption/ui/widgets/favoutare_icon_button.dart';

class PetGridCard extends StatelessWidget {
  final PetsModel pet;
  const PetGridCard({super.key, required this.pet});

  @override
  Widget build(BuildContext context) {
    print("pet: ${pet.id} ");
    final FavouriteController favouriteController = Get.put(
      FavouriteController(),
    );
    return GestureDetector(
      onTap: () => Get.to(() => PetDetails(pet: pet)),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: MyColors.primaryColor),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: MyColors.primaryColor.withValues(alpha: 0.08),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top image
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(16),
                  ),
                  child: Image.network(
                    pet.images.first,
                    width: double.infinity,
                    height: 140,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: FavoriteIconButton(
                    petId: pet.id, // or a unique pet ID from your Pet model
                    initialValue: favouriteController.isFavourite(pet.id),
                  ),
                ),
              ],
            ),

            // Content
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Name & Gender
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          pet.name,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Icon(
                        pet.gender == 'male' ? Icons.male : Icons.female,
                        color: pet.gender == 'male'
                            ? Colors.blueAccent
                            : Colors.pinkAccent,
                        size: 20,
                      ),
                    ],
                  ),

                  const SizedBox(height: 4),

                  // Breed
                  Text(
                    pet.breed,
                    style: const TextStyle(
                      fontSize: 13,
                      color: MyColors.textSecondary,
                    ),
                  ),

                  const SizedBox(height: 6),

                  // Age & Weight
                  Row(
                    children: [
                      Icon(
                        Iconsax.timer_1,
                        size: 13,
                        color: MyColors.textSecondary,
                      ),
                      const SizedBox(width: 3),
                      Text(
                        "${pet.age} years",
                        style: const TextStyle(fontSize: 12),
                      ),
                      const SizedBox(width: 10),
                      Icon(
                        Iconsax.weight,
                        size: 13,
                        color: MyColors.textSecondary,
                      ),
                      const SizedBox(width: 3),
                      Text(
                        "${pet.weight} kg",
                        style: const TextStyle(fontSize: 12),
                      ),
                    ],
                  ),

                  const SizedBox(height: 6),

                  // Location & Vaccination
                  Row(
                    children: [
                      Icon(
                        Iconsax.location,
                        size: 13,
                        color: MyColors.textSecondary,
                      ),
                      const SizedBox(width: 3),
                      Expanded(
                        child: Text(
                          pet.location,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontSize: 12),
                        ),
                      ),
                      const SizedBox(width: 6),
                      Icon(
                        Iconsax.shield_tick,
                        size: 13,
                        color: pet.isVaccinated ? Colors.green : Colors.grey,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
