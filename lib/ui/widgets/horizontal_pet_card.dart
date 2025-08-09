
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pet_adoption/core/constants/colors.dart';
import 'package:pet_adoption/core/utils/helpers/helper_functions.dart';

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
