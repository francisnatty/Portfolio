import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/core/constants/global_var.dart';
import 'package:portfolio/features/app/presentation/pages/custom_drawer.dart';
import 'package:portfolio/features/app/presentation/pages/home/project_details.dart';
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

  @override
  void initState() {
    super.initState();
  }

  List<String> allProjects = [
    'Dezirely',
    'Lawvee',
    'Latte',
    'Foodlify',
  ];

  List<String> coverPhotos = [
    appImages.deOne,
    appImages.lawOne,
    appImages.deOne,
    appImages.lawOne,
  ];

  @override
  Widget build(BuildContext context) {
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
              const SizedBox(
                height: 20,
              ),
              screenInfo.isPhoneScreen
                  ? ListView.builder(
                      shrinkWrap: true,
                      itemCount: allProjects.length,
                      itemBuilder: (context, index) {
                        return ProjectContainer(
                          project: allProjects[index],
                          coverPhoto: coverPhotos[index],
                        )
                            .animate()
                            .fadeIn(
                              delay: 300.ms,
                              duration: const Duration(milliseconds: 900),
                            )
                            .shimmer(
                              duration: const Duration(milliseconds: 900),
                              blendMode: BlendMode.colorBurn,
                              color: Colors.white12,
                            );
                      },
                    )
                  : GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      // padding: EdgeInsets.only(left: 100.w, right: 100.w),
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 400,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: 0.65,
                      ),
                      itemCount: allProjects.length,
                      itemBuilder: (context, index) {
                        return ProjectContainer(
                          project: allProjects[index],
                          coverPhoto: coverPhotos[index],
                        );
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
    required this.coverPhoto,
  });

  final String project;
  final String coverPhoto;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const ProjectDetails()));
      },
      child: Column(
        children: [
          Container(
              padding: const EdgeInsets.all(10),
              height: screenInfo.isPhoneScreen
                  ? MediaQuery.of(context).size.height * 0.35
                  : MediaQuery.of(context).size.height * 0.60,
              width: screenInfo.isPhoneScreen
                  ? MediaQuery.of(context).size.width * 0.95
                  : MediaQuery.of(context).size.width * 0.30,
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.grey, width: 0.8),
                  image: DecorationImage(
                      image: Image.asset(coverPhoto).image, fit: BoxFit.cover)),
              child: Column(
                children: [
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.all(8),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.9),
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
                                Text(
                                  'View More',
                                  style: TextStyle(color: AppColors.de.purple),
                                ),
                                Icon(
                                  Icons.arrow_forward,
                                  color: AppColors.de.purple,
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
      ),
    );
  }
}
