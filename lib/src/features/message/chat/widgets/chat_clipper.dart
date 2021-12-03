import 'package:flutter/material.dart';

class ChatClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    double factor = 10.0;
    path.lineTo(0, size.height);
    path.lineTo(factor, size.height - factor);
    path.lineTo(size.width - factor, size.height - factor);
    path.quadraticBezierTo(size.width, size.height - factor, size.width,
        size.height - (factor * 2));
    path.lineTo(size.width, factor);
    path.quadraticBezierTo(size.width, 0, size.width - factor, 0);
    path.lineTo(factor, 0);
    path.quadraticBezierTo(0, 0, 0, factor);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) => true;
}
