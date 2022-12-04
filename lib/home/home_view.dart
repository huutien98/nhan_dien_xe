import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tflite/home/home.dart';

class MyHomeView extends GetView {
  final MyHomeController c = Get.put(MyHomeController());

  MyHomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Positioned(
              child: ElevatedButton(
                onPressed: () {
                  c.clickToPhoto();
                },
                child: Text("click"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
