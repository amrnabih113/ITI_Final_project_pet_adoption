import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pet_adoption/core/constants/colors.dart';
import 'package:pet_adoption/models/pets_model.dart';
import 'package:pet_adoption/ui/widgets/pet_card.dart';

class MyPetsPage extends StatelessWidget {
  const MyPetsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('My Pets'),
              const SizedBox(width: 6),
              Icon(Iconsax.pet, color: MyColors.primaryBorderDark),
            ],
          ),
          titleTextStyle: Theme.of(
            context,
          ).textTheme.headlineMedium!.copyWith(color: MyColors.primaryColor),
          shape: UnderlineInputBorder(
            borderSide: BorderSide(color: MyColors.primaryColor),
            borderRadius: BorderRadius.circular(40),
          ),
          toolbarHeight: 70,
          bottom: const TabBar(
            indicatorColor: MyColors.primaryColor,
            labelColor: MyColors.primaryColor,
            unselectedLabelColor: MyColors.textSecondary,
            tabs: [
              Tab(icon: Icon(Iconsax.add_circle), text: "Added Pets"),
              Tab(
                icon: Icon(Icons.check_circle_outlined),
                text: "Adopted Pets",
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            MyPetsList(type: "added"),
            MyPetsList(type: "adopted"),
          ],
        ),
      ),
    );
  }
}

class MyPetsList extends StatelessWidget {
  final String type; // "added" or "adopted"

  const MyPetsList({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    final pets = [
      PetsModel(
        id: "1",
        name: "Milo",
        images: [
          'https://images.pexels.com/photos/104827/cat-pet-animal-domestic-104827.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
        ],
        breed: "Persian Cat",
        gender: "Male",
        type: "Cat",
        characteristics: [],
        description: "",
        age: 2,
        location: "Cairo, Egypt",
        weight: 4.0,
        isVaccinated: true,
        isAdopted: false,
        createdBy: "0000",
        createdAt: DateTime.parse("2025-08-12T10:15:00Z"),
      ),
      PetsModel(
        id: "2",
        name: "Bella",
        images: [
          'https://images.pexels.com/photos/104827/cat-pet-animal-domestic-104827.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
        ],
        breed: "Golden Retriever",
        gender: "Female",
        type: "Dog",
        age: 1,
        location: "Giza, Egypt",
        weight: 20.0,
        isVaccinated: true,
        isAdopted: true,
        createdBy: "0000",
        createdAt: DateTime.parse("2025-08-12T10:16:00Z"),
        description: "",
        characteristics: [],
      ),
    ];

    return pets.isEmpty
        ? Center(
            child: Text(
              "No ${type == "added" ? "added" : "adopted"} pets yet.",
              style: const TextStyle(
                fontSize: 16,
                color: MyColors.textSecondary,
              ),
            ),
          )
        : GridView.builder(
            padding: const EdgeInsets.all(12),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              mainAxisExtent: 260,
              childAspectRatio: 0.78,
            ),
            itemCount: pets.length,
            itemBuilder: (context, index) {
              final pet = pets[index];
              return PetGridCard(pet: pet);
            },
          );
  }
}

//TODO  