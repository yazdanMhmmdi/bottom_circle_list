import 'package:flutter/cupertino.dart';

class InnerCircleShadowClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    final double _xScaling = size.width / 86;
    final double _yScaling = size.height / 43.4;
    path.lineTo(86 * _xScaling, 42.9833 * _yScaling);
    path.cubicTo(
      86 * _xScaling,
      43.1224 * _yScaling,
      85.9993 * _xScaling,
      43.2613 * _yScaling,
      85.998 * _xScaling,
      43.4 * _yScaling,
    );
    path.cubicTo(
      85.998 * _xScaling,
      43.4 * _yScaling,
      0.0019787 * _xScaling,
      43.4 * _yScaling,
      0.0019787 * _xScaling,
      43.4 * _yScaling,
    );
    path.cubicTo(
      0.000660554 * _xScaling,
      43.2613 * _yScaling,
      0 * _xScaling,
      43.1224 * _yScaling,
      0 * _xScaling,
      42.9833 * _yScaling,
    );
    path.cubicTo(
      0 * _xScaling,
      19.2443 * _yScaling,
      19.2518 * _xScaling,
      0 * _yScaling,
      43 * _xScaling,
      0 * _yScaling,
    );
    path.cubicTo(
      66.7482 * _xScaling,
      0 * _yScaling,
      86 * _xScaling,
      19.2443 * _yScaling,
      86 * _xScaling,
      42.9833 * _yScaling,
    );
    path.cubicTo(
      86 * _xScaling,
      42.9833 * _yScaling,
      86 * _xScaling,
      42.9833 * _yScaling,
      86 * _xScaling,
      42.9833 * _yScaling,
    );
    path.lineTo(84 * _xScaling, 43 * _yScaling);
    path.cubicTo(
      84 * _xScaling,
      43.1326 * _yScaling,
      83.9994 * _xScaling,
      43.2651 * _yScaling,
      83.9981 * _xScaling,
      43.3975 * _yScaling,
    );
    path.cubicTo(
      83.9981 * _xScaling,
      43.3975 * _yScaling,
      2.00189 * _xScaling,
      43.3975 * _yScaling,
      2.00189 * _xScaling,
      43.3975 * _yScaling,
    );
    path.cubicTo(
      2.00063 * _xScaling,
      43.2651 * _yScaling,
      2 * _xScaling,
      43.1326 * _yScaling,
      2 * _xScaling,
      43 * _yScaling,
    );
    path.cubicTo(
      2 * _xScaling,
      20.3563 * _yScaling,
      20.3563 * _xScaling,
      2 * _yScaling,
      43 * _xScaling,
      2 * _yScaling,
    );
    path.cubicTo(
      65.6437 * _xScaling,
      2 * _yScaling,
      84 * _xScaling,
      20.3563 * _yScaling,
      84 * _xScaling,
      43 * _yScaling,
    );
    path.cubicTo(
      84 * _xScaling,
      43 * _yScaling,
      84 * _xScaling,
      43 * _yScaling,
      84 * _xScaling,
      43 * _yScaling,
    );
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
