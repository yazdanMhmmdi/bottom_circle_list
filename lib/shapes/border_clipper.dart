import 'package:flutter/material.dart';

class BorderClipper extends CustomClipper<Path> {
  @override
  bool shouldReclip(oldClipper) => false;

  @override
  Path getClip(Size size) {
    Path path = Path();
    final double _xScaling = size.width / 200;
    final double _yScaling = size.height / 100;
    path.lineTo(0.000757929 * _xScaling, 100 * _yScaling);
    path.cubicTo(
      0.000252797 * _xScaling,
      99.8694 * _yScaling,
      0 * _xScaling,
      99.7387 * _yScaling,
      0 * _xScaling,
      99.608 * _yScaling,
    );
    path.cubicTo(
      0 * _xScaling,
      44.596 * _yScaling,
      44.7715 * _xScaling,
      0 * _yScaling,
      100 * _xScaling,
      0 * _yScaling,
    );
    path.cubicTo(
      155.228 * _xScaling,
      0 * _yScaling,
      200 * _xScaling,
      44.596 * _yScaling,
      200 * _xScaling,
      99.608 * _yScaling,
    );
    path.cubicTo(
      200 * _xScaling,
      99.7387 * _yScaling,
      200 * _xScaling,
      99.8694 * _yScaling,
      199.999 * _xScaling,
      100 * _yScaling,
    );
    path.cubicTo(
      199.999 * _xScaling,
      100 * _yScaling,
      199.009 * _xScaling,
      100 * _yScaling,
      199.009 * _xScaling,
      100 * _yScaling,
    );
    path.cubicTo(
      199.01 * _xScaling,
      99.8694 * _yScaling,
      199.01 * _xScaling,
      99.7387 * _yScaling,
      199.01 * _xScaling,
      99.608 * _yScaling,
    );
    path.cubicTo(
      199.01 * _xScaling,
      45.1407 * _yScaling,
      154.682 * _xScaling,
      0.986219 * _yScaling,
      100 * _xScaling,
      0.986219 * _yScaling,
    );
    path.cubicTo(
      45.3183 * _xScaling,
      0.986219 * _yScaling,
      0.990097 * _xScaling,
      45.1407 * _yScaling,
      0.990097 * _xScaling,
      99.608 * _yScaling,
    );
    path.cubicTo(
      0.990097 * _xScaling,
      99.7387 * _yScaling,
      0.990352 * _xScaling,
      99.8694 * _yScaling,
      0.990863 * _xScaling,
      100 * _yScaling,
    );
    path.cubicTo(
      0.990863 * _xScaling,
      100 * _yScaling,
      0.000757929 * _xScaling,
      100 * _yScaling,
      0.000757929 * _xScaling,
      100 * _yScaling,
    );
    path.cubicTo(
      0.000757929 * _xScaling,
      100 * _yScaling,
      0.000757929 * _xScaling,
      100 * _yScaling,
      0.000757929 * _xScaling,
      100 * _yScaling,
    );
    return path;
  }
}
