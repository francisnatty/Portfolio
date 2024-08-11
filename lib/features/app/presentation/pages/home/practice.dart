import 'package:flutter/material.dart';

class MyStateWidget extends InheritedWidget {
  const MyStateWidget({
    super.key,
    required this.data,
    required super.child,
  });

  final int data;

  static MyStateWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MyStateWidget>();
  }

  @override
  bool updateShouldNotify(MyStateWidget oldWidget) {
    return oldWidget.data != data;
  }
}
