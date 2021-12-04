import 'package:flutter/material.dart';

class OutCircleClipper extends CustomClipper<Path> {
  @override
  bool shouldReclip(oldClipper) => false;

  @override
  Path getClip(Size size) {
    Path path = Path();
    final double _xScaling = size.width / 80;
    final double _yScaling = size.height / 40.4;
    path.lineTo(79.9981 * _xScaling, 40.3975 * _yScaling);
    path.cubicTo(
      79.9994 * _xScaling,
      40.2651 * _yScaling,
      80 * _xScaling,
      40.1326 * _yScaling,
      80 * _xScaling,
      40 * _yScaling,
    );
    path.cubicTo(
      80 * _xScaling,
      17.9086 * _yScaling,
      62.0914 * _xScaling,
      0 * _yScaling,
      40 * _xScaling,
      0 * _yScaling,
    );
    path.cubicTo(
      17.9086 * _xScaling,
      0 * _yScaling,
      0 * _xScaling,
      17.9086 * _yScaling,
      0 * _xScaling,
      40 * _yScaling,
    );
    path.cubicTo(
      0 * _xScaling,
      40.1326 * _yScaling,
      0.00064559 * _xScaling,
      40.2651 * _yScaling,
      0.0019338 * _xScaling,
      40.3975 * _yScaling,
    );
    path.cubicTo(
      0.0019338 * _xScaling,
      40.3975 * _yScaling,
      79.9981 * _xScaling,
      40.3975 * _yScaling,
      79.9981 * _xScaling,
      40.3975 * _yScaling,
    );
    path.cubicTo(
      79.9981 * _xScaling,
      40.3975 * _yScaling,
      79.9981 * _xScaling,
      40.3975 * _yScaling,
      79.9981 * _xScaling,
      40.3975 * _yScaling,
    );
    return path;
  }
}
