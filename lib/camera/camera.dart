import 'dart:developer';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:get/get.dart';
import 'package:google_mlkit_object_detection/google_mlkit_object_detection.dart';
import 'package:tflite/ImageTake/Image.dart';

import '../google_detect_object.dart';

class CameraX extends GetxController {
  CameraController? cameraController;
  List<CameraDescription>? cameras;

  ObjectDetector? googleDetect;
  dynamic img;

  RxBool khongCoOto = false.obs;

  @override
  // ignore: unnecessary_overrides
  void onInit() async {
    super.onInit();
  }

  @override
  void onReady() async {
    super.onReady();

    await initCamera();
  }

  @override
  void onClose() {
    super.onClose();

    cameraController!.dispose();
  }

  initCamera() async {
    cameras = await availableCameras();
    cameraController = CameraController(
      cameras![0],
      ResolutionPreset.high,
      enableAudio: false,
    );
    await cameraController!.initialize();

    await cameraController!.lockCaptureOrientation();

    update();
  }

  Future<String> takePicture() async {
    img = await cameraController!.takePicture();
    return img.path;
  }

  onclick(String path) async {
    googleDetect ??= await GoogleDetectObject().getModel();
    var _data = await GoogleDetectObject().process(path, googleDetect!);
    if (_data.contains('Car') ||
        _data.contains('Bus') ||
        _data.contains('Truck')) {
      Get.to(() => ImageTake(), arguments: path);
    } else {
      khongCoOto.value = true;
      Future.delayed(const Duration(seconds: 2))
          .then((_) => khongCoOto.value = false);
    }
  }

  onClickBack() {
    Get.back();
  }
}
