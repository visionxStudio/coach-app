import 'package:flutter/material.dart';

class CourseCustomCurve extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0;

    Path path0 = Path();
    path0.moveTo(size.width * 0.9050000, size.height * 0.4360000);
    path0.cubicTo(
        size.width * 0.8926900,
        size.height * 0.4811000,
        size.width * 0.8920100,
        size.height * 0.5103400,
        size.width * 0.9050000,
        size.height * 0.5640000);
    path0.quadraticBezierTo(size.width * 0.9287500, size.height * 0.5635000,
        size.width, size.height * 0.5646400);
    path0.lineTo(size.width, size.height * 0.4349200);
    path0.quadraticBezierTo(size.width * 0.9784500, size.height * 0.4353000,
        size.width * 0.9050000, size.height * 0.4360000);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
