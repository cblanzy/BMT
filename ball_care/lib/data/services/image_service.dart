import 'dart:convert';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:image_picker/image_picker.dart';
import 'dart:io' show File;

class ImageService {
  final ImagePicker _picker = ImagePicker();

  // Pick image from gallery
  Future<XFile?> pickImage() async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 800,
        maxHeight: 800,
        imageQuality: 85,
      );
      return image;
    } catch (e) {
      print('Error picking image: $e');
      return null;
    }
  }

  // Take photo with camera
  Future<XFile?> takePhoto() async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.camera,
        maxWidth: 800,
        maxHeight: 800,
        imageQuality: 85,
        preferredCameraDevice: CameraDevice.rear,
      );
      return image;
    } catch (e) {
      print('Error taking photo: $e');
      return null;
    }
  }

  // Process and save image based on platform
  // Returns: base64 string for web, file path for mobile
  Future<String?> processImage(XFile image) async {
    try {
      if (kIsWeb) {
        // Web: Convert to base64
        final bytes = await image.readAsBytes();
        final base64String = base64Encode(bytes);
        return base64String;
      } else {
        // Mobile: Return file path (in real app, would copy to app directory)
        return image.path;
      }
    } catch (e) {
      print('Error processing image: $e');
      return null;
    }
  }

  // Get display image widget data
  // Returns Uint8List for web (from base64), File for mobile
  dynamic getDisplayImage({String? path, String? base64Data}) {
    if (kIsWeb && base64Data != null && base64Data.isNotEmpty) {
      // Web: Decode base64 to bytes
      try {
        return base64Decode(base64Data);
      } catch (e) {
        print('Error decoding base64 image: $e');
        return null;
      }
    } else if (!kIsWeb && path != null && path.isNotEmpty) {
      // Mobile: Return File object
      return File(path);
    }
    return null;
  }
}
