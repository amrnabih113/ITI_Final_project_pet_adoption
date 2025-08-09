import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pet_adoption/core/constants/colors.dart';
import 'package:pet_adoption/ui/widgets/filter_chip_widget.dart';
import 'package:pet_adoption/ui/widgets/my_search_bar.dart';
import 'package:pet_adoption/ui/widgets/pet_card.dart';

class Explore extends StatefulWidget {
  const Explore({super.key});

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  String selectedSpecies = "All";
  String selectedGender = "All";
  bool showOnlyVaccinated = false;

  final List<Map<String, dynamic>> allPets = [
    {
      "image":
          'https://images.squarespace-cdn.com/content/v1/54822a56e4b0b30bd821480c/45ed8ecf-0bb2-4e34-8fcf-624db47c43c8/Golden+Retrievers+dans+pet+care.jpeg',
      // turn0image0
      "name": "Luna",
      "breed": "Labrador Retriever Mix",
      "gender": "Female",
      "age": "2 years",
      "location": "Alexandria, Egypt",
      "weight": "22 kg",
      "isVaccinated": true,
      "isFavorited": false,
    },
    {
      "image":
          'https://images.squarespace-cdn.com/content/v1/54822a56e4b0b30bd821480c/45ed8ecf-0bb2-4e34-8fcf-624db47c43c8/Golden+Retrievers+dans+pet+care.jpeg',
      "name": "Max",
      "breed": "Beagle",
      "gender": "Male",
      "age": "1.5 years",
      "location": "Cairo, Egypt",
      "weight": "14 kg",
      "isVaccinated": true,
      "isFavorited": true,
    },
    {
      "image":
          'https://images.squarespace-cdn.com/content/v1/54822a56e4b0b30bd821480c/45ed8ecf-0bb2-4e34-8fcf-624db47c43c8/Golden+Retrievers+dans+pet+care.jpeg',
      "name": "Simba",
      "breed": "Domestic Shorthair",
      "gender": "Male",
      "age": "6 months",
      "location": "Giza, Egypt",
      "weight": "3 kg",
      "isVaccinated": false,
      "isFavorited": false,
    },
    {
      "image":
          'https://images.squarespace-cdn.com/content/v1/54822a56e4b0b30bd821480c/45ed8ecf-0bb2-4e34-8fcf-624db47c43c8/Golden+Retrievers+dans+pet+care.jpeg',
      "name": "Bella",
      "breed": "German Shepherd",
      "gender": "Female",
      "age": "3 years",
      "location": "Mansoura, Egypt",
      "weight": "28 kg",
      "isVaccinated": true,
      "isFavorited": true,
    },
  ];
  List<Map<String, dynamic>> get filteredPets {
    return allPets.where((pet) {
      if (selectedSpecies != "All" &&
          !pet["breed"].toString().toLowerCase().contains(
            selectedSpecies.toLowerCase(),
          )) {
        return false;
      }
      if (selectedGender != "All" && pet["gender"] != selectedGender) {
        return false;
      }
      if (showOnlyVaccinated && !pet["isVaccinated"]) return false;
      return true;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Explore Pets"),
            const SizedBox(width: 6),
            Icon(Iconsax.search_favorite, color: MyColors.primaryBorderDark),
          ],
        ),
        centerTitle: true,
        shape: const UnderlineInputBorder(
          borderSide: BorderSide(color: MyColors.primaryColor),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(40),
            bottomRight: Radius.circular(40),
          ),
        ),
        titleTextStyle: Theme.of(
          context,
        ).textTheme.headlineMedium!.copyWith(color: MyColors.primaryColor),
        toolbarHeight: 70,

        elevation: 0.5,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 10),
            const MySearchBar(hintText: "Search by name or breed..."),
            const SizedBox(height: 10),
            // Filters Section
            SizedBox(
              height: 40,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  FilterChipWidget(
                    label: "All",
                    selected: selectedSpecies,
                    onSelected: (val) => setState(() => selectedSpecies = val),
                  ),
                  FilterChipWidget(
                    label: "Dogs",
                    selected: selectedSpecies,
                    onSelected: (val) => setState(() => selectedSpecies = val),
                  ),
                  FilterChipWidget(
                    label: "Cats",
                    selected: selectedSpecies,
                    onSelected: (val) => setState(() => selectedSpecies = val),
                  ),
                  FilterChipWidget(
                    label: "Birds",
                    selected: selectedSpecies,
                    onSelected: (val) => setState(() => selectedSpecies = val),
                  ),
                  FilterChipWidget(
                    label: "Rabbits",
                    selected: selectedSpecies,
                    onSelected: (val) => setState(() => selectedSpecies = val),
                  ),
                  FilterChipWidget(
                    label: "Turtles",
                    selected: selectedSpecies,
                    onSelected: (val) => setState(() => selectedSpecies = val),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Text("Gender: "),

                DropdownButton<String>(
                  dropdownColor: MyColors.light,

                  borderRadius: BorderRadius.circular(20),
                  iconEnabledColor: MyColors.primaryColor,
                  value: selectedGender,
                  onChanged: (value) => setState(() => selectedGender = value!),
                  items: ["All", "Male", "Female"]
                      .map(
                        (gender) => DropdownMenuItem(
                          value: gender,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Text(
                              gender,
                              style: Theme.of(context).textTheme.bodyLarge!
                                  .copyWith(fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
                const Spacer(),
                Row(
                  children: [
                    Checkbox(
                      value: showOnlyVaccinated,
                      onChanged: (val) =>
                          setState(() => showOnlyVaccinated = val!),
                    ),
                    const Text("Vaccinated"),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child: MasonryGridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                itemCount: filteredPets.length,
                itemBuilder: (context, i) {
                  final pet = filteredPets[i];
                  return PetGridCard(
                    image: pet['image'],
                    name: pet['name'],
                    breed: pet['breed'],
                    gender: pet['gender'],
                    age: pet['age'],
                    location: pet['location'],
                    weight: pet['weight'],
                    isVaccinated: pet['isVaccinated'],
                    isFavorited: pet['isFavorited'],
                    onFavoriteToggle: () {
                      setState(() {
                        pet['isFavorited'] = !pet['isFavorited'];
                      });
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
