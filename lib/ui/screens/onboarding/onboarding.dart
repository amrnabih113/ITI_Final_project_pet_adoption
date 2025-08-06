import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_adoption/controllers/onboarding/onboarding_controller.dart';
import 'package:pet_adoption/models/onboarding_model.dart';

import '../../../core/constants/colors.dart'; // Assuming you have a color file

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    final OnboardingController controller = Get.put(OnboardingController());
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: PageView.builder(
              controller: controller.pageController,
              onPageChanged: (value) => controller.currentPage.value = value,
              itemCount: onboardingData.length,
              itemBuilder: (context, index) {
                final data = onboardingData[index];
                return Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    spacing: 30,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(data.image, fit: BoxFit.contain),
                      Text(
                        data.title,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headlineMedium
                            ?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: MyColors.primaryColor,
                            ),
                      ),
                      Text(
                        data.description,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: MyColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          Positioned(
            bottom: 50,
            left: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                onboardingData.length,
                (index) => Obx(
                  () => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: 25,
                    height: 5,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(20),
                      color: index == controller.currentPage.value
                          ? MyColors.primaryColor
                          : Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
          ),

          Obx(() {
            if (controller.currentPage.value != onboardingData.length - 1) {
              return Positioned(
                top: 80,
                right: 30,
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: TextButton(
                    onPressed: () => controller.skip(),
                    child: Text(
                      'Skip',
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: MyColors.primaryColor,
                      ),
                    ),
                  ),
                ),
              );
            }
            return const SizedBox.shrink();
          }),

          Obx(
            () => Positioned(
              bottom: 30,
              right: 30,
              child: SafeArea(
                child: ElevatedButton(
                  style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
                    padding: WidgetStatePropertyAll(
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    ),
                    shape:
                        controller.currentPage.value ==
                            onboardingData.length - 1
                        ? WidgetStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          )
                        : WidgetStatePropertyAll(const CircleBorder()),
                  ),
                  onPressed: () => controller.nextPage(),
                  child:
                      controller.currentPage.value == onboardingData.length - 1
                      ? const Text('Get Started')
                      : const Icon(Icons.arrow_forward_ios, size: 20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

final List<OnboardingModel> onboardingData = [
  OnboardingModel(
    title: 'Find Your New Best Friend',
    description:
        'Discover loving cats, dogs, and other adorable companions waiting for a forever home. Your next best friend is just a tap away!',
    image: 'assets/images/onboarding_images/onboarding11.png',
  ),
  OnboardingModel(
    title: 'Adopt with Just a Few Clicks',
    description:
        'Browse, apply, and adopt — all from your phone. We’ve made the process simple, secure, and stress-free for both you and the pets.',
    image: 'assets/images/onboarding_images/onboarding22.png',
  ),
  OnboardingModel(
    title: 'Support Local Shelters',
    description:
        'By adopting through our app, you’re supporting local animal shelters and giving pets the second chance they deserve.',
    image: 'assets/images/onboarding_images/onboarding33.png',
  ),
];
