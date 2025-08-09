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
import 'package:pet_adoption/models/pets_model.dart';

class PetService extends GetxController {
  static PetService get instance => Get.find();

  final petsCollection = FirebaseFirestore.instance.collection('pets');

  Future<void> addPet(PetsModel pet) async {
    try {
      await petsCollection.doc(pet.id).set(pet.toJson());
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

  Future<List<PetsModel>> getPets() async {
    try {
      final result = await petsCollection.get();
      return result.docs.map((e) => PetsModel.fromJson(e.data())).toList();
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

  Future<List<PetsModel>> getFavouratePets(List<String> petsIds) async {
    try {
      final result = await petsCollection.where('id', whereIn: petsIds).get();
      return result.docs.map((e) => PetsModel.fromJson(e.data())).toList();
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

  Future<void> updatePet(PetsModel pet) async {
    try {
      await petsCollection.doc(pet.id).update(pet.toJson());
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

  Future<void> deletePet(String petId) async {
    try {
      await petsCollection.doc(petId).delete();
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

  Future<PetsModel> getPetById(String petId) async {
    try {
      final result = await petsCollection.doc(petId).get();
      return PetsModel.fromJson(result.data()!);
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

  Future<List<PetsModel>> getPetsByCategory(String category) async {
    try {
      final result = await petsCollection
          .where('category', isEqualTo: category)
          .get();
      return result.docs.map((e) => PetsModel.fromJson(e.data())).toList();
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
