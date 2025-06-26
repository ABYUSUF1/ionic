import 'dart:typed_data';
import 'package:ionic/core/utils/mixin/auth_guard_mixin.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseStorageService with AuthGuardMixin {
  final supabaseStorage = Supabase.instance.client.storage;

  Future<String?> uploadImage({
    required Uint8List imageBytes,
    required String imageName,
    required String bucketName,
  }) async {
    final String filePath = '$userId/$imageName';

    try {
      await supabaseStorage
          .from(bucketName)
          .uploadBinary(
            filePath,
            imageBytes,
            fileOptions: const FileOptions(upsert: true),
          );
      return getProfileImageUrl(filePath, bucketName);
    } catch (e) {
      throw 'Failed to upload image: $e';
    }
  }

  String getProfileImageUrl(String filePath, String bucketName) {
    return supabaseStorage.from(bucketName).getPublicUrl(filePath);
  }
}
