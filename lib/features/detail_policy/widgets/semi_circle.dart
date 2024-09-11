import 'package:flutter/material.dart';

class SemiCircleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    // calculate radius and center points for semi-circles
    final radius = size.width * 0.5;
    final centerTop = Offset(size.width * 0.5, size.height * 0.2);
    final centerBottom = Offset(size.width * 0.5, size.height * 0.8);

    // create top semi-circle
    path.addArc(
      Rect.fromCircle(center: centerTop, radius: radius),
      0,
      -3.1415,
    );

    // create bottom semi-circle
    path.addArc(
      Rect.fromCircle(center: centerBottom, radius: radius),
      0,
      3.1415,
    );

    // close the path
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}