import 'package:flutter/material.dart';

class TopPartClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    final double _xScaling = size.width / 99.38;
    final double _yScaling = size.height / 86.61;
    path.lineTo(0 * _xScaling, 86.6063 * _yScaling);
    path.cubicTo(
      0 * _xScaling,
      86.6063 * _yScaling,
      49.3695 * _xScaling,
      0 * _yScaling,
      49.3695 * _xScaling,
      0 * _yScaling,
    );
    path.cubicTo(
      64.5638 * _xScaling,
      8.7709 * _yScaling,
      77.1835 * _xScaling,
      21.3851 * _yScaling,
      85.9612 * _xScaling,
      36.5763 * _yScaling,
    );
    path.cubicTo(
      94.7492 * _xScaling,
      51.7854 * _yScaling,
      99.376 * _xScaling,
      69.0409 * _yScaling,
      99.376 * _xScaling,
      86.6063 * _yScaling,
    );
    path.cubicTo(
      99.376 * _xScaling,
      86.6063 * _yScaling,
      0 * _xScaling,
      86.6063 * _yScaling,
      0 * _xScaling,
      86.6063 * _yScaling,
    );
    path.cubicTo(
      0 * _xScaling,
      86.6063 * _yScaling,
      0 * _xScaling,
      86.6063 * _yScaling,
      0 * _xScaling,
      86.6063 * _yScaling,
    );
    return path;
  }

  @override
  bool shouldReclip(oldClipper) => false;
}
