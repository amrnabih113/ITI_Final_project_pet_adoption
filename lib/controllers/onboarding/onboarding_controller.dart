import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_adoption/ui/screens/auth/login.dart';

class OnboardingController extends GetxController {
  static OnboardingController get instance => Get.find();

  final RxInt currentPage = 0.obs;
  late final PageController pageController;

  @override
  void onInit() {
    super.onInit();
    pageController = PageController(initialPage: currentPage.value);
  }

  void nextPage() {
    if (currentPage.value < 2) {
      currentPage.value++;
      pageController.animateToPage(
        currentPage.value,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Get.to(() => const Login());
    }
  }

  void skip() {
    currentPage.value = 2;
    pageController.jumpToPage(2);
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
