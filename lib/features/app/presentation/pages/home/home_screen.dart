import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/features/app/presentation/pages/custom_drawer.dart';
import 'package:portfolio/features/app/presentation/widgets/custom_widgets/curved_container.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/custom_widgets/spacing.dart';
import '../../../../../core/responsive/screen_info.dart';
import '../../../../../main.dart';

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

  List<String> allProjects = [
    'Dezirely',
    'Lawvee',
    'Latte',
    'Foodlify',
  ];

  @override
  Widget build(BuildContext context) {
    print(screenInfo.isPhoneScreen);
    List<Widget> listWidgets = [
      for (var project in allProjects) ProjectContainer(project: project),
    ];
    return Scaffold(
      key: _scaffoldKey,
      drawer: const CustomDrawer(),
      backgroundColor: Colors.black54,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: screenInfo.isPhoneScreen
              ? const EdgeInsets.all(20)
              : const EdgeInsets.only(left: 50, right: 50),
          child: Column(
            children: [
              const Hspacing(
                height: 20,
              ),
              Align(
                alignment: Alignment.topRight,
                child: CurvedContainer(
                  radius: 10,
                  color: AppColors.de.primaryColor,
                  child: IconButton(
                    onPressed: () {
                      _scaffoldKey.currentState!.openDrawer();
                    },
                    icon: Icon(
                      Icons.menu,
                      color: AppColors.de.white,
                    ),
                  ),
                ),
              ),
              Text('I\'m Francis Nathniel', style: GoogleFonts.aBeeZee()),
              const SizedBox(
                height: 15,
              ),
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
              const SizedBox(
                height: 20,
              ),
              screenInfo.isPhoneScreen
                  ? ListView(
                      children: listWidgets
                          .animate(interval: 600.ms)
                          .fadeIn(
                            delay: 300.ms,
                            duration: const Duration(milliseconds: 900),
                          )
                          .shimmer(
                            duration: const Duration(milliseconds: 900),
                            blendMode: BlendMode.colorBurn,
                            color: Colors.white12,
                          ),
                    )
                  : GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 400, // Adjust max width per item
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 20,
                        childAspectRatio:
                            0.75, // Adjust as needed for your design
                      ),
                      itemCount: allProjects.length,
                      itemBuilder: (context, index) {
                        return ProjectContainer(project: allProjects[index]);
                      }),

              Hspacing(height: 40.h),
            ],
          ),
        ),
      ),
    );
  }
}

class ProjectContainer extends StatelessWidget {
  const ProjectContainer({
    super.key,
    required this.project,
  });

  final String project;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            padding: const EdgeInsets.all(10),
            height: screenInfo.isPhoneScreen
                ? MediaQuery.of(context).size.height * 0.35
                : MediaQuery.of(context).size.height * 0.0,
            width: screenInfo.isPhoneScreen
                ? MediaQuery.of(context).size.width * 0.95
                : null,
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.grey, width: 0.8)),
            child: Column(
              children: [
                const Spacer(),
                Container(
                  padding: const EdgeInsets.all(8),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        project,
                        style: TextStyle(
                          color: AppColors.de.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        child: TextButton(
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                          ),
                          onPressed: () {},
                          child: Row(
                            children: [
                              const Text(
                                'View More',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Icon(
                                Icons.arrow_forward,
                                color: AppColors.de.primaryColor,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )),
        // const SizedBox(
        //   height: 10,
        // ),
      ],
    );
  }
}
