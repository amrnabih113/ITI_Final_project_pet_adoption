import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'package:pet_adoption/core/utils/popups/loaders.dart';
import 'package:pet_adoption/models/user_model.dart';
import 'package:pet_adoption/services/storage_service.dart';
import 'package:pet_adoption/services/user_service.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  Rx<bool> profileLoading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;

  final userRepository = Get.put(UserService());
  final StorageService storageService = Get.put(StorageService());

  Rx<bool> imageLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  /// Save new user record to Firestore
  Future<void> saveUserRecord(UserCredential? user) async {
    try {
      if (user != null) {
        final userModel = UserModel(
          id: user.user!.uid,
          email: user.user!.email ?? "",
          name: user.user!.displayName ?? "",
          joinedAt: DateTime.now(),
          imageUrl: user.user!.photoURL ?? "",
          location: "",
          phoneNumber: user.user!.phoneNumber ?? "",
        );
        await userRepository.saveUserRecord(userModel);
      }
    } catch (e) {
      MyLoaders.errorSnackBar(
        title: "Oh Snap",
        message: "Something went wrong. Please check your internet connection.",
      );
    }
  }

  /// Fetch current user details
  Future<void> fetchUserRecord() async {
    try {
      profileLoading(true);
      final fetchedUser = await UserService.instance.fetchUserDetails();
      user(fetchedUser);
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading(false);
    }
  }

  Future<void> uploadUserProfilePicture() async {
    try {
      imageLoading.value = true;

      final image = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        maxWidth: 500,
        maxHeight: 500,
      );
      if (image != null) {
        final url = await storageService.uploadImage(
          "${image.name}.png",
          image,
        );
        await UserService.instance.updateSingleField({"profilePictutre": url});
        user.value.imageUrl = url;
        user.refresh();
        imageLoading.value = false;
        MyLoaders.successSnackBar(
          title: "Success",
          message: "Profile picture updated successfully",
        );
      }
      imageLoading.value = false;
    } catch (e) {
      imageLoading.value = false;
      MyLoaders.warningSnackBar(
        title: "Error",
        message: "Something went wrong. Please try again.",
      );
      print(e.toString());
    }
  }

  Future updateUser(UserModel user) async {
    try {
      await UserService.instance.updateSingleField(user.toJson());
      fetchUserRecord();
      MyLoaders.successSnackBar(
        title: "Success",
        message: "Profile updated successfully",
      );
    } catch (e) {
      MyLoaders.warningSnackBar(
        title: "Error",
        message: "Something went wrong. Please try again.",
      );
    }
  }
}
