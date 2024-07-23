import 'package:flutter/material.dart';
import 'package:portfolio/features/app/presentation/pages/custom_drawer.dart';
import 'package:portfolio/features/app/presentation/widgets/custom_widgets/curved_container.dart';

import '../../../../../core/constants/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const CustomDrawer(),
      backgroundColor: AppColors.black,
      appBar: AppBar(
        backgroundColor: AppColors.black,
      ),
      body: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: CurvedContainer(
              color: AppColors.purple,
              child: IconButton(
                onPressed: () {
                  _scaffoldKey.currentState!.openDrawer();
                },
                icon: const Icon(Icons.menu),
              ),
            ),
          )
        ],
      ),
    );
  }
}
