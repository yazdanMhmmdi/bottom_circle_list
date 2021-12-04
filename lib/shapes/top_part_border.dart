import 'package:circular_list_view/constants/i_colors.dart';
import 'package:flutter/material.dart';

class TopPartBorder extends OutlinedBorder {
  const TopPartBorder({BorderSide side = BorderSide.none})
      : assert(side != null),
        super(side: side);

  Path customBorderPath(Rect rect) {
    Path path = Path();
    final double _xScaling = rect.width / 99.38;
    final double _yScaling = rect.height / 86.61;
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
  ShapeBorder scale(double t) => TopPartBorder(side: side.scale(t));

  @override
  OutlinedBorder copyWith({BorderSide? side}) {
    return TopPartBorder(side: side ?? this.side);
  }

  EdgeInsetsGeometry get dimensions => EdgeInsets.all(0);

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return customBorderPath(rect);
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    return customBorderPath(rect);
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    switch (side.style) {
      case BorderStyle.none:
        canvas.drawPath(
            customBorderPath(rect),
            Paint()
              ..style = PaintingStyle.stroke
              ..color = IColors.white
              ..strokeWidth = 2.0);
        break;
      case BorderStyle.solid:
    }
  }
}

class BuyTicketButtonPainter extends CustomPainter {
  final BuildContext context;

  BuyTicketButtonPainter(this.context);

  @override
  void paint(Canvas canvas, Size size) {
    var _paint = Paint()
      ..style = PaintingStyle.fill
      ..color = Theme.of(context).colorScheme.secondary.withOpacity(0.7)
      ..strokeWidth = 1.0;
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
    canvas.drawPath(path, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
