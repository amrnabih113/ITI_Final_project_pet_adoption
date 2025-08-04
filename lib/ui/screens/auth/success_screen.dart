
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pet_adoption/core/constants/sizes.dart';
import 'package:pet_adoption/core/utils/helpers/helper_functions.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key, required this.image, required this.onPressed, required this.title, required this.subtitle});
  final String image;
  final VoidCallback onPressed;
  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Padding(
      padding: EdgeInsets.only(top: MySizes.appBarHeight,
        left: MySizes.defaultSpacing,
        right: MySizes.defaultSpacing,
        bottom: MySizes.defaultSpacing),
      child: Column(
        children: [
          //image
          Lottie.asset(
            image,
            width: MyHelperFunctions.getScreenWidth() * 0.6,
          ),
          const SizedBox(
            height: MySizes.spaceBetweenSections,
          ),

          //title and subtitle
          Text(
            title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(
            height: MySizes.spaceBetweenSections,
          ),
          Text(
            subtitle,
            style: Theme.of(context).textTheme.labelMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: MySizes.spaceBetweenSections),

          // button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: onPressed, child:  Text("Continue")),
          ),
          const SizedBox(
            height: MySizes.spaceBetweenItems,
          ),
        ],
      ),
    )));
  }
}
