import 'dart:convert';
import 'package:get/get.dart';
import 'package:pet_adoption/core/local_storage/my_local_storage.dart';
import 'package:pet_adoption/core/utils/popups/loaders.dart';
import 'package:pet_adoption/models/pets_model.dart';
import 'package:pet_adoption/services/pet_service.dart';

class FavouriteController extends GetxController {
  static FavouriteController get instance => Get.find();

  final favourites = <String, bool>{}.obs; // petId => true
  final favouritePets = <PetsModel>[].obs; // all favourite pets
  final filteredFavouritePets = <PetsModel>[].obs; // filtered favourites
  final selectedType = "".obs;

  @override
  void onInit() {
    super.onInit();
    initFavourites();
    fetchAllFavourites();
  }

  /// Load favourites from local storage
  void initFavourites() {
    final json = MyLocalStorage.instance().readData("favourites");
    if (json != null) {
      final storedFavourites = jsonDecode(json) as Map<String, dynamic>;
      favourites.assignAll(
        storedFavourites.map((key, value) => MapEntry(key, value as bool)),
      );
    }
  }

  bool isFavourite(String petId) => favourites[petId] ?? false;

  /// Add or remove a pet from favourites
  Future<void> toggleFavourite(String petId) async {
    print("toggleFavourite: $petId");
    if (isFavourite(petId)) {
      favourites.remove(petId);
      MyLoaders.customToast(message: "You removed this pet from favourites");
    } else {
      favourites[petId] = true;
      MyLoaders.customToast(message: "You Loved This Pet ❤️");
    }

    print("favourites: $favourites");
    saveFavouritesToStorage();
    favourites.refresh();
    print("refreshed favourites: $favourites");
    // Wait for Firestore fetch to complete before UI updates
    await fetchAllFavourites();

    update();
  }

  /// Save favourites to local storage
  void saveFavouritesToStorage() {
    final encodedFavourites = jsonEncode(favourites);
    MyLocalStorage.instance().saveData("favourites", encodedFavourites);
  }

  /// Fetch all favourited pets
  Future<void> fetchAllFavourites() async {
    print("Fetching favourite pets...");
    final favIds = favourites.keys.toList();
    print("favIds: $favIds");
    if (favIds.isEmpty) {
      favouritePets.clear();
      filteredFavouritePets.clear();
      return;
    }

    final pets = await PetService.instance.getFavouratePets(favIds);
    print("fetched pets: $pets");
    favouritePets.assignAll(pets);

    filteredFavouritePets.assignAll(pets); // Initially same as all pets
  }

  /// Filter favourites
  void filterFavouritePets({
    String? type,
    String? location,
    String? breed,
    String? gender,
    String? age,
    bool? isVaccinated,
  }) {
    filteredFavouritePets.assignAll(
      favouritePets.where((pet) {
        final matchesType = type == null || type == "All" || pet.type == type;
        final matchesLocation =
            location == null ||
            location.isEmpty ||
            pet.location.contains(location);
        final matchesBreed =
            breed == null || breed.isEmpty || pet.breed.contains(breed);
        final matchesGender =
            gender == null || gender.isEmpty || pet.gender == gender;
        final matchesAge = age == null || age.isEmpty || pet.age == age;
        final matchesVaccinated =
            isVaccinated == null || pet.isVaccinated == isVaccinated;

        return matchesType &&
            matchesLocation &&
            matchesBreed &&
            matchesGender &&
            matchesAge &&
            matchesVaccinated;
      }),
    );
  }
}

class FavoriteIconController extends GetxController {
  var isFavorited = false.obs;
  final String petId;
  final FavouriteController favouriteController = Get.find();

  FavoriteIconController({required this.petId, bool initialValue = false}) {
    isFavorited.value = initialValue;
  }

  Future<void> toggleFavorite() async {
    isFavorited.toggle();
    await favouriteController.toggleFavourite(petId);
  }
}
