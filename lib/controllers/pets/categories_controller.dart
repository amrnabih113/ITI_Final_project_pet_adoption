import 'package:get/get.dart';
import 'package:pet_adoption/models/category_model.dart';
import 'package:pet_adoption/models/pets_model.dart';
import 'package:pet_adoption/services/category_service.dart';
import 'package:pet_adoption/services/pet_service.dart';

class CategoriesController extends GetxController {
  static CategoriesController get instance => Get.find();

  RxList<CategoryModel> categories = <CategoryModel>[].obs;
  RxBool isLoading = true.obs;
  RxList<PetsModel> pets = <PetsModel>[].obs;

  final CategoryService categoryService = Get.put(CategoryService());
  @override
  void onInit() async {
    super.onInit();
    await getCategories();
  }

  Future getCategories() async {
    try {
      isLoading.value = true;
      final categories = await categoryService.loadCategories();
      categories.sort((a, b) => a.name.compareTo(b.name));
      this.categories.value = categories;
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
    }
  }

  Future<void> getCategoryPets(String category) async {
    try {
      isLoading.value = true;
      final pets = await PetService.instance.getPetsByCategory(category);
      isLoading.value = false;
      this.pets = pets.obs;
    } catch (e) {
      isLoading.value = false;
    }
  }
}
