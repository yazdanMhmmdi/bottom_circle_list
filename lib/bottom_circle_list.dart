import 'dart:math';
import 'package:circular_list_view/constants/i_colors.dart';
import 'package:circular_list_view/enums/part_directions.dart';
import 'package:circular_list_view/shapes/background_clipper.dart';
import 'package:circular_list_view/shapes/border_clipper.dart';
import 'package:circular_list_view/shapes/border_shadow_clipper.dart';
import 'package:circular_list_view/shapes/clip_shadow.dart';
import 'package:circular_list_view/shapes/inner_circle_clipper.dart';
import 'package:circular_list_view/shapes/inner_circle_shadow_clipper.dart';
import 'package:circular_list_view/shapes/out_circle_clipper.dart';
import 'package:circular_list_view/shapes/top_part_border.dart';
import 'package:circular_list_view/shapes/top_part_clipper.dart';
import 'package:circular_list_view/widgets/animated_text_widget.dart';
import 'package:circular_list_view/widgets/part_item_widget.dart';
import 'package:flutter/material.dart';

class BottomCircleList extends StatefulWidget {
  late Duration duration;
  List<IconData> icons;
  late List<Widget> textChilds;
  final Color? selectedIconColor;
  final Color? unselectedIconColor;
  final Color? unselectedTextColor;
  final Color? selectedTextColor;
  final Color? splashColor;
  final Color? centerButtonColor;
  final Color? indicatorColor;
  final Color? centerButtonSplashColor;
  final Curve curves;
  final Widget centerButtonText;

  BottomCircleList({
    this.icons = const [],
    required this.textChilds,
    this.duration = const Duration(milliseconds: 300),
    this.selectedIconColor = IColors.selectedIconColor,
    this.unselectedIconColor = IColors.unselectedIconColor,
    this.unselectedTextColor = IColors.unselectedTextColor,
    this.selectedTextColor = IColors.selectedTextColor,
    this.splashColor = IColors.splashColor,
    this.centerButtonColor = IColors.blue,
    this.indicatorColor = IColors.lightBlue,
    this.curves = Curves.ease,
    required this.centerButtonText,
    this.centerButtonSplashColor = IColors.splashColor,
  });

  @override
  _BottomCircleListState createState() => _BottomCircleListState();
}

