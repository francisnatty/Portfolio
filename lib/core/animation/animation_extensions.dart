import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

extension MediaQuerySizeExtension on BuildContext {
  double sizeWidth(double w) {
    return MediaQuery.sizeOf(this).width * w;
  }

  double sizeHeight(double h) {
    return MediaQuery.sizeOf(this).height * h;
  }

  ThemeData get theme => Theme.of(this);

  ColorScheme get colorScheme => theme.colorScheme;
  TextTheme get textTheme => theme.textTheme;
}

extension WidgetAnimation on Widget {
  Animate slideInFromBottom({
    Duration? delay,
    Duration? animationDuration,
    Curve? curve,
    double? begin,
  }) =>
      animate(
        delay: delay ?? 200.ms,
      ).slideY(
        duration: animationDuration ?? 300.ms,
        begin: begin ?? 0.2,
        end: 0,
        curve: curve ?? Curves.linear,
      );

  Animate slideInFromSide({
    Duration? delay,
    Duration? animationDuration,
    Curve? curve,
    double? begin,
  }) =>
      animate(
        delay: delay ?? 600.ms,
      ).slideX(
        duration: animationDuration ?? 600.ms,
        begin: begin ?? 1,
        end: 0,
        curve: curve ?? Curves.linear,
      );

  Animate fadeIn({
    Duration? delay,
    Duration? animationDuration,
    Curve? curve,
  }) =>
      animate(delay: delay ?? 300.ms).fade(
        duration: animationDuration ?? 300.ms,
        curve: curve ?? Curves.decelerate,
      );

  Animate something({
    Duration? delay,
    Duration? animationDuration,
    Curve? curve,
    double? begin,
  }) =>
      animate(delay: delay ?? 200.ms).slide();

  // Animate textAnimation({
  //     Duration? delay,
  //   Duration? animationDuration,
  //   Curve? curve,
  // })=> animate(delay: delay ?? 300ms).
}


 // Center(
              //     child: AnimatedBuilder(
              //   animation: _borderColor,
              //   builder: (context, child) {
              //     return AnimatedContainer(
              //       duration: const Duration(milliseconds: 500),
              //       padding: const EdgeInsets.symmetric(
              //         vertical: 10,
              //         horizontal: 10,
              //       ),
              //       decoration: BoxDecoration(
              //         color: Colors.white,
              //         borderRadius: BorderRadius.circular(30),
              //         border: Border.all(
              //             color: _borderColor.value!,
              //             width: _sizeAnimation.value),
              //       ),
              //       child: const Text(
              //         'Download Resume',
              //         style: TextStyle(
              //             color: Colors.purple,
              //             fontWeight: FontWeight.bold,
              //             fontSize: 16),
              //       ),
              //     );
              //   },
              // )),




                // bool? _showBorder = false;
  // late AnimationController _controller;
  // late AnimationController _sizeController;
  // late Animation<double> _sizeAnimation;
  // late Animation<Color?> _borderColor;


   // _controller = AnimationController(
    //     duration: const Duration(milliseconds: 1000), vsync: this);

    // _sizeController = AnimationController(
    //     vsync: this, duration: const Duration(milliseconds: 1000));

    // _borderColor = ColorTween(
    //         begin: Colors.transparent.withOpacity(0.7), end: Colors.transparent)
    //     .animate(_controller);

    // _sizeAnimation =
    //     Tween<double>(begin: 15, end: 0.0).animate(_sizeController);

    // _controller.repeat(reverse: true);
    // _sizeController.repeat(reverse: true);


     // void showBorder(bool value) {
  //   setState(() {
  //     _showBorder = value;
  //   });
  // }