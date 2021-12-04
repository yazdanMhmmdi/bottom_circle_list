import 'package:circular_list_view/constants/i_colors.dart';
import 'package:circular_list_view/enums/part_directions.dart';
import 'package:flutter/material.dart';

class AnimatedTextWidget extends StatelessWidget {
  late PartDirection currentDirection;
  late Widget textChild;
  late double transformRadian;
  late EdgeInsets padding;
  late List<PartDirection?> directions;
  late Alignment alignment;
  late Duration animationDuration;
  late Color? selectedTextColor;
  late Color? unselectedTextColor;

  AnimatedTextWidget({
    required this.currentDirection,
    required this.textChild,
    required this.transformRadian,
    required this.padding,
    required this.directions,
    required this.alignment,
    required this.animationDuration,
    required this.selectedTextColor,
    required this.unselectedTextColor,
  });
  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Wrap(
        children: [
          Padding(
            padding: padding,
            child: AnimatedDefaultTextStyle(
                style: TextStyle(
                  color: currentDirection == directions[0] ||
                          currentDirection == directions[1]
                      ? selectedTextColor
                      : unselectedTextColor,
                  fontWeight: currentDirection == directions[0] ||
                          currentDirection == directions[1]
                      ? FontWeight.bold
                      : FontWeight.normal,
                ),
                duration: animationDuration,
                curve: Curves.ease,
                child: textChild),
          ),
        ],
      ),
    );
  }
}
