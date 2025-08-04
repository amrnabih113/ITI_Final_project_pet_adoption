import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pet_adoption/controllers/auth/signin_controller.dart';
import 'package:pet_adoption/core/constants/colors.dart';
import 'package:pet_adoption/core/utils/validators/validation.dart';
import 'package:pet_adoption/ui/screens/auth/reset_password.dart';
import 'package:pet_adoption/ui/screens/auth/signup.dart';

import '../../widgets/socialbuttons.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SigninController());

    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Form(
          key: controller.formKey,
          child: Column(
            spacing: 10,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              Align(
                alignment: Alignment.center,
                child: Image(
                  image: AssetImage("assets/images/logo1.png"),
                  color: MyColors.black,
                  width: 200,
                ),
              ),
              Text(
                "Welcome Back!",
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  color: MyColors.primaryColor,
                ),
              ),
              Text(
                "Sign in to continue your journey of finding a loving companion.",
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge?.copyWith(color: MyColors.textSecondary),
              ),
              SizedBox(height: 20),
              TextFormField(
                validator: (value) => MyValidator.validateEmail(value),
                controller: controller.emailController.value,
                keyboardType: TextInputType.emailAddress,
                cursorColor: MyColors.primaryColor,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Iconsax.send_2,
                    color: MyColors.primaryColor,
                  ),
                  labelText: "Email",
                  labelStyle: TextStyle(color: MyColors.textSecondary),
                ),
              ),
              Obx(
                () => TextFormField(
                  validator: (value) => MyValidator.validatePassword(value),
                  keyboardType: TextInputType.visiblePassword,
                  controller: controller.passwordController.value,
                  obscureText: controller.hidePassword.value,
                  obscuringCharacter: "*",
                  cursorColor: MyColors.primaryColor,
                  decoration: InputDecoration(
                    suffix: InkWell(
                      splashColor: Colors.transparent,
                      child: controller.hidePassword.value
                          ? const Icon(
                              Iconsax.eye_slash,
                              color: MyColors.primaryColor,
                            )
                          : const Icon(
                              Iconsax.eye,
                              color: MyColors.primaryColor,
                            ),
                      onTap: () => controller.hidePassword.value =
                          !controller.hidePassword.value,
                    ),
                    prefixIcon: Icon(
                      Iconsax.lock,
                      color: MyColors.primaryColor,
                    ),
                    labelText: "Password",
                    labelStyle: TextStyle(color: MyColors.textSecondary),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Obx(
                        () => Checkbox(
                          value: controller.rememberMe.value,
                          onChanged: (value) {
                            controller.rememberMe.value = value!;
                          },
                        ),
                      ),
                      Text(
                        "Remember Me",
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: MyColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {
                      Get.to(() => const ResetPassword());
                    },
                    child: Text(
                      "Forgot Password?",
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: MyColors.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    if (controller.formKey.currentState!.validate()) {
                      await controller.signIn();
                    }
                  },
                  child: Text("Log In"),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account? ",
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: MyColors.textSecondary,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => const Signup());
                    },
                    child: Text(
                      "Sign Up",
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: MyColors.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "-- Or login with -- ",
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: MyColors.textSecondary,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              SocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
