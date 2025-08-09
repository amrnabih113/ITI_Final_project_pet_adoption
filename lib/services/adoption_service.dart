import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pet_adoption/core/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:pet_adoption/core/utils/exceptions/firebase_exceptions.dart';
import 'package:pet_adoption/core/utils/exceptions/format_exceptions.dart';
import 'package:pet_adoption/core/utils/exceptions/platform_exceptions.dart';
import 'package:pet_adoption/core/utils/exceptions/socket_exceptioins.dart';
import 'package:pet_adoption/models/adoption_requist.dart';

class AdoptionService extends GetxController {
  static AdoptionService get instance => Get.find();

  final adoptionRequist = FirebaseFirestore.instance.collection(
    "adoptionRequist",
  );

  Future<void> addAdoptionRequest(AdoptionRequist adoption) async {
    try {
      await adoptionRequist.add(adoption.toJson());
    } on FirebaseAuthException catch (e) {
      throw MyFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw MyFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const MyFormatException().message;
    } on PlatformException catch (e) {
      throw MyPlatformException(e.code).message;
    } on SocketException catch (e) {
      throw MySocketExceptions(e.message);
    } catch (e) {
      throw e.toString();
    }
  }

  Future<List<AdoptionRequist>> getAdoptionRequistForUser(String userId) async {
    try {
      final result = await adoptionRequist
          .where('userId', isEqualTo: userId)
          .get();
      return result.docs
          .map((e) => AdoptionRequist.fromJson(e.data()))
          .toList();
    } on FirebaseAuthException catch (e) {
      throw MyFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw MyFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const MyFormatException().message;
    } on PlatformException catch (e) {
      throw MyPlatformException(e.code).message;
    } on SocketException catch (e) {
      throw MySocketExceptions(e.message);
    } catch (e) {
      throw e.toString();
    }
  }
}
