import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_adoption/controllers/auth/signin_controller.dart';
import 'package:pet_adoption/core/constants/colors.dart';
import 'package:pet_adoption/core/constants/sizes.dart';

class SocialButtons extends StatelessWidget {
  const SocialButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SigninController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: MyColors.darkGrey),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            onPressed: () => controller.signInWithGoogle(),
            icon: Image(
              image: const AssetImage("assets/images/google-logo.png"),
              width: MySizes.iconMd,
              height: MySizes.iconMd,
            ),
          ),
        ),
        const SizedBox(width: MySizes.spaceBetweenItems),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: MyColors.darkGrey),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            onPressed: () {},
            icon: Image(
              image: const AssetImage("assets/images/facebook-logo.png"),
              width: MySizes.iconLg,
              height: MySizes.iconLg,
            ),
          ),
        ),
      ],
    );
  }
}
