import 'package:flutter/material.dart';

class BackgroundClipper extends CustomClipper<Path> {
  @override
  bool shouldReclip(oldClipper) => false;

  @override
  Path getClip(Size size) {
    Path path = Path();
    final double _xScaling = size.width / 200;
    final double _yScaling = size.height / 100;
    path.lineTo(100.603 * _xScaling, 0.602539 * _yScaling);
    path.cubicTo(
      155.831 * _xScaling,
      0.602539 * _yScaling,
      200.603 * _xScaling,
      45.3741 * _yScaling,
      200.603 * _xScaling,
      100.603 * _yScaling,
    );
    path.cubicTo(
      200.603 * _xScaling,
      100.603 * _yScaling,
      0.602539 * _xScaling,
      100.603 * _yScaling,
      0.602539 * _xScaling,
      100.603 * _yScaling,
    );
    path.cubicTo(
      0.602539 * _xScaling,
      45.3741 * _yScaling,
      45.3741 * _xScaling,
      0.602539 * _yScaling,
      100.603 * _xScaling,
      0.602539 * _yScaling,
    );
    path.cubicTo(
      100.603 * _xScaling,
      0.602539 * _yScaling,
      100.603 * _xScaling,
      0.602539 * _yScaling,
      100.603 * _xScaling,
      0.602539 * _yScaling,
    );
    return path;
  }
}
