import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pet_adoption/core/constants/texts.dart';
import 'package:pet_adoption/core/utils/helpers/network_manager.dart';
import 'package:pet_adoption/core/utils/popups/full_screen_loader.dart';
import 'package:pet_adoption/core/utils/popups/loaders.dart';
import 'package:pet_adoption/services/auth_service.dart';
import 'package:pet_adoption/ui/screens/home_screen.dart';

class SigninController extends GetxController {
  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> passwordController = TextEditingController().obs;

  RxBool rememberMe = false.obs;
  RxBool hidePassword = true.obs;
  final GetStorage localStorage = GetStorage();

  final AuthService authService = AuthService.instance;
  final formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    emailController.value.text =
        localStorage.read(MyTexts.rememberMeEmail) ?? "";
    passwordController.value.text =
        localStorage.read(MyTexts.rememberMePassword) ?? "";
    super.onInit();
  }

  Future signIn() async {
    try {
      MyFullScreenLoader.openLoadingDialog(
        "Signing in...",
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
      if (!rememberMe.value) {
        localStorage.write(
          MyTexts.rememberMeEmail,
          emailController.value.text.trim(),
        );
        localStorage.write(
          MyTexts.rememberMePassword,
          passwordController.value.text.trim(),
        );
      }
      await authService.signInWithEmailAndPassword(
        emailController.value.text,
        passwordController.value.text,
      );
      MyFullScreenLoader.stopLoading();
      authService.screenRedirect();
    } catch (e) {
      MyLoaders.errorSnackBar(title: "Error", message: e.toString());
      MyFullScreenLoader.stopLoading();
    }
  }

  Future signInWithGoogle() async {
    try {
      MyFullScreenLoader.openLoadingDialog(
        "Signing in...",
        "assets/images/loader-animation.json",
      );
      await authService.signInWithGoogle();
      MyFullScreenLoader.stopLoading();
      Get.to(() => const HomeScreen());
    } catch (e) {
      MyLoaders.errorSnackBar(title: "Error", message: e.toString());
      MyFullScreenLoader.stopLoading();
    }
  }
}
