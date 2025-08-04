import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_adoption/core/utils/helpers/network_manager.dart';
import 'package:pet_adoption/core/utils/popups/full_screen_loader.dart';
import 'package:pet_adoption/core/utils/popups/loaders.dart';
import 'package:pet_adoption/services/auth_service.dart';
import 'package:pet_adoption/ui/screens/auth/reset_sent.dart';

class ResetPasswordController extends GetxController {
  static ResetPasswordController get instance => Get.find();

  final emailController = TextEditingController();
  final resetFormKey = GlobalKey<FormState>();
  final authService = AuthService();

  Future<void> resetPassword() async {
    try {
      MyFullScreenLoader.openLoadingDialog(
        "Request Processing ...",
        "assets/images/loader-animation.json",
      );
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        MyFullScreenLoader.stopLoading();
        return;
      }

      if (!resetFormKey.currentState!.validate()) {
        MyFullScreenLoader.stopLoading();
        return;
      }
      await authService.resetPassword(emailController.text.trim());
      MyLoaders.successSnackBar(
        title: "Email Sent",
        message: "Reset Password Email Sent Successfully",
      );
      MyFullScreenLoader.stopLoading();
      Get.to(() => ResetSent(email: emailController.text.trim()));
    } catch (e) {
      MyFullScreenLoader.stopLoading();
      print("================================================$e");
      MyLoaders.errorSnackBar(title: "Error", message: "Something went wrong");
    }
  }

  resendPasswordEmailReset() async {
    try {
      MyFullScreenLoader.openLoadingDialog(
        "Request Processing ...",
        "assets/images/loader-animation.json",
      );
      await authService.resetPassword(emailController.text.trim());
      MyLoaders.successSnackBar(
        title: "Email Sent",
        message: "Reset Password Email Sent Successfully",
      );
      MyFullScreenLoader.stopLoading();
    } catch (e) {
      MyFullScreenLoader.stopLoading();
      MyLoaders.errorSnackBar(title: "Error", message: "Something went wrong");
    }
  }
}
