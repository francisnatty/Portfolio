import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/core/custom_widgets/size_config.dart';

abstract class Spacing extends StatelessWidget {
  const Spacing({super.key});

  @override
  Widget build(BuildContext context);
}

class Hspacing extends Spacing {
  final double height;

  const Hspacing({super.key, required this.height});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height.h,
    );
  }
}

class Wspacing extends Spacing {
  final double width;

  const Wspacing({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: width.h);
  }
}
