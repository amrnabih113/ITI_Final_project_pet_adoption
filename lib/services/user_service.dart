import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pet_adoption/core/utils/exceptions/format_exceptions.dart';
import 'package:pet_adoption/core/utils/exceptions/platform_exceptions.dart';
import 'package:pet_adoption/core/utils/exceptions/socket_exceptioins.dart';
import 'package:pet_adoption/models/user_model.dart';
import 'package:pet_adoption/core/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:pet_adoption/core/utils/exceptions/firebase_exceptions.dart';

class UserService extends GetxController {
  static UserService get instance => Get.find();

  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  Rx<User?> get user => _auth.currentUser.obs;

  /// Save user record (create or update if not exists)
  Future<void> saveUserRecord(UserModel userModel) async {
    try {
      final docRef = _firestore.collection('users').doc(userModel.id);
      final doc = await docRef.get();

      if (!doc.exists) {
        await docRef.set(userModel.toJson());
      } else {
        await docRef.update(userModel.toJson());
      }
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

  /// Fetch current logged-in user details
  Future<UserModel> fetchUserDetails() async {
    try {
      if (user == null) throw "No user logged in.";
      final doc = await _firestore
          .collection('users')
          .doc(user.value!.uid)
          .get();

      if (doc.exists) {
        return UserModel.fromJson(doc.data()!);
      } else {
        return UserModel.empty();
      }
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

  /// Delete user record
  Future<void> deleteUserRecord(String userId) async {
    try {
      await _firestore.collection('users').doc(userId).delete();
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

  /// Update single field in current user document
  Future<void> updateSingleField(Map<String, dynamic> json) async {
    try {
      if (user == null) throw "No user logged in.";
      await _firestore.collection('users').doc(user.value!.uid).update(json);
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

  Future<UserModel> getUserById(String userId) async {
    try {
      final doc = await _firestore.collection('users').doc(userId).get();

      if (doc.exists) {
        return UserModel.fromJson(doc.data()!);
      } else {
        return UserModel.empty();
      }
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
