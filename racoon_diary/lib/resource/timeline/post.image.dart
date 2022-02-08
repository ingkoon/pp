import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ImageUploader {
  final ImagePicker _picker = ImagePicker();
  XFile? _pickedImg;

  Future<void> _pickImg() async {
    final XFile? imageData = await _picker.pickImage(source: ImageSource.gallery);
    if (imageData != null) {
      _pickedImg = imageData;
    }
  }
}
