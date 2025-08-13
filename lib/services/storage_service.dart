import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class StorageService extends GetxController {
  static StorageService get instance => Get.find();

  final SupabaseClient _supabase = Supabase.instance.client;

  Future<String?> uploadFile({
    required String bucket,
    required String path,
    required File file,
  }) async {
    try {
      final fileName =
          '${DateTime.now().millisecondsSinceEpoch}_${file.uri.pathSegments.last}';

      final response = await _supabase.storage
          .from(bucket)
          .upload(
            '$path/$fileName',
            file,
            fileOptions: const FileOptions(cacheControl: '3600', upsert: false),
          );

      if (response.isEmpty) {
        throw Exception("File upload failed");
      }

      return _supabase.storage.from(bucket).getPublicUrl('$path/$fileName');
    } catch (e) {
      print("Upload error: $e");
      return null;
    }
  }

  /// Deletes a file from a given bucket
  Future<bool> deleteFile({
    required String bucket,
    required String path,
  }) async {
    try {
      final response = await _supabase.storage.from(bucket).remove([path]);
      return response.isEmpty;
    } catch (e) {
      print("Delete error: $e");
      return false;
    }
  }

  Future<String> uploadImage(String path, XFile image) async {
    try {
      final response = await Supabase.instance.client.storage
          .from('users')
          .list();
      final exists = response.any((file) {
        return file.name == path;
      });

      if (exists) {
        final publicUrl = Supabase.instance.client.storage
            .from('users')
            .getPublicUrl(path);
        return publicUrl;
      } else {
        await Supabase.instance.client.storage
            .from('users')
            .upload(path, File(image.path));
        final publicUrl = Supabase.instance.client.storage
            .from('users')
            .getPublicUrl(path);
        return publicUrl;
      }
    } on PostgrestException catch (e) {
      throw 'Error uploading image: ${e.message}';
    } on StorageException catch (e) {
      throw 'Storage error: ${e.message}';
    } catch (e) {
      throw "Error uploading image: $e";
    }
  }
}
