import 'package:get/get.dart';

class FilterController extends GetxController {
  // Search text
  var searchQuery = ''.obs;

  // Species filter (default: All)
  var selectedSpecies = 'All'.obs;

  // Gender filter (default: All)
  var selectedGender = 'All'.obs;

  // Vaccinated filter (default: false)
  var showOnlyVaccinated = false.obs;

  // Update methods
  void updateSearchQuery(String query) {
    searchQuery.value = query;
  }

  void updateSpecies(String species) {
    selectedSpecies.value = species;
  }

  void updateGender(String gender) {
    selectedGender.value = gender;
  }

  void updateVaccinatedFilter(bool value) {
    showOnlyVaccinated.value = value;
  }

  // Reset filters
  void resetFilters() {
    searchQuery.value = '';
    selectedSpecies.value = 'All';
    selectedGender.value = 'All';
    showOnlyVaccinated.value = false;
  }
}
