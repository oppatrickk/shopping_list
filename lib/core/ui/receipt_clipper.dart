import 'package:flutter/material.dart';

class ReceiptClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    const double triangleSize = 12;
    final Path path = Path();

    path.moveTo(0, 0);

    double x = 0;
    while (x < size.width) {
      path.lineTo(x + triangleSize / 2, triangleSize);
      path.lineTo(x + triangleSize, 0);
      x += triangleSize;
    }

    path.lineTo(size.width, size.height);

    double bx = size.width;
    while (bx > 0) {
      path.lineTo(bx - triangleSize / 2, size.height - triangleSize);
      path.lineTo(bx - triangleSize, size.height);
      bx -= triangleSize;
    }

    path.lineTo(0, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
