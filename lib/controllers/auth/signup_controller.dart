import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pet_adoption/core/utils/helpers/network_manager.dart';
import 'package:pet_adoption/core/utils/popups/full_screen_loader.dart';
import 'package:pet_adoption/core/utils/popups/loaders.dart';
import 'package:pet_adoption/services/auth_service.dart';
import 'package:pet_adoption/ui/screens/auth/verify_email.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  Rx<TextEditingController> fNameController = TextEditingController().obs;
  Rx<TextEditingController> lNameController = TextEditingController().obs;
  Rx<TextEditingController> phoneController = TextEditingController().obs;
  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> passwordController = TextEditingController().obs;
  Rx<TextEditingController> confirmPasswordController =
      TextEditingController().obs;

  final formKey = GlobalKey<FormState>();

  RxBool hidePassword = true.obs;
  RxBool hideConfirmPassword = true.obs;

  RxBool termsAndConditions = false.obs;

  final authService = AuthService();
  Future signUp() async {
    try {
      MyFullScreenLoader.openLoadingDialog(
        "Signing up...",
        "assets/images/loader-animation.json",
      );
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        MyFullScreenLoader.stopLoading();
        return;
      }

      if (!formKey.currentState!.validate()) {
        MyFullScreenLoader.stopLoading();
        return;
      }

      if (!termsAndConditions.value) {
        MyLoaders.warningSnackBar(
          title: "Accept Terms and Conditions",
          message: "Please accept the terms and conditions to continue.",
        );
        MyFullScreenLoader.stopLoading();
        return;
      }
      await authService.registerWithEmailAndPassword(
        emailController.value.text,
        passwordController.value.text,
      );
      MyFullScreenLoader.stopLoading();
      Get.to(() => const VerifyEmailSCreen());
      MyLoaders.successSnackBar(
        title: "Congratulations!",
        message:
            "Your account has been created successfully. Please check your email to verify your account.",
      );
    } catch (e) {
      MyLoaders.errorSnackBar(title: "Error", message: e.toString());
      MyFullScreenLoader.stopLoading();
    }
  }
}
