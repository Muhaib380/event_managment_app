import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:event_managment_app/infrastructure/services/cloudnary.dart';

class ImagePickerService {
  final ImagePicker _picker = ImagePicker();
  final CloudinaryService _cloudinaryService = CloudinaryService();

  /// Pick and upload image from gallery
  Future<String?> pickAndUploadImage() async {
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      final File imageFile = File(pickedFile.path);
      return await _cloudinaryService.uploadImage(imageFile);
    }
    return null;
  }

  /// Pick image from gallery
  Future<File?> pickFromGallery() async {
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      return File(pickedFile.path);
    }
    return null;
  }

  /// Pick image from camera
  Future<File?> pickFromCamera() async {
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.camera,
    );
    if (pickedFile != null) {
      return File(pickedFile.path);
    }
    return null;
  }
}
