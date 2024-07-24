import 'package:flutter/material.dart';
import 'package:portfolio/features/app/presentation/pages/custom_drawer.dart';
import 'package:portfolio/features/app/presentation/pages/home/practice.dart';
import 'package:portfolio/features/app/presentation/widgets/custom_widgets/curved_container.dart';

import '../../../../../core/constants/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
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
    final myData = MyStateWidget.of(context)?.data ?? 0;

    return Scaffold(
      key: _scaffoldKey,
      drawer: const CustomDrawer(),
      backgroundColor: AppColors.black,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: CurvedContainer(
                radius: 10,
                color: AppColors.purple,
                child: IconButton(
                  onPressed: () {
                    _scaffoldKey.currentState!.openDrawer();
                  },
                  icon: const Icon(
                    Icons.menu,
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
            Center(
                child: AnimatedBuilder(
              animation: _borderColor,
              builder: (context, child) {
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                        color: _borderColor.value!,
                        width: _sizeAnimation.value),
                  ),
                  child: const Text(
                    'Download Resume',
                    style: TextStyle(
                        color: Colors.purple,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                );
              },
            ))
          ],
        ),
      ),
    );
  }
}
