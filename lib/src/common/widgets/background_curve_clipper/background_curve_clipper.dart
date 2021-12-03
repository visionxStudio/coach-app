import 'dart:ui' as ui;

import 'package:flutter/material.dart';

//Copy this CustomPainter code to the Bottom of the File
class CustomBackgroundCurveClipper extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.8588960, size.height * 0.2002572);
    path_0.cubicTo(
        size.width * 0.9334000,
        size.height * 0.4685128,
        size.width * 0.8130680,
        size.height * 0.7628342,
        size.width * 0.6039480,
        size.height * 0.8238342);
    path_0.lineTo(0, size.height);
    path_0.lineTo(0, 0);
    path_0.lineTo(size.width * 0.8032800, 0);
    path_0.lineTo(size.width * 0.8588960, size.height * 0.2002572);
    path_0.close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.shader = ui.Gradient.linear(
        ui.Offset(size.width * 0.5, size.height * 0.9),
        ui.Offset(size.width * 0.5, 0.0), [
      const Color(0xff10A9F3).withOpacity(1),
      const Color(0xff2F00FF).withOpacity(1),
      const Color(0xff2F00FF).withOpacity(0.56)
    ], [
      0.291667,
      0.614583,
      0.880208
    ]);
    canvas.drawPath(path_0, paint0Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
