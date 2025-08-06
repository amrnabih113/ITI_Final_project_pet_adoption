import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:pet_adoption/core/constants/colors.dart';
import 'package:pet_adoption/ui/screens/pets/favourates.dart';
import 'package:pet_adoption/ui/widgets/my_header_title.dart';
import 'package:pet_adoption/ui/widgets/pet_card.dart';

class CategoryDetails extends StatelessWidget {
  const CategoryDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Dogs",
              style: Theme.of(
                context,
              ).textTheme.headlineLarge!.copyWith(color: MyColors.primaryColor),
            ),
            const SizedBox(width: 10),
            Image.asset("assets/categories/dog.png", width: 40),
          ],
        ),
        shape: UnderlineInputBorder(
          borderSide: BorderSide(color: MyColors.primaryColor),
          borderRadius: BorderRadius.circular(40),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// ----------- MALE ------------
            MyHeaderTitle(title: "Male", showSeeAll: false),
            const SizedBox(height: 10),
            CarouselSlider.builder(
              itemCount: 5,
              itemBuilder: (context, index, realIdx) {
                return PetCard(
                  height: 150,
                  image:
                      'https://images.squarespace-cdn.com/content/v1/54822a56e4b0b30bd821480c/45ed8ecf-0bb2-4e34-8fcf-624db47c43c8/Golden+Retrievers+dans+pet+care.jpeg',
                  name: 'Rockey',
                  breed: 'Golden Retriever',
                  gender: 'Male',
                  age: '2 months',
                  location: 'Cairo, Egypt',
                  weight: '4.5 kg',
                  isVaccinated: true,
                  isFavorited: false,
                );
              },
              options: CarouselOptions(
                height: 170,
                enlargeCenterPage: true,
                enableInfiniteScroll: false,
                viewportFraction: 0.9,
                autoPlay: true,
              ),
            ),

            const SizedBox(height: 10),

            /// ----------- FEMALE ------------
            MyHeaderTitle(title: "Female", showSeeAll: false),
            const SizedBox(height: 10),
            CarouselSlider.builder(
              itemCount: 5,
              itemBuilder: (context, index, realIdx) {
                return PetCard(
                  height: 150,
                  image:
                      'https://m.media-amazon.com/images/I/61NGFek9lXL._UF1000,1000_QL80_.jpg',
                  name: 'Bella',
                  breed: 'West Highland White Terrier',
                  gender: 'Female',
                  age: '2 years',
                  location: 'Cairo, Egypt',
                  weight: '4.5 kg',
                  isVaccinated: true,
                  isFavorited: false,
                );
              },
              options: CarouselOptions(
                height: 170,
                enlargeCenterPage: true,
                enableInfiniteScroll: false,
                viewportFraction: 0.9,
                autoPlay: true,
              ),
            ),
            const SizedBox(height: 10),

            /// ----------- ALL ------------
            MyHeaderTitle(title: "Both Genders", showSeeAll: false),
            const SizedBox(height: 10),
            _buildPetGrid(context, gender: "All"),
          ],
        ),
      ),
    );
  }

  Widget _buildPetGrid(BuildContext context, {required String gender}) {
    return GridView.builder(
      itemCount: 10,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: 280,
      ),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: PetGridCard(
            image:
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRscVhVOxfzUsxgnOI1mLsjo2mM4maq7AeQ4g&s',
            name: 'Max',
            breed: 'Labrador',
            gender: 'Male',
            age: '2 months',
            location: 'Cairo, Egypt',
            weight: '4.5 kg',
            isVaccinated: true,
            isFavorited: false,
            onFavoriteToggle: () {},
          ),
        );
      },
    );
  }
}
