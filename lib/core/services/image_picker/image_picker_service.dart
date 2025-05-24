import 'dart:io';
import 'package:image_picker/image_picker.dart';

class ImagePickerService {
  final ImagePicker _picker = ImagePicker();

  Future<File?> pickImage({required ImageSource source}) async {
    try {
      final XFile? image = await _picker.pickImage(source: source);
      return image != null ? File(image.path) : null;
    } catch (e) {
      throw Exception('Image picker error: ${e.toString()}');
    }
  }
}
