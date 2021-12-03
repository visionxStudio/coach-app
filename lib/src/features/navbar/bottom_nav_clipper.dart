import 'package:flutter/material.dart';

///Bottom navigationbarpaint
class BottomNavigaionBarClipper extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(0, size.height * 0.2913081);
    path_0.cubicTo(
        size.width * 0.6340580,
        size.height * -0.04589988,
        size.width * 0.3961353,
        size.height * -0.1156706,
        size.width * 1.004831,
        size.height * 0.2913093);
    path_0.lineTo(size.width * 1.004831, size.height * 0.9947988);
    path_0.lineTo(size.width * 0.5024155, size.height * 0.9947988);
    path_0.lineTo(0, size.height * 0.9947988);
    path_0.lineTo(0, size.height * 0.2913081);
    path_0.close();

    Paint paintstroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0002415459;
    paintstroke.color = Colors.black.withOpacity(1.0);
    canvas.drawPath(path_0, paintstroke);

    Paint paintfill = Paint()..style = PaintingStyle.fill;
    paintfill.color = Colors.white.withOpacity(1.0);
    canvas.drawPath(path_0, paintfill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
