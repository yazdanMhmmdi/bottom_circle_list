import 'dart:math';
import 'dart:ui';
import 'package:circular_list_view/bottom_circle_list.dart';
import 'package:circular_list_view/constants/assets.dart';
import 'package:circular_list_view/constants/i_colors.dart';
import 'package:circular_list_view/constants/my_icons.dart';
import 'package:circular_list_view/shapes/border_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FirstPage extends StatefulWidget {
  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: IColors.backgroundColor,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              color: Colors.orange,
              child: Container(
                width: 200,
                height: 100,
                child: CustomPaint(
                  painter: BorderPainter(),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomCircleList(
        centerButtonColor: IColors.blue,
        indicatorColor: IColors.lightBlue,
        selectedIconColor: IColors.blue,
        centerButtonSplashColor: Colors.black12,
        handleIndexChanged: (value) {
          print("index:: ${value}");
        },
        onSubmitTap: () {
          print("do somthing");
        },
        centerButtonText: const Text("تایید",
            style: TextStyle(
              fontFamily: Assets.iranSans,
              color: Colors.white70,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.center),
        icons: const [
          MyIcons.tow_truck_svgrepo_com,
          MyIcons.car_svgrepo_com,
          MyIcons.truck_svgrepo_com,
        ],
        textChilds: const [
          Text(
            "سنگین",
            style: TextStyle(
              fontSize: 14,
              fontFamily: Assets.iranSans,
            ),
          ),
          Text(
            "سواری",
            style: TextStyle(
              fontSize: 14,
              fontFamily: Assets.iranSans,
            ),
          ),
          Text(
            "نیمه سنگین",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              height: 1.2,
              fontFamily: Assets.iranSans,
            ),
          )
        ],
      ),
    );
  }
}
