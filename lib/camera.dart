import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyCameraController extends GetxController
    with GetTickerProviderStateMixin {
  CameraController? cameraController;
  List<CameraDescription>? cameras;

  late final AnimationController animateController = AnimationController(
    duration: const Duration(milliseconds: 500),
    vsync: this,
  );
  late final Animation<double> _animation = CurvedAnimation(
    parent: animateController,
    curve: Curves.easeInOutQuint,
  );

  late final AnimationController takePhotoController = AnimationController(
    duration: const Duration(milliseconds: 200),
    vsync: this,
  );
  late final Animation<double> _takePhoto = CurvedAnimation(
    parent: takePhotoController,
    curve: Curves.easeInOut,
  );

  late Animation<double> _animation1;
  late Animation<double> _animationTakePhoto;

  RxDouble animationValue = 0.0.obs;
  RxDouble takePhotoValue = 0.0.obs;

  RxBool isTakingPhoto = false.obs;

  RxBool khongCoOto = false.obs;

  @override
  // ignore: unnecessary_overrides
  void onInit() async {
    super.onInit();

    _animation1 = Tween<double>(begin: 1.0, end: 0.0).animate(_animation)
      ..addListener(() {
        animationValue.value = _animation1.value;
      });

    _animationTakePhoto =
        Tween<double>(begin: 1.0, end: -1.0).animate(_takePhoto)
          ..addListener(() {
            takePhotoValue.value = _animationTakePhoto.value;
          });
  }

  @override
  void onReady() async {
    super.onReady();

    initCamera();

    animateController.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        isTakingPhoto.value = false;
      }
    });

    takePhotoController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animateController.reset();
        animateController.forward();
      }
    });
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
    var _img = await cameraController!.takePicture();
    return _img.path;
  }

  onClickBack() {
    Get.back();
  }
}
