import 'package:circular_list_view/circle_list/radial_gesture_detector.dart';
import 'package:flutter/material.dart';

import 'circle_list/circle_list.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            Column(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.red,
                ),
              ],
            ),
          ],
        ),
        bottomNavigationBar: Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: CircleList(
              circleSize: 220,
              outerCircleColor: Colors.blue,
              innerCircleColor: Colors.red,
              // origin: Offset(0, -500),
              children: List.generate(
                6,
                (index) => Container(
                    width: 10,
                    color: Colors.yellow,
                    child: Text("c: ${index}")),
              ),
              onDragUpdate: (update) {
                Offset offset = Offset(update.point.dx , update.point.dy);
                print("update : x:${update}y: ${update.degree}");
                // if (offset.dx == 46.5 39.0)
              },
            ),
          ),
        ));
  }
}
