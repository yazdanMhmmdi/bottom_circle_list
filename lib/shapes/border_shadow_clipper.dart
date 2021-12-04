import 'package:flutter/cupertino.dart';

class BorderShadowClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    final double _xScaling = size.width / 200;
    final double _yScaling = size.height / 100;
    path.lineTo(0 * _xScaling, 100 * _yScaling);
    path.cubicTo(
      0 * _xScaling,
      44.7715 * _yScaling,
      44.7715 * _xScaling,
      0 * _yScaling,
      100 * _xScaling,
      0 * _yScaling,
    );
    path.cubicTo(
      155.228 * _xScaling,
      0 * _yScaling,
      200 * _xScaling,
      44.7715 * _yScaling,
      200 * _xScaling,
      100 * _yScaling,
    );
    path.cubicTo(
      200 * _xScaling,
      100 * _yScaling,
      196 * _xScaling,
      100 * _yScaling,
      196 * _xScaling,
      100 * _yScaling,
    );
    path.cubicTo(
      196 * _xScaling,
      46.9807 * _yScaling,
      153.019 * _xScaling,
      4 * _yScaling,
      100 * _xScaling,
      4 * _yScaling,
    );
    path.cubicTo(
      46.9807 * _xScaling,
      4 * _yScaling,
      4 * _xScaling,
      46.9807 * _yScaling,
      4 * _xScaling,
      100 * _yScaling,
    );
    path.cubicTo(
      4 * _xScaling,
      100 * _yScaling,
      0 * _xScaling,
      100 * _yScaling,
      0 * _xScaling,
      100 * _yScaling,
    );
    path.cubicTo(
      0 * _xScaling,
      100 * _yScaling,
      0 * _xScaling,
      100 * _yScaling,
      0 * _xScaling,
      100 * _yScaling,
    );
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
