import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pet_adoption/controllers/pets/favourates_controller.dart';

class FavoriteIconButton extends StatelessWidget {
  final String petId;
  final bool initialValue;
  final double size;
  final Color color;

  const FavoriteIconButton({
    super.key,
    required this.petId,
    required this.initialValue,
    this.size = 20,
    this.color = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(
      FavoriteIconController(petId: petId, initialValue: initialValue),
      tag: petId, // Tag to make each icon unique
    );

    return GestureDetector(
      onTap: controller.toggleFavorite,
      child: Obx(
        () => Container(
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
            controller.isFavorited.value ? Iconsax.heart5 : Iconsax.heart,
            color: controller.isFavorited.value ? Colors.red : color,
            size: size,
          ),
        ),
      ),
    );
  }
}
