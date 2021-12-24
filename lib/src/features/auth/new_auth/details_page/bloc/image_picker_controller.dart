import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

final imagePickerControllerNotifier =
    ChangeNotifierProvider.autoDispose<ImagePickerController>(
  (_) => ImagePickerController(),
);

class ImagePickerController extends ChangeNotifier {
  File? imageFile;

  Future pickImage({required ImageSource imageSource}) async {
    try {
      final image = await ImagePicker().pickImage(source: imageSource);
      if (image == null) {
        return;
      }
      imageFile = File(image.path);
      notifyListeners();
    } on PlatformException catch (e) {
      debugPrint("Failed to pick image: $e");
    }
  }
}
