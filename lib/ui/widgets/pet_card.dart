import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pet_adoption/core/constants/colors.dart';

class PetGridCard extends StatelessWidget {
  final String image;
  final String name;
  final String breed;
  final String gender;
  final String age;
  final String location;
  final String weight;
  final bool isVaccinated;
  final void Function() onFavoriteToggle;
  final bool isFavorited;

  const PetGridCard({
    super.key,
    required this.image,
    required this.name,
    required this.breed,
    required this.gender,
    required this.age,
    required this.location,
    required this.weight,
    required this.isVaccinated,
    required this.onFavoriteToggle,
    required this.isFavorited,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  image,
                  width: double.infinity,
                  height: 140,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 10,
                right: 10,
                child: GestureDetector(
                  onTap: onFavoriteToggle,
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
                      isFavorited ? Icons.favorite : Icons.favorite_border,
                      color: isFavorited ? Colors.red : Colors.grey,
                      size: 20,
                    ),
                  ),
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
                        name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Icon(
                      gender == 'Male' ? Icons.male : Icons.female,
                      color: gender == 'Male'
                          ? Colors.blueAccent
                          : Colors.pinkAccent,
                      size: 20,
                    ),
                  ],
                ),

                const SizedBox(height: 4),

                // Breed
                Text(
                  breed,
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
                    Text(age, style: const TextStyle(fontSize: 12)),
                    const SizedBox(width: 10),
                    Icon(
                      Iconsax.weight,
                      size: 13,
                      color: MyColors.textSecondary,
                    ),
                    const SizedBox(width: 3),
                    Text(weight, style: const TextStyle(fontSize: 12)),
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
                        location,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 12),
                      ),
                    ),
                    const SizedBox(width: 6),
                    Icon(
                      Iconsax.shield_tick,
                      size: 13,
                      color: isVaccinated ? Colors.green : Colors.grey,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
