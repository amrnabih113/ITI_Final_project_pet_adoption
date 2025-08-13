import 'package:get/get.dart';
import 'package:pet_adoption/models/pets_model.dart';

class HomeController extends GetxController {
  // Banner images
  final bannerImages = [
    "assets/banners/banner1.png",
    "assets/banners/banner2.png",
    "assets/banners/banner3.png",
  ];

  // Categories
  final categories = [
    'Dogs',
    'Cats',
    'Birds',
    'Rabbits',
    'Turtles',
  ];

  final categoryIcons = [
    "assets/categories/dog.png",
    "assets/categories/cat.png",
    "assets/categories/bird.png",
    "assets/categories/rabbit.png",
    "assets/categories/turtle.png",
  ];

  // Recommended Pets
  final recommendedPets = <PetsModel>[
    PetsModel(
      images: [
        'https://images.pexels.com/photos/104827/cat-pet-animal-domestic-104827.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
        'https://c8.alamy.com/comp/P6CMJR/a-gray-and-white-domestic-shorthair-cat-with-green-eyes-P6CMJR.jpg',
      ],
      name: 'Milo',
      breed: 'Siamese Cat',
      gender: 'Male',
      age: 2,
      location: 'Alexandria, Egypt',
      weight: 3.2,
      isVaccinated: true,
      characteristics: [
        'Friendly',
        'Loyal',
        'Playful',
        'Good with kids',
      ],
      createdAt: DateTime.now(),
      id: "",
      type: 'Cat',
      createdBy: "Amr Nabih",
      isAdopted: false,
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
    ),
  ];

}
