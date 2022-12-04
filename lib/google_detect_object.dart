import 'dart:io';

import 'package:flutter/services.dart';
import 'package:google_mlkit_object_detection/google_mlkit_object_detection.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

import '../constant_assets.dart';

class GoogleDetectObject {
  Future process(String path, ObjectDetector objectDetector) async {
    final inputImage = InputImage.fromFilePath(path);

    final objects = await objectDetector.processImage(inputImage);

    List<String> _listA = [];
    for (final object in objects) {
      for (final label in object.labels) {
        if (label.confidence >= 0.5) {
          _listA.add(label.text);
        }
      }
    }

    return _listA;
  }

  Future<ObjectDetector> getModel() async {
    String _modelPath = '';
    const assetPath = AssetsPath.mlModel;
    if (Platform.isAndroid) {
      _modelPath = 'flutter_assets/$assetPath';
    } else {
      final path =
          '${(await getApplicationSupportDirectory()).path}/$assetPath';
      await Directory(dirname(path)).create(recursive: true);
      final file = File(path);
      if (!await file.exists()) {
        final byteData = await rootBundle.load(assetPath);
        await file.writeAsBytes(byteData.buffer
            .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
      }
      _modelPath = file.path;
    }
    final options = LocalObjectDetectorOptions(
      mode: DetectionMode.single,
      modelPath: _modelPath,
      classifyObjects: true,
      multipleObjects: true,
    );
    ObjectDetector _objectDetector = ObjectDetector(options: options);
    return _objectDetector;
  }
}
