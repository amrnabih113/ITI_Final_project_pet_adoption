import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_adoption/controllers/auth/reset_email_controller.dart';
import 'package:pet_adoption/core/constants/sizes.dart';
import 'package:pet_adoption/core/utils/helpers/helper_functions.dart';
import 'package:pet_adoption/ui/screens/auth/login.dart';

class ResetSent extends StatelessWidget {
  const ResetSent({super.key, required this.email});
  final String email;
  @override
  Widget build(BuildContext context) {
    final controller = ResetPasswordController.instance;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(Icons.close),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(MySizes.defaultSpacing),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //image
              Image(
                image: const AssetImage("assets/images/email_sent.png"),
                width: MyHelperFunctions.getScreenWidth() * 0.6,
              ),
              const SizedBox(height: MySizes.spaceBetweenSections),
              Text(
                email,
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: MySizes.spaceBetweenSections),
              //title and subtitle
              Text(
                "Check your email",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: MySizes.spaceBetweenSections),
              Text(
                "We've sent a password reset link to $email",
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: MySizes.spaceBetweenSections),

              // button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Get.offAll(() => const Login()),
                  child: Text(
                    "Done",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ),
              const SizedBox(height: MySizes.spaceBetweenItems),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () => controller.resendPasswordEmailReset(),
                  child: Text(
                    "Resend",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
