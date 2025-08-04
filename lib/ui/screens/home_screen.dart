import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pet_adoption/core/constants/colors.dart';
import 'package:pet_adoption/core/utils/helpers/helper_functions.dart';
import 'package:pet_adoption/ui/screens/pets/home.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final dark = MyHelperFunctions.isDarkMode(context);
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: Obx(
        () => Padding(
          padding: const EdgeInsets.only(bottom: 20, left: 16, right: 16),
          child: Container(
            decoration: BoxDecoration(
              color: dark
                  ? MyColors.black
                  : const Color.fromARGB(255, 255, 250, 240),
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: NavigationBar(
              height: 70,
              elevation: 0,
              backgroundColor: Colors.transparent,
              selectedIndex: controller.selectedIndex.value,
              onDestinationSelected: (index) =>
                  controller.selectedIndex.value = index,
              indicatorShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              indicatorColor: MyColors.primaryColor.withValues(
                alpha: 0.15,
              ), // translucent base
              labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
              destinations: const [
                NavigationDestination(
                  icon: Icon(Iconsax.pet, color: MyColors.primaryColor),
                  label: "Home",
                ),
                NavigationDestination(
                  icon: Icon(
                    Iconsax.search_normal_1,
                    color: MyColors.primaryColor,
                  ),
                  label: "Explore",
                ),
                NavigationDestination(
                  icon: Icon(Iconsax.heart, color: MyColors.primaryColor),
                  label: "Favorites",
                ),
                NavigationDestination(
                  icon: Icon(Iconsax.user, color: MyColors.primaryColor),
                  label: "Profile",
                ),
              ],
            ),
          ),
        ),
      ),

      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  static final NavigationController instance = Get.find();
  final selectedIndex = 0.obs;

  @override
  void onInit() {
    selectedIndex.value = 0;
    super.onInit();
  }

  final List<Widget> screens = [
    Home(),
    Container(color: Colors.blue),
    Container(color: Colors.yellow),
    Container(color: Colors.green),
  ];
}
