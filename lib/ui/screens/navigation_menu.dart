// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:iconsax/iconsax.dart';
// import 'package:pet_adoption/core/constants/colors.dart';
// import 'package:pet_adoption/core/utils/helpers/helper_functions.dart';
// import 'package:pet_adoption/ui/screens/community/community_page.dart';
// import 'package:pet_adoption/ui/screens/pets/explore.dart';
// import 'package:pet_adoption/ui/screens/pets/favourates.dart';
// import 'package:pet_adoption/ui/screens/pets/home_page.dart';
// import 'package:pet_adoption/ui/screens/profile/profile.dart';

// class NavigationMenu extends StatelessWidget {
//   const NavigationMenu({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(NavigationController());
//     final dark = MyHelperFunctions.isDarkMode(context);
//     return Scaffold(
//       extendBody: true,
//       bottomNavigationBar: Obx(
//         () => Padding(
//           padding: const EdgeInsets.only(bottom: 20, left: 16, right: 16),
//           child: Container(
//             decoration: BoxDecoration(
//               color: dark
//                   ? MyColors.black
//                   : const Color.fromARGB(255, 255, 250, 240),
//               borderRadius: BorderRadius.circular(30),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.black.withValues(alpha: 0.08),
//                   blurRadius: 20,
//                   spreadRadius: 1,
//                   offset: const Offset(0, 10),
//                 ),
//                 BoxShadow(
//                   color: Colors.black.withValues(alpha: 0.08),
//                   blurRadius: 20,
//                   spreadRadius: 1,
//                   offset: const Offset(0, -8),
//                 ),
//               ],
//             ),
//             child: NavigationBar(
//               height: 70,
//               elevation: 0,
//               backgroundColor: Colors.transparent,
//               selectedIndex: controller.selectedIndex.value,
//               onDestinationSelected: (index) =>
//                   controller.selectedIndex.value = index,
//               indicatorShape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(20),
//               ),
//               indicatorColor: MyColors.primaryColor.withValues(
//                 alpha: 0.15,
//               ), // translucent base
//               labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
//               destinations: const [
//                 NavigationDestination(
//                   icon: Icon(Iconsax.home, color: MyColors.primaryColor),
//                   label: "Home",
//                 ),
//                 NavigationDestination(
//                   icon: Icon(
//                     Iconsax.search_favorite,
//                     color: MyColors.primaryColor,
//                   ),
//                   label: "Explore",
//                 ),
//                 NavigationDestination(
//                   icon: Icon(Iconsax.instagram, color: MyColors.primaryColor),
//                   label: "Community",
//                 ),
//                 NavigationDestination(
//                   icon: Icon(Iconsax.heart, color: MyColors.primaryColor),
//                   label: "Favorites",
//                 ),
//                 NavigationDestination(
//                   icon: Icon(Iconsax.user, color: MyColors.primaryColor),
//                   label: "Profile",
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),

//       body: Obx(() => controller.screens[controller.selectedIndex.value]),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pet_adoption/controllers/auth/user_controller.dart';
import 'package:pet_adoption/core/constants/colors.dart';
import 'package:pet_adoption/ui/screens/community/community_page.dart';
import 'package:pet_adoption/ui/screens/pets/explore.dart';
import 'package:pet_adoption/ui/screens/pets/favourates.dart';
import 'package:pet_adoption/ui/screens/pets/home_page.dart';
import 'package:pet_adoption/ui/screens/profile/profile.dart';

class NavigationMenu extends StatefulWidget {
  const NavigationMenu({super.key});

  @override
  State<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  @override
  void initState() {
    super.initState();
    // Ensure controller is created once
    Get.put(NavigationController());
  }

  @override
  Widget build(BuildContext context) {
    final controller = NavigationController.instance;
    Get.put(UserController());
    return Scaffold(
      extendBody: true,
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
      bottomNavigationBar: AnimatedNotchBottomBar(
        circleMargin: 0,

        notchBottomBarController: controller.notchController.value,
        color: MyColors.light,
        showLabel: false,
        notchColor: MyColors.primaryColor,
        bottomBarItems: const [
          BottomBarItem(
            inActiveItem: Icon(Iconsax.home_2, color: MyColors.textPrimary),
            activeItem: Icon(Iconsax.home_2, color: MyColors.white),
          ),
          BottomBarItem(
            inActiveItem: Icon(Iconsax.search_favorite),
            activeItem: Icon(Iconsax.search_favorite, color: MyColors.white),
          ),
          BottomBarItem(
            inActiveItem: Icon(Iconsax.instagram),
            activeItem: Icon(Iconsax.instagram, color: MyColors.white),
          ),
          BottomBarItem(
            inActiveItem: Icon(Iconsax.heart),
            activeItem: Icon(Iconsax.heart, color: MyColors.white),
          ),
          BottomBarItem(
            inActiveItem: Icon(Iconsax.user),
            activeItem: Icon(Iconsax.user, color: MyColors.white),
          ),
        ],
        onTap: controller.changePage,
        kIconSize: 25,
        kBottomRadius: 30,
      ),
    );
  }
}

class NavigationController extends GetxController {
  // Safe singleton getter
  static NavigationController get instance => Get.find<NavigationController>();

  final selectedIndex = 0.obs;
  final notchController = NotchBottomBarController(index: 0).obs;

  final List<Widget> screens = [
    Home(),
    Explore(),
    CommunityPage(),
    FavoritesPage(),
    Profile(),
  ];

  @override
  void onInit() {
    selectedIndex.value = 0;
    super.onInit();
  }

  void changePage(int index) {
    selectedIndex.value = index;
    notchController.value.index = index;
  }
}
