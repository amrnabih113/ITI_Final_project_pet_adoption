import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pet_adoption/core/utils/exceptions/firebase_exceptions.dart';
import 'package:pet_adoption/core/utils/exceptions/format_exceptions.dart';
import 'package:pet_adoption/core/utils/exceptions/platform_exceptions.dart';
import 'package:pet_adoption/core/utils/exceptions/socket_exceptioins.dart';
import 'package:pet_adoption/models/category_model.dart';

class CategoryService extends GetxController {
  static CategoryService get instance => Get.find();

  Future<List<CategoryModel>> loadCategories() async {
    try {
      final result = await FirebaseFirestore.instance
          .collection('categories')
          .get();
      return result.docs.map((e) => CategoryModel.fromJson(e.data())).toList();
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
