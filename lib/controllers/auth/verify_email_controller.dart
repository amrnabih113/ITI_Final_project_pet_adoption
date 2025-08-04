import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:pet_adoption/core/utils/popups/loaders.dart';
import 'package:pet_adoption/services/auth_service.dart';
import 'package:pet_adoption/ui/screens/auth/success_screen.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }

  Future<void> sendEmailVerification() async {
    try {
      await AuthService.instance.emailVerification();
      MyLoaders.successSnackBar(
        title: "Email Sent",
        message: "Please check your email to verify your account.",
      );
    } catch (e) {
      print("================================================$e");
      MyLoaders.errorSnackBar(title: "Error", message: "Something went wrong");
    }
  }

  void setTimerForAutoRedirect() {
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      if (FirebaseAuth.instance.currentUser!.emailVerified) {
        timer.cancel();
        Get.off(
          () => SuccessScreen(
            image: "assets/images/loader-animation.json",
            title: "Your Account Created",
            subtitle: "Please check your email to verify your account.",
            onPressed: () => AuthService.instance.screenRedirect(),
          ),
        );
      }
    });
  }

  checkEmailVerifcationStatus() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null && user.emailVerified) {
      Get.off(
        () => SuccessScreen(
          image: "assets/images/loader-animation.json",
          title: "Your Account Created",
          subtitle: "Please check your email to verify your account.",
          onPressed: () => AuthService.instance.screenRedirect(),
        ),
      );
    }
  }
}
