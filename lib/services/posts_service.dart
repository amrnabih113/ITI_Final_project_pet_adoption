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
import 'package:pet_adoption/models/post_model.dart';

class PostService extends GetxController{
  static PostService get instance => Get.find();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> createPost(Map<String, dynamic> postData) async {
    try {
      await _firestore.collection('posts').add(postData);
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

  Stream<List<PostModel>> getAllPosts({DocumentSnapshot? lastDoc}) {
    try {
      return _firestore
          .collection('posts')
          .orderBy('createdAt', descending: true)
          .limit(20)
          .snapshots()
          .map(
            (snapshot) => snapshot.docs
                .map((doc) => PostModel.fromJson(doc.data()))
                .toList(),
          );
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

  Future<void> updatePost(
    String postId,
    Map<String, dynamic> updatedData,
  ) async {
    try {
      await _firestore.collection('posts').doc(postId).update(updatedData);
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

  Future<void> deletePost(String postId) async {
    try {
      await _firestore.collection('posts').doc(postId).delete();
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

  Future<void> likePost(PostLike like) async {
    try {
      await _firestore.collection('posts').doc(like.postId).update({
        'likes': FieldValue.arrayUnion([like.toJson()]),
      });
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

  Future<void> unlikePost(PostLike like) async {
    try {
      await _firestore.collection('posts').doc(like.postId).update({
        'likes': FieldValue.arrayRemove([like.toJson()]),
      });
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

  Future<void> addComment(PostComment comment) async {
    try {
      await _firestore.collection('posts').doc(comment.postId).update({
        'comments': FieldValue.arrayUnion([comment.toJson()]),
      });
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

  Future<void> deleteComment(PostComment comment) async {
    try {
      await _firestore.collection('posts').doc(comment.postId).update({
        'comments': FieldValue.arrayRemove([comment.toJson()]),
      });
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

  Future<void> updateComment(
    PostComment oldComment,
    PostComment newComment,
  ) async {
    try {
      final ref = _firestore.collection('posts').doc(oldComment.postId);
      await _firestore.runTransaction((transaction) async {
        transaction.update(ref, {
          'comments': FieldValue.arrayRemove([oldComment.toJson()]),
        });
        transaction.update(ref, {
          'comments': FieldValue.arrayUnion([newComment.toJson()]),
        });
      });
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

  Future<List<PostComment>> getAllComments(String postId) async {
    try {
      final snapshot = await _firestore
          .collection('posts')
          .doc(postId)
          .collection('comments')
          .orderBy('createdAt', descending: true)
          .get();
      return snapshot.docs
          .map((doc) => PostComment.fromJson(doc.data()))
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

  Future<List<PostComment>> getReplies(String commentId) async {
    try {
      final snapshot = await _firestore
          .collection('posts')
          .doc(commentId)
          .collection('replies')
          .orderBy('createdAt', descending: true)
          .get();
      return snapshot.docs
          .map((doc) => PostComment.fromJson(doc.data()))
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

  Future<void> addReply(PostComment reply) async {
    try {
      await _firestore.collection('posts').doc(reply.postId).update({
        'replies': FieldValue.arrayUnion([reply.toJson()]),
      });
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
