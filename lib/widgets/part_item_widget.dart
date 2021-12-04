import 'package:circular_list_view/enums/part_directions.dart';
import 'package:flutter/material.dart';

class partItemWidget extends StatelessWidget  {
  late PartDirection currentDirection;
  late EdgeInsets padding;
  late Alignment alignment;
  late List<Widget> children;
  partItemWidget({
    required this.currentDirection,
    required this.padding,
    required this.alignment,
    required this.children,
  });
  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Padding(
        padding: padding, //const EdgeInsets.only(left: 20, bottom: 8),
        child: Align(
          alignment: alignment, //Alignment.bottomLeft,
          child: Container(
            color: Colors.transparent,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: children,
              
            ),
          ),
        ),
      ),
    );
  }
}
