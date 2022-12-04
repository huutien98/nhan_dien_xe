import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tflite/camera/camera.dart';
import 'package:tflite/constant_assets.dart';

import '../app_theme.dart';

class Camera extends GetView<CameraX> {
  Camera({Key? key}) : super(key: key);

  CameraX cameraX = Get.put(CameraX());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: Stack(
          children: [
            cameraLayer(context),
            cameraX.khongCoOto.value
                ? Positioned(
                    top: 100,
                    right: 50,
                    child: RotatedBox(
                      quarterTurns: 1,
                      child: Container(
                        margin: const EdgeInsets.only(right: 100),
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 16),
                        decoration: AppTheme.boxDecoration.copyWith(
                            border: Border.all(color: AppTheme.colorRed500)),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SvgPicture.asset(
                              AssetsSvg.warning1,
                              color: AppTheme.colorRed500,
                            ),
                            const SizedBox(width: 8),
                            const Text("Không nhận dạng được xe ô tô"),
                          ],
                        ),
                      ),
                    ),
                  )
                : SizedBox(),
            Positioned(
              bottom: 0,
              child: mBottomBar(),
            )
          ],
        ),
      ),
    );
  }

  Widget cameraLayer(context) {
    final _deviceRatio = Get.width / Get.height;
    return GetBuilder<CameraX>(
      builder: (_) => controller.cameraController != null
          ? Center(
              child: Transform.scale(
                scale: (9 / 16) / _deviceRatio,
                child: AspectRatio(
                  aspectRatio: 9 / 16,
                  child: CameraPreview(controller.cameraController!),
                ),
              ),
            )
          : const SizedBox(),
    );
  }

  Widget mBottomBar() {
    return SizedBox(
      width: Get.width,
      child: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                child: Container(
                  height: 66,
                  width: 66,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(33),
                    color: Colors.blue,
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(33),
                      color: Colors.black,
                    ),
                    child: SvgPicture.asset(
                      AssetsSvg.camera1,
                      color: Colors.white,
                    ),
                  ),
                ),
                onTap: () async {
                  String _path = await controller.takePicture();
                  if (_path != null) {
                    controller.onclick(_path);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
