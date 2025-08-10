import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pet_adoption/core/constants/colors.dart';
import 'package:pet_adoption/models/pets_model.dart';

class PetSearchPage extends StatefulWidget {
  final List<PetsModel> pets;

  const PetSearchPage({Key? key, required this.pets}) : super(key: key);

  @override
  State<PetSearchPage> createState() => _PetSearchPageState();
}

class _PetSearchPageState extends State<PetSearchPage> {
  String searchQuery = '';
  String? selectedType;
  String? selectedGender;
  bool? vaccinatedOnly;
  String? selectedLocation;

  List<String> types = ["Dog", "Cat", "Bird", "Other"];
  List<String> genders = ["Male", "Female"];
  List<String> locations = ["Cairo", "Alexandria", "Giza", "Other"];

  @override
  Widget build(BuildContext context) {
    List<PetsModel> filteredPets = widget.pets.where((pet) {
      bool matchesSearch =
          pet.name.toLowerCase().contains(searchQuery.toLowerCase()) ||
          pet.breed.toLowerCase().contains(searchQuery.toLowerCase());

      bool matchesType = selectedType == null || pet.type == selectedType;
      bool matchesGender =
          selectedGender == null || pet.gender == selectedGender;
      bool matchesVaccinated =
          vaccinatedOnly == null ||
          (vaccinatedOnly == true && pet.isVaccinated) ||
          (vaccinatedOnly == false && !pet.isVaccinated);
      bool matchesLocation =
          selectedLocation == null || pet.location == selectedLocation;

      return matchesSearch &&
          matchesType &&
          matchesGender &&
          matchesVaccinated &&
          matchesLocation;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Search Pets",
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.w600,
            color: MyColors.primaryColor,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Search bar
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Iconsax.search_normal,
                  color: MyColors.primaryColor,
                ),
                hintText: "Search by name or breed",
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
              onChanged: (value) => setState(() => searchQuery = value),
            ),
          ),

          // Filter labels + dropdowns
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                _buildLabeledDropdown("Type", types, selectedType, (val) {
                  setState(() => selectedType = val);
                }),
                _buildLabeledDropdown("Gender", genders, selectedGender, (val) {
                  setState(() => selectedGender = val);
                }),
                _buildLabeledDropdown("Location", locations, selectedLocation, (
                  val,
                ) {
                  setState(() => selectedLocation = val);
                }),
                _buildLabeledDropdown(
                  "Vaccinated",
                  ["Yes", "No"],
                  vaccinatedOnly != null
                      ? (vaccinatedOnly! ? "Yes" : "No")
                      : null,
                  (val) {
                    setState(() {
                      if (val == null) {
                        vaccinatedOnly = null;
                      } else {
                        vaccinatedOnly = val == "Yes";
                      }
                    });
                  },
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),

          // Pet list
          Expanded(
            child: filteredPets.isEmpty
                ? Center(
                    child: Text(
                      "No pets found",
                      style: TextStyle(color: MyColors.textSecondary),
                    ),
                  )
                : ListView.builder(
                    itemCount: filteredPets.length,
                    itemBuilder: (context, index) {
                      final pet = filteredPets[index];
                      return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        margin: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        child: ListTile(
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              pet.images.isNotEmpty
                                  ? pet.images[0]
                                  : 'https://via.placeholder.com/80',
                              width: 60,
                              height: 60,
                              fit: BoxFit.cover,
                            ),
                          ),
                          title: Text(
                            pet.name,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: MyColors.primaryColor,
                            ),
                          ),
                          subtitle: Text(
                            "${pet.breed} • ${pet.location}",
                            style: TextStyle(color: MyColors.textSecondary),
                          ),
                          trailing: Icon(
                            Iconsax.arrow_right_3,
                            color: MyColors.textPrimary,
                          ),
                          onTap: () {
                            // Navigate to pet details page
                          },
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildLabeledDropdown(
    String label,
    List<String> items,
    String? selectedValue,
    ValueChanged<String?> onChanged,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: MyColors.primaryColor,
            fontSize: 12,
          ),
        ),
        const SizedBox(height: 4),
        Container(
          margin: const EdgeInsets.only(right: 8),
          padding: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: MyColors.primaryColor.withValues(alpha: 0.3),
            ),
          ),
          child: DropdownButton<String>(
            hint: const Text("All"),
            value: selectedValue,
            underline: const SizedBox(),
            onChanged: onChanged,
            items: [
              const DropdownMenuItem(value: null, child: Text("All")),
              ...items.map((e) => DropdownMenuItem(value: e, child: Text(e))),
            ],
          ),
        ),
      ],
    );
  }
}
