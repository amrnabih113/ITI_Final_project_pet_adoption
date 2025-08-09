import 'dart:io';
import 'package:supabase_flutter/supabase_flutter.dart';

class StorageService {
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
}
