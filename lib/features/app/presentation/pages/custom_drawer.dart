import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/colors.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  // List of items to display in the drawer.
  List<String> drawerItems = [
    'Resume',
    'Home',
    'Contact Me',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.20),
        child: Center(
          child: ListView.builder(
            itemCount: drawerItems.length,
            itemBuilder: (context, index) {
              return CustomMouseRegion(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  child: Text(drawerItems[index]),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class CustomMouseRegion extends StatefulWidget {
  final Widget child;

  const CustomMouseRegion({
    super.key,
    required this.child,
  });

  @override
  State<CustomMouseRegion> createState() => _CustomMouseRegionState();
}

class _CustomMouseRegionState extends State<CustomMouseRegion> {
  Color _color = AppColors.white;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          _color = AppColors.purple;
        });
      },
      onExit: (_) {
        setState(() {
          _color = AppColors.white;
        });
      },
      child: Container(
        color: _color,
        child: widget.child,
      ),
    );
  }
}
