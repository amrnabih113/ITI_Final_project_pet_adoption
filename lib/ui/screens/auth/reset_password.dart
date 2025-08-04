import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pet_adoption/controllers/auth/reset_email_controller.dart';
import 'package:pet_adoption/core/constants/colors.dart';
import 'package:pet_adoption/core/constants/sizes.dart';
import 'package:pet_adoption/core/utils/validators/validation.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ResetPasswordController());
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(MySizes.defaultSpacing),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Forget Password?",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: MySizes.spaceBetweenItems),
              Text(
                "Don't worry, we'll send you a link to reset your password.",
                style: Theme.of(context).textTheme.labelMedium,
              ),
              const SizedBox(height: MySizes.spaceBetweenSections * 2),
              Form(
                key: controller.resetFormKey,
                child: TextFormField(
                  cursorColor: MyColors.primaryColor,
                  //  controller: controller.emailController,
                  validator: (value) => MyValidator.validateEmail(value),
                  decoration: InputDecoration(
                    labelText: "Email",
                    prefixIcon: const Icon(Iconsax.direct_right),
                  ),
                ),
              ),
              const SizedBox(height: MySizes.spaceBetweenSections),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (controller.resetFormKey.currentState!.validate()) {
                      controller.resetPassword();
                    }
                  },
                  child: Text("Submit"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
