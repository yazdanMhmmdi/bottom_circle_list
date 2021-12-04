import 'package:flutter/material.dart';

class InnerCircleClipper extends CustomClipper<Path> {
  @override
  bool shouldReclip(oldClipper) => false;

  @override
  Path getClip(Size size) {
    Path path = Path();
    final double _xScaling = size.width / 82;
    final double _yScaling = size.height / 41.4;
    path.lineTo(81.9981 * _xScaling, 41.3975 * _yScaling);
    path.cubicTo(
      81.9994 * _xScaling,
      41.2651 * _yScaling,
      82 * _xScaling,
      41.1326 * _yScaling,
      82 * _xScaling,
      41 * _yScaling,
    );
    path.cubicTo(
      82 * _xScaling,
      18.3563 * _yScaling,
      63.6437 * _xScaling,
      0 * _yScaling,
      41 * _xScaling,
      0 * _yScaling,
    );
    path.cubicTo(
      18.3563 * _xScaling,
      0 * _yScaling,
      0 * _xScaling,
      18.3563 * _yScaling,
      0 * _xScaling,
      41 * _yScaling,
    );
    path.cubicTo(
      0 * _xScaling,
      41.1326 * _yScaling,
      0.000640869 * _xScaling,
      41.2651 * _yScaling,
      0.00189209 * _xScaling,
      41.3975 * _yScaling,
    );
    path.cubicTo(
      0.00189209 * _xScaling,
      41.3975 * _yScaling,
      81.9981 * _xScaling,
      41.3975 * _yScaling,
      81.9981 * _xScaling,
      41.3975 * _yScaling,
    );
    path.cubicTo(
      81.9981 * _xScaling,
      41.3975 * _yScaling,
      81.9981 * _xScaling,
      41.3975 * _yScaling,
      81.9981 * _xScaling,
      41.3975 * _yScaling,
    );
    return path;
  }
}
