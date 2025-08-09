import 'dart:convert';

import 'package:get/get.dart';
import 'package:pet_adoption/core/local_storage/my_local_storage.dart';
import 'package:pet_adoption/core/utils/popups/loaders.dart';
import 'package:pet_adoption/models/pets_model.dart';
import 'package:pet_adoption/services/pet_service.dart';

class FavouriteController extends GetxController {
  static FavouriteController get instance => Get.find();
  final favourites = <String, bool>{}.obs;

  @override
  void onInit() {
    super.onInit();
    initFavourites();
  }

  void initFavourites() {
    final json = MyLocalStorage.instance().readData("favourites");
    if (json != null) {
      final storedFavourites = jsonDecode(json) as Map<String, dynamic>;
      favourites.assignAll(
          storedFavourites.map((key, value) => MapEntry(key, value as bool)));
    }
  }

  bool isFavourite(String petId) => favourites[petId] ?? false;

  void toggleFavourite(String petId) {
    if (!favourites.containsKey(petId)) {
      favourites[petId] = true;
      saveFavouritesToStorage();
      favourites.refresh();
      MyLoaders.customToast(message: "You Loved This Pet");
    } else {
      MyLocalStorage.instance().removeData("favourites");
      favourites.remove(petId);
      saveFavouritesToStorage();
      favourites.refresh();
      MyLoaders.customToast(message: "You removed this pet from favourites");
    }
  }

  void saveFavouritesToStorage() {
    final encodedFavourites = jsonEncode(favourites);
    MyLocalStorage.instance().saveData("favourites", encodedFavourites);
  }

  Future<List<PetsModel>> favouriteProducts() async {
    final List<String> favouriteIds = favourites.keys
        .map((key) => key)
        .whereType<String>()
        .toList();
    final pets =
        await PetService.instance.getFavouratePets(favouriteIds);
    return pets;
  }
}
