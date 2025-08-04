import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pet_adoption/controllers/auth/signup_controller.dart';
import 'package:pet_adoption/core/constants/colors.dart';
import 'package:pet_adoption/core/utils/validators/validation.dart';
import 'package:pet_adoption/ui/screens/auth/login.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 80,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Form(
          key: controller.formKey,
          child: Column(
            spacing: 10,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Join Our Pet-Loving Community!',
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  color: MyColors.primaryColor,
                ),
              ),
              Text(
                "Create your account and give a pet the forever home they deserve.",
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge?.copyWith(color: MyColors.textSecondary),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: controller.fNameController.value,
                      cursorColor: MyColors.primaryColor,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Iconsax.user,
                          color: MyColors.primaryColor,
                        ),
                        labelText: 'First Name',
                      ),
                      validator: (value) =>
                          MyValidator.validateEmptyText("First Name", value),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextFormField(
                      controller: controller.lNameController.value,
                      cursorColor: MyColors.primaryColor,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Iconsax.user,
                          color: MyColors.primaryColor,
                        ),
                        labelText: 'Last Name',
                      ),
                      validator: (value) =>
                          MyValidator.validateEmptyText("Last Name", value),
                    ),
                  ),
                ],
              ),
              TextFormField(
                controller: controller.emailController.value,
                cursorColor: MyColors.primaryColor,
                decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Iconsax.send_2,
                    color: MyColors.primaryColor,
                  ),
                  labelText: 'Email',
                ),
                validator: (value) => MyValidator.validateEmail(value),
              ),
              TextFormField(
                keyboardType: TextInputType.phone,
                controller: controller.phoneController.value,
                cursorColor: MyColors.primaryColor,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.call, color: MyColors.primaryColor),

                  labelText: 'Phone Number',
                ),
                validator: (value) => MyValidator.validatePhoneNumber(value),
              ),
              Obx(
                () => TextFormField(
                  controller: controller.passwordController.value,
                  cursorColor: MyColors.primaryColor,
                  obscuringCharacter: "*",
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Iconsax.lock,
                      color: MyColors.primaryColor,
                    ),
                    labelText: 'Password',
                    suffixIcon: Obx(
                      () => IconButton(
                        icon: Icon(
                          !controller.hidePassword.value
                              ? Iconsax.eye
                              : Iconsax.eye_slash,
                        ),
                        onPressed: () => controller.hidePassword.value =
                            !controller.hidePassword.value,
                        color: MyColors.primaryColor,
                      ),
                    ),
                  ),
                  obscureText: controller.hidePassword.value,
                  validator: (value) => MyValidator.validatePassword(value),
                ),
              ),
              Obx(
                () => TextFormField(
                  controller: controller.confirmPasswordController.value,
                  cursorColor: MyColors.primaryColor,
                  obscuringCharacter: "*",
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Iconsax.lock,
                      color: MyColors.primaryColor,
                    ),
                    labelText: 'Confirm Password',
                    suffixIcon: Obx(
                      () => IconButton(
                        icon: Icon(
                          !controller.hideConfirmPassword.value
                              ? Iconsax.eye
                              : Iconsax.eye_slash,
                        ),
                        onPressed: () => controller.hideConfirmPassword.value =
                            !controller.hideConfirmPassword.value,
                        color: MyColors.primaryColor,
                      ),
                    ),
                  ),
                  obscureText: controller.hideConfirmPassword.value,
                  validator: (value) => MyValidator.validateConfirmPassword(
                    value,
                    controller.passwordController.value.text,
                  ),
                ),
              ),
              Row(
                children: [
                  Obx(
                    () => Checkbox(
                      value: controller.termsAndConditions.value,
                      onChanged: (value) {
                        controller.termsAndConditions.value = value!;
                      },
                    ),
                  ),
                  Text(
                    " Agree to our terms and conditions.",
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: MyColors.textSecondary,
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (controller.formKey.currentState!.validate()) {
                      controller.signUp();
                    }
                  },
                  child: const Text("Sign Up"),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: MyColors.textSecondary,
                    ),
                  ),
                  TextButton(
                    onPressed: () => Get.offAll(() => Login()),
                    child: Text(
                      "Sign In",
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: MyColors.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
