import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:ui' as ui;
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';

class LocalImageCreate {
  Future<String> takePicture(GlobalKey genKey) async {
    DateTime date = DateTime.now();
    String fileName = DateFormat('ddMMyyyyhhmmss').format(date);

    RenderRepaintBoundary boundary =
        genKey.currentContext?.findRenderObject() as RenderRepaintBoundary;
    ui.Image image = await boundary.toImage();
    final directory = (await getApplicationDocumentsDirectory()).path;
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    Uint8List pngBytes = byteData!.buffer.asUint8List();
    File imgFile = File('$directory/$fileName.png');
    await imgFile.writeAsBytes(pngBytes);

    return (imgFile.path.toString());
  }

  Future<void> deleteFile(File fileName) async {
    try {
      final file = fileName;

      await file.delete();
    } catch (e) {
      throw ("falha tentar excluir");
    }
  }
}
