import 'package:get/get.dart';
import 'package:pet_adoption/core/utils/popups/loaders.dart';
import 'package:pet_adoption/models/pets_model.dart';
import 'package:pet_adoption/services/pet_service.dart';

class PetsController extends GetxController {
  static PetsController get instance => Get.find();
  // Pets
  RxList<PetsModel> pets = <PetsModel>[].obs;
  RxList<PetsModel> recommendedPets = <PetsModel>[].obs;
  RxBool isLoading = false.obs;

  final PetService petService = Get.put(PetService());
  final userLocation = "Cairo";

  @override
  void onInit() async {
    super.onInit();
    await getPets();
  }

  Future<void> getPets() async {
    try {
      isLoading.value = true;
      final pets = await petService.getPets();
      this.pets.value = pets;
      recommendedPets.value = pets
          .where((pet) => pet.location.contains(userLocation))
          .toList();
      isLoading.value = false;
    } catch (e) {
      MyLoaders.errorSnackBar(title: "Oh No!", message: e.toString());
      isLoading.value = false;
    }
  }

  List<PetsModel> filteredPets({
    String searchQuery = '',
    String species = 'All',
    String gender = 'All',
    bool onlyVaccinated = false,
  }) {
    return pets.where((pet) {
      final matchesSearch =
          searchQuery.isEmpty ||
          pet.breed.toLowerCase().contains(searchQuery.toLowerCase()) ||
          pet.name.toLowerCase().contains(searchQuery.toLowerCase());

      final matchesSpecies =
          species == 'All' || pet.type.toLowerCase() == species.toLowerCase();

      final matchesGender =
          gender == 'All' || pet.gender.toLowerCase() == gender.toLowerCase();

      final matchesVaccinated = !onlyVaccinated || pet.isVaccinated == true;

      return matchesSearch &&
          matchesSpecies &&
          matchesGender &&
          matchesVaccinated;
    }).toList();
  }
}
