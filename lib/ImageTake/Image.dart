import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tflite/ImageTake/ImageTakeController.dart';

class ImageTake extends GetView<ImageTakeController> {
  ImageTake({Key? key}) : super(key: key);

  final ImageTakeController imageTakeController =
      Get.put(ImageTakeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(
        () => Scaffold(
          body: Column(
            children: [
              Container(
                width: Get.width,
                height: Get.height / 3,
                margin: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: FileImage(
                      File(imageTakeController.path.value),
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Text(imageTakeController.scannedText.value.toString()),
              ElevatedButton(
                onPressed: () => imageTakeController.delete(),
                child: const Text("take"),
              ),
              ElevatedButton(
                onPressed: () => imageTakeController.PhotoViewGallery(),
                child: const Text("Gallery"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