class _BottomCircleListState extends State<BottomCircleList>
    with TickerProviderStateMixin {
  double partDegree = 60;
  PartDirection _currentDirection = PartDirection.top;
  PartDirection _lastDirection = PartDirection.top;

  late AnimationController _animationController;
  late var tweenRightAnimation;
  late var tweenLeftAnimation;
  late var tweenLongLeftAnimation;
  late var tweenLongRightAnimation;
  late var tweenFromRightToTopAnimation;
  late var tweenFromLeftToTopAnimation;

  late AnimationController _animationLeftController;
  late AnimationController _animationRightController;
  late AnimationController _animationLongRightController;
  late AnimationController _animationLongLeftController;
  late AnimationController _animationFromRightToTopController;
  late AnimationController _animationFromLeftToTopController;

  late Animation<double> tweenMainAnimation;

  @override
  void initState() {
    super.initState();
    initializeAnimationControllers();
    initializeAnimationTweens();
    tweenMainAnimation =
        tweenLeftAnimation; //add default tween animation to main tween animation
  }

  @override
  void dispose() {
    super.dispose();
    disposeAnimationControllers();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 100,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: 200,
              height: 100,
              child: Stack(
                children: [
                  backgroundShape(),
                  leftShape(),
                  topShape(),
                  rightShape(),
                  hoverShape(),
                  borderShape(),
                  innerCircleShape(),
                  outCircleShape(),
                  _leftPartChild(),
                  _topPartChild(),
                  _rightPartChild(),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Wrap(children: [
                      Container(
                        child: IgnorePointer(
                          child: Padding(
                              padding: const EdgeInsets.only(bottom: 8),
                              child: widget.centerButtonText),
                        ),
                      ),
                    ]),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget outCircleShape() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: ClipPath(
        clipper: OutCircleClipper(),
        child: Container(
            width: 80,
            height: 40.4,
            alignment: Alignment.center,
            decoration:
                BoxDecoration(color: widget.centerButtonColor, boxShadow: [
              BoxShadow(
                offset: Offset(0.0, 0.0),
                blurRadius: 4.0,
                color: Color(0xf000000).withOpacity(0.25),
              )
            ]),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                splashColor: widget.centerButtonSplashColor,
                onTap: () {},
              ),
            )),
      ),
    );
  }

  Widget innerCircleShape() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: ClipPath(
        clipper: InnerCircleClipper(),
        child: Container(
          width: 86,
          height: 43.4,
          color: Colors.transparent,
          child: ClipPath(
            clipper: InnerCircleClipper(),
            child: InkWell(
              onTap: () {},
              child: Container(
                width: 82,
                height: 41.4,
                alignment: Alignment.center,
                decoration: BoxDecoration(color: IColors.white, boxShadow: [
                  BoxShadow(
                      offset: Offset(0.0, 0.0),
                      blurRadius: 4.0,
                      color: IColors.shadowColor)
                ]),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget borderShape() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: ClipPath(
          clipper: BorderShadowClipper(),
          child: Container(
              color: Colors.transparent,
              width: 200,
              height: 100,
              child: ClipShadow(
                clipper: BorderClipper(),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 4,
                    color: IColors.shadowColor,
                    offset: Offset(1, 0),
                  )
                ],
                child: Container(
                  color: IColors.white,
                ),
              ))),
    );
  }

  Widget backgroundShape() {
    return ClipPath(
      clipper: BackgroundClipper(),
      child: Container(
          width: 200,
          height: 100,
          alignment: Alignment.center,
          color: IColors.white),
    );
  }

  Widget hoverShape() {
    return Align(
        alignment: Alignment.bottomRight,
        child: Transform.rotate(
          angle: tweenMainAnimation.value, // convert degree to radian
          alignment: Alignment.bottomLeft,
          child: ClipPath(
            clipper: TopPartClipper(),
            child: Container(
              width: 99.38,
              height: 86.61,
              alignment: Alignment.center,
              color: widget.indicatorColor,
            ),
          ),
        ));
  }

  Widget rightShape() {
    return Align(
        alignment: Alignment.bottomRight,
        child: Transform.rotate(
          angle: -(0 * (pi / 180)), // convert degree to radian
          alignment: Alignment.bottomLeft,
          child: Container(
            width: 99.38,
            height: 86.61,
            child: ClipPath(
              clipper: TopPartClipper(),
              child: Container(
                color: IColors.darkWhite,
                child: RawMaterialButton(
                  shape: TopPartBorder(side: BorderSide.none),
                  onPressed: () {},
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      splashColor: widget.splashColor,
                      onTap: () {
                        if (_currentDirection == PartDirection.left) {
                          setState(() {
                            _currentDirection = PartDirection.longRight;
                          });
                          tweenMainAnimation = tweenLongRightAnimation;
                          _animationLongRightController.forward();
                        } else if (_currentDirection ==
                            PartDirection.longLeft) {
                          setState(() {
                            _currentDirection = PartDirection.longRight;
                          });
                          tweenMainAnimation = tweenLongRightAnimation;
                          _resetAllAnimationControllers();
                          _animationLongRightController.forward();
                        } else {
                          setState(() {
                            _currentDirection = PartDirection.right;
                          });
                          tweenMainAnimation = tweenRightAnimation;

                          _animationRightController.forward();
                        }

                        setState(() {
                          partDegree = 0;
                        });
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
        ));
  }

  Widget leftShape() {
    return Align(
        alignment: Alignment.bottomRight,
        child: Transform.rotate(
          angle: -(120 * (pi / 180)), // convert degree to radian
          alignment: Alignment.bottomLeft,
          child: Container(
            color: Colors.transparent,
            child: ClipPath(
              clipper: TopPartClipper(),
              child: Container(
                width: 99.38,
                height: 86.61,
                alignment: Alignment.center,
                color: IColors.darkWhite,
                child: Stack(
                  children: [
                    RawMaterialButton(
                      shape: TopPartBorder(side: BorderSide.none),
                      onPressed: () {},
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          splashColor: widget.splashColor,
                          onTap: () {
                            // _animationController.reverse(from: 1.0);
                            if (_currentDirection == PartDirection.right) {
                              setState(() {
                                _currentDirection = PartDirection.longLeft;
                              });
                              tweenMainAnimation = tweenLongLeftAnimation;
                              _animationLongLeftController.forward();
                            } else if (_currentDirection ==
                                PartDirection.longRight) {
                              setState(() {
                                _currentDirection = PartDirection.longLeft;
                              });
                              _resetAllAnimationControllers();
                              tweenMainAnimation = tweenLongLeftAnimation;
                              _animationLongLeftController.forward();
                            } else {
                              setState(() {
                                _currentDirection = PartDirection.left;
                              });
                              tweenMainAnimation = tweenLeftAnimation;

                              _animationLeftController.forward();
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  Widget topShape() {
    return Align(
        alignment: Alignment.bottomRight,
        child: Transform.rotate(
          angle: -(60 * (pi / 180)), // convert degree to radian
          alignment: Alignment.bottomLeft,
          child: ClipPath(
            clipper: TopPartClipper(),
            child: Container(
              width: 99.38,
              height: 86.61,
              alignment: Alignment.center,
              color: IColors.darkWhite,
              child: Stack(
                children: [
                  RawMaterialButton(
                    onPressed: () {},
                    shape: TopPartBorder(side: BorderSide.none),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        splashColor: widget.splashColor,
                        onTap: () {
                          // _animationController.reverse(from: 1.0);
                          switch (_currentDirection) {
                            case PartDirection.left:
                              setState(() {
                                _currentDirection = PartDirection.top;
                              });
                              tweenMainAnimation = tweenLeftAnimation;
                              _animationLeftController.reverse();
                              break;
                            case PartDirection.right:
                              setState(() {
                                _currentDirection = PartDirection.top;
                              });
                              tweenMainAnimation = tweenRightAnimation;
                              _animationRightController.reverse();
                              break;
                            case PartDirection.top:
                              break;
                            case PartDirection.longLeft:
                              setState(() {
                                _currentDirection = PartDirection.top;
                              });
                              _resetAllAnimationControllers();
                              tweenMainAnimation = tweenFromLeftToTopAnimation;
                              _animationFromLeftToTopController.forward();
                              break;
                            case PartDirection.longRight:
                              setState(() {
                                _currentDirection = PartDirection.top;
                              });
                              tweenMainAnimation = tweenFromRightToTopAnimation;
                              _resetAllAnimationControllers();
                              _animationFromRightToTopController.forward();
                              break;
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  void _resetAllAnimationControllers() {
    _animationLongRightController.reset();
    _animationLongLeftController.reset();
    _animationFromRightToTopController.reset();
    _animationFromLeftToTopController.reset();
    _animationLeftController.reset();
    _animationRightController.reset();
  }

  Widget _innerCircleShadowShape() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: ClipPath(
        clipper: InnerCircleShadowClipper(),
        child: Container(
          width: 86,
          height: 43.4,
          color: Colors.transparent,
          alignment: Alignment.bottomCenter,
        ),
      ),
    );
  }

  Widget _leftPartChild() {
    return partItemWidget(
      currentDirection: _currentDirection,
      padding: const EdgeInsets.only(left: 20, bottom: 8),
      alignment: Alignment.bottomLeft,
      children: [
        Container(
          width: 40,
          color: Colors.transparent,
          child: Center(
            child: AnimatedTextWidget(
              currentDirection: _currentDirection,
              textChild: widget.textChilds[0],
              transformRadian: 0,
              animationDuration: widget.duration,
              selectedTextColor: widget.selectedTextColor,
              unselectedTextColor: widget.unselectedTextColor,
              directions: [
                PartDirection.left,
                PartDirection.longLeft,
              ],
              alignment: Alignment.center,
              padding: EdgeInsets.zero,
            ),
          ),
        ),
        SizedBox(
          height: 4,
        ),
        widget.icons.isNotEmpty
            ? Icon(
                widget.icons[0],
                color: _currentDirection == PartDirection.left ||
                        _currentDirection == PartDirection.longLeft
                    ? widget.selectedIconColor
                    : widget.unselectedIconColor,
              )
            : Container(width: 5, height: 5),
      ],
    );
  }

  Widget _topPartChild() {
    return partItemWidget(
      currentDirection: _currentDirection,
      padding: const EdgeInsets.only(right: 0, bottom: 48),
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          width: 60,
          color: Colors.transparent,
          child: Center(
            child: AnimatedTextWidget(
              currentDirection: _currentDirection,
              textChild: widget.textChilds[1],
              transformRadian: 0,
              animationDuration: widget.duration,
              selectedTextColor: widget.selectedTextColor,
              unselectedTextColor: widget.unselectedTextColor,
              directions: [
                PartDirection.top,
                PartDirection.top,
              ],
              alignment: Alignment.center,
              padding: EdgeInsets.zero,
            ),
          ),
        ),
        SizedBox(
          height: 4,
        ),
        widget.icons.isNotEmpty
            ? Icon(
                widget.icons[1],
                color: _currentDirection == PartDirection.top ||
                        _currentDirection == PartDirection.top
                    ? widget.selectedIconColor
                    : widget.unselectedIconColor,
              )
            : Container(width: 5, height: 5),
      ],
    );
  }

  Widget _rightPartChild() {
    return partItemWidget(
      currentDirection: _currentDirection,
      padding: const EdgeInsets.only(right: 20, bottom: 8),
      alignment: Alignment.bottomRight,
      children: [
        Container(
          width: 40,
          color: Colors.transparent,
          child: Center(
            child: AnimatedTextWidget(
              currentDirection: _currentDirection,
              textChild: widget.textChilds[2],
              transformRadian: 0,
              animationDuration: widget.duration,
              selectedTextColor: widget.selectedTextColor,
              unselectedTextColor: widget.unselectedTextColor,
              directions: [
                PartDirection.right,
                PartDirection.longRight,
              ],
              alignment: Alignment.center,
              padding: EdgeInsets.zero,
            ),
          ),
        ),
        SizedBox(
          height: 4,
        ),
        widget.icons.isNotEmpty
            ? Icon(
                widget.icons[2],
                color: _currentDirection == PartDirection.right ||
                        _currentDirection == PartDirection.longRight
                    ? widget.selectedIconColor
                    : widget.unselectedIconColor,
              )
            : Container(width: 5, height: 5),
      ],
    );
  }

  void initializeAnimationControllers() {
    _animationController = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    _animationLeftController = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    _animationRightController = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    _animationLongRightController = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    _animationFromRightToTopController = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    _animationLongLeftController =
        AnimationController(vsync: this, duration: widget.duration);
    _animationFromLeftToTopController =
        AnimationController(vsync: this, duration: widget.duration);
  }

  void initializeAnimationTweens() {
    tweenRightAnimation = Tween<double>(
      begin: -(60 * (pi / 180)),
      end: 1.0 * -(0 * (pi / 180)),
    ).animate(
      CurvedAnimation(
        parent: _animationRightController,
        curve: widget.curves,
      ),
    )..addListener(() {
        setState(() {});
      });
    tweenLeftAnimation = Tween<double>(
      begin: -(60 * (pi / 180)),
      end: 1.0 * -(120 * (pi / 180)),
    ).animate(
      CurvedAnimation(
        parent: _animationLeftController,
        curve: widget.curves,
      ),
    )..addListener(() {
        setState(() {});
      });
    tweenLongRightAnimation = Tween<double>(
      begin: -(120 * (pi / 180)),
      end: 1.0 * -(0 * (pi / 180)),
    ).animate(
      CurvedAnimation(
        parent: _animationLongRightController,
        curve: widget.curves,
      ),
    )..addListener(() {
        setState(() {});
      });
    tweenLongLeftAnimation = Tween<double>(
      begin: -(0 * (pi / 180)),
      end: 1.0 * -(120 * (pi / 180)),
    ).animate(CurvedAnimation(
        parent: _animationLongLeftController, curve: widget.curves))
      ..addListener(() {
        setState(() {});
      });

    tweenFromRightToTopAnimation = Tween<double>(
      begin: -(0 * (pi / 180)),
      end: 1.0 * -(60 * (pi / 180)),
    ).animate(CurvedAnimation(
        parent: _animationFromRightToTopController, curve: widget.curves))
      ..addListener(() {
        setState(() {});
      });

    tweenFromLeftToTopAnimation = Tween<double>(
      begin: -(120 * (pi / 180)),
      end: 1.0 * -(60 * (pi / 180)),
    ).animate(CurvedAnimation(
        parent: _animationFromLeftToTopController, curve: widget.curves))
      ..addListener(() {
        setState(() {});
      });
  }

  void disposeAnimationControllers() {
    _animationController.dispose();
    _animationLeftController.dispose();
    _animationRightController.dispose();
    _animationLongLeftController.dispose();
    _animationLongRightController.dispose();
    _animationFromLeftToTopController.dispose();
    _animationFromRightToTopController.dispose();
  }
}
