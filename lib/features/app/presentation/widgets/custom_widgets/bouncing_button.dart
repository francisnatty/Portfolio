import 'package:flutter/material.dart';

class BouncingButton extends StatefulWidget {
  const BouncingButton({super.key});

  @override
  State<BouncingButton> createState() => _BouncingButtonState();
}

class _BouncingButtonState extends State<BouncingButton>
    with TickerProviderStateMixin {
  bool? _showBorder = false;
  late AnimationController _controller;
  late AnimationController _sizeController;
  late Animation<double> _sizeAnimation;
  late Animation<Color?> _borderColor;

  @override
  void initState() {
    _controller = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);

    _sizeController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));

    _borderColor = ColorTween(
            begin: Colors.transparent.withOpacity(0.7), end: Colors.transparent)
        .animate(_controller);

    _sizeAnimation =
        Tween<double>(begin: 15, end: 0.0).animate(_sizeController);

    _controller.repeat(reverse: true);
    _sizeController.repeat(reverse: true);
    super.initState();
  }

  void showBorder(bool value) {
    setState(() {
      _showBorder = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
