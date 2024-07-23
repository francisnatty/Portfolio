import 'package:flutter/material.dart';

class CurvedContainer extends StatelessWidget {
  final Color color;
  final Widget child;
  final double radius;

  const CurvedContainer(
      {super.key,
      this.color = Colors.white,
      this.radius = 0,
      required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: child,
    );
  }
}
