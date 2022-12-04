import 'dart:developer';
import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImageTakeController extends GetxController {
  RxString path = ''.obs;
  RxString scannedText = ''.obs;

  @override
  void onInit() {
    super.onInit();
    path.value = Get.arguments;
  }

  @override
  void onReady() {
    super.onReady();
  }

  void delete() async {
    await File(path.value).delete();
  }

  void PhotoViewGallery() async {
    try {
      final pickedImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedImage != null) {
        path.value = pickedImage.path;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
