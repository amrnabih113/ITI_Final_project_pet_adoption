import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pet_adoption/core/constants/colors.dart';
import 'package:pet_adoption/core/constants/sizes.dart';
import 'package:pet_adoption/core/constants/texts.dart';
import 'package:pet_adoption/core/local_storage/my_local_storage.dart';
import 'package:pet_adoption/core/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:pet_adoption/core/utils/exceptions/firebase_exceptions.dart';
import 'package:pet_adoption/core/utils/exceptions/format_exceptions.dart';
import 'package:pet_adoption/core/utils/exceptions/platform_exceptions.dart';
import 'package:pet_adoption/core/utils/helpers/helper_functions.dart';
import 'package:pet_adoption/ui/screens/auth/login.dart';
import 'package:pet_adoption/ui/screens/auth/verify_email.dart';
import 'package:pet_adoption/ui/screens/navigation_menu.dart';
import 'package:pet_adoption/ui/screens/onboarding/onboarding.dart';

class AuthService extends GetxController {
  static AuthService get instance => Get.find();
  final deviceStorage = GetStorage();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  screenRedirect() async {
    User? user = _auth.currentUser;
    if (user != null) {
      if (user.emailVerified) {
        await MyLocalStorage.init(user.uid);
        Get.offAll(() => const NavigationMenu());
      } else {
        Get.offAll(() => VerifyEmailSCreen(email: user.email));
      }
    } else {
      deviceStorage.writeIfNull(MyTexts.isFirstTime, true);
      deviceStorage.read(MyTexts.isFirstTime) != true
          ? Get.offAll(() => const Login())
          : Get.offAll(() => const Onboarding());
    }
  }

  Future<UserCredential> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      return await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw MyFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw MyFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const MyFormatException().message;
    } on PlatformException catch (e) {
      throw MyPlatformException(e.code).message;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<UserCredential> registerWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw MyFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw MyFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const MyFormatException().message;
    } on PlatformException catch (e) {
      throw MyPlatformException(e.code).message;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<UserCredential> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      return await _auth.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      throw MyFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw MyFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const MyFormatException().message;
    } on PlatformException catch (e) {
      throw MyPlatformException(e.code).message;
    } catch (e) {
      print("+++++++++++++++++++++++++++++++++++++++++++++++$e");
      throw e.toString();
    }
  }

  // Future<UserCredential> signInWithFacebook() async {
  //   try {
  //     final LoginResult result = await FacebookAuth.instance.login();
  //     print("==========================" "${result.status}");
  //     if (result.status == LoginStatus.success) {
  //       final AccessToken? accessToken = result.accessToken;
  //       final OAuthCredential credential =
  //           FacebookAuthProvider.credential(accessToken!.tokenString);
  //       return await FirebaseAuth.instance.signInWithCredential(credential);
  //     } else {
  //       throw Exception("Facebook login failed: ${result.message}");
  //     }
  //   } on FirebaseAuthException catch (e) {
  //     throw MyFirebaseAuthException(e.code).message;
  //   } on FirebaseException catch (e) {
  //     throw MyFirebaseException(e.code).message;
  //   } on PlatformException catch (e) {
  //     throw MyPlatformException(e.code).message;
  //   } catch (e) {
  //     throw e.toString();
  //   }
  // }

  Future<void> emailVerification() async {
    try {
      await _auth.currentUser!.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw MyFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw MyFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const MyFormatException().message;
    } on PlatformException catch (e) {
      throw MyPlatformException(e.code).message;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<void> resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw MyFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw MyFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const MyFormatException().message;
    } on PlatformException catch (e) {
      throw MyPlatformException(e.code).message;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<void> signOut() async {
    try {
      Get.defaultDialog(
        contentPadding: const EdgeInsets.all(MySizes.md),
        buttonColor: MyColors.primaryColor,
        title: "Logging Out",
        titlePadding: const EdgeInsets.all(MySizes.md),
        textConfirm: "Log Out",
        textCancel: "Cancel",
        confirmTextColor: Colors.white,
        cancelTextColor: Colors.black,
        backgroundColor: MyHelperFunctions.isDarkMode(Get.context!)
            ? MyColors.black
            : MyColors.light,
        middleText: "Are you sure you want to log out?",
        onConfirm: () async {
          await _auth.signOut();
          await GoogleSignIn().signOut();

          Get.offAll(() => const Login());
          deviceStorage.write(MyTexts.rememberMeEmail, null);
          deviceStorage.write(MyTexts.rememberMePassword, null);
        },
        onCancel: () => Navigator.of(Get.overlayContext!).pop(),
      );
    } on FirebaseAuthException catch (e) {
      throw MyFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw MyFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const MyFormatException().message;
    } on PlatformException catch (e) {
      throw MyPlatformException(e.code).message;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<void> reAuthenticateWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      AuthCredential credential = EmailAuthProvider.credential(
        email: email,
        password: password,
      );
      await _auth.currentUser!.reauthenticateWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      throw MyFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw MyFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const MyFormatException().message;
    } on PlatformException catch (e) {
      throw MyPlatformException(e.code).message;
    } catch (e) {
      throw e.toString();
    }
  }
}
