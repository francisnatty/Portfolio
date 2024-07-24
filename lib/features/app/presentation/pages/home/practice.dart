import 'package:flutter/material.dart';

class MyStateWidget extends InheritedWidget {
  const MyStateWidget({
    Key? key,
    required this.data,
    required Widget child,
  }) : super(key: key, child: child);

  final int data;

  static MyStateWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MyStateWidget>();
  }

  @override
  bool updateShouldNotify(MyStateWidget oldWidget) {
    return oldWidget.data != data;
  }
}
