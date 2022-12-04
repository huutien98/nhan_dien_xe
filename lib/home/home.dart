import 'dart:developer';

import 'package:camera/camera.dart';
import 'package:get/get.dart';
import 'package:tflite/camera/camera_view.dart';

class MyHomeController extends GetxController {
  CameraController? cameraController;

  clickToPhoto() {
    Get.to(() => Camera());
  }
}
