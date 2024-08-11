import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/colors.dart';
import 'package:portfolio/core/constants/theme/app_styles.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  // List of items to display in the drawer.
  List<String> drawerItems = [
    'Home',
    'Resume',
    'About me',
    'Contact Me',
  ];

  String? _selectedItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.0),
          child: Center(
            child: Column(
              // mainAxisAlignment: Main,
              children: [
                const SizedBox(
                  height: 40,
                ),
                Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      icon: const Icon(
                        Icons.cancel,
                        size: 35,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    )),
                Expanded(
                  child: ListView.builder(
                    itemCount: drawerItems.length,
                    itemBuilder: (context, index) {
                      return kIsWeb
                          ? CustomMouseRegion(
                              child: Container(
                                padding: const EdgeInsets.all(16),
                                child: Text(
                                  drawerItems[index],
                                  style: AppStyles.of(context).buttonBold30,
                                ),
                              ),
                            )
                          : InkWell(
                              highlightColor: Colors.transparent,
                              onTap: () {
                                setState(() {
                                  // _selectedItem
                                });
                              },
                              child: Center(
                                child: Container(
                                  // color: _color,
                                  padding: const EdgeInsets.all(16),
                                  child: Text(
                                    drawerItems[index],
                                    style: AppStyles.of(context).buttonBold30,
                                  ),
                                ),
                              ),
                            );
                    },
                  ),
                ),
              ],
            ),
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
  Color _color = AppColors.de.white;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          _color = AppColors.de.purple;
        });
      },
      onExit: (_) {
        setState(() {
          _color = AppColors.de.white;
        });
      },
      child: Container(
        color: _color,
        child: widget.child,
      ),
    );
  }
}
