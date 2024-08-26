import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/core/animation/animation_extensions.dart';
import 'package:portfolio/core/constants/constants.dart';
import 'package:portfolio/core/custom_widgets/size_config.dart';
import 'package:portfolio/core/custom_widgets/spacing.dart';
import 'package:portfolio/core/responsive/screen_info.dart';

class ProjectDetails extends StatefulWidget {
  const ProjectDetails({super.key});

  @override
  State<ProjectDetails> createState() => _ProjectDetailsState();
}

class _ProjectDetailsState extends State<ProjectDetails> {
  @override
  Widget build(BuildContext context) {
    return const ProjectDetailsPhone();
    // return (screenInfo.isPhoneScreen)
    //     ? const ProjectDetailsPhone()
    //     : const Scaffold(
    //         body: Center(
    //           child: Text('Windows Screen'),
    //         ),
    //       );
  }
}

class ProjectDetailsPhone extends StatefulWidget {
  const ProjectDetailsPhone({super.key});

  @override
  State<ProjectDetailsPhone> createState() =>
      _ProjectDetailsPhoneState(); // This is now fixed
}

class _ProjectDetailsPhoneState extends State<ProjectDetailsPhone> {
  final List<String> imageUrls = [
    appImages.deOne,
    appImages.deTwo,
    appImages.deThree,
    appImages.deFour,
    appImages.deFive,
    appImages.deSix,
  ];

  @override
  Widget build(BuildContext context) {
    final screenInfo = ScreenInfo(context);
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SafeArea(
          child: Padding(
            padding: screenInfo.isPhoneScreen
                ? EdgeInsets.all(getProportionateScreenWidth(20))
                : EdgeInsets.only(
                    left: getProportionateScreenWidth(50),
                    right: getProportionateScreenWidth(50)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    'Dezirely',
                    style: textTheme(context).displayLarge!.copyWith(
                          fontFamily: 'QuietSans',
                        ),
                  ).slideInFromSide(),
                ),
                Hspacing(height: getProportionateScreenHeight(10)),
                Animate(
                  effects: const [FadeEffect(), ScaleEffect()],
                  child: Text(
                    'About App',
                    style: textTheme(context).titleLarge,
                  ),
                ),
                Hspacing(height: getProportionateScreenHeight(20)),
                Text(
                  appText.aboutDezirely,
                  style: textTheme(context).bodySmall!.copyWith(
                        color: Colors.grey,
                        fontSize: 20,
                      ),
                ).fadeIn(delay: 1000.ms, animationDuration: 1000.ms),
                Hspacing(height: getProportionateScreenHeight(20)),
                Text(
                  'Key Funtionalities',
                  style: textTheme(context).titleLarge,
                ),
                Hspacing(height: getProportionateScreenHeight(10)),
                Column(
                  children: AnimateList(
                    interval: 500.ms,
                    effects: [FadeEffect(duration: 700.ms)],
                    children: [
                      const KeyFuncContainer(
                        feature: 'Chat',
                      ),
                      const KeyFuncContainer(
                        feature: 'Voice Call',
                      ),
                      const KeyFuncContainer(
                        feature: 'In app Purchases',
                      ),
                      const KeyFuncContainer(
                        feature: 'in app Updates',
                      ),
                    ],
                  ),
                ),
                Hspacing(height: getProportionateScreenHeight(20)),
                Text(
                  'Visuals',
                  style: textTheme(context).titleLarge,
                ),
                Hspacing(height: getProportionateScreenHeight(10)),
                GridView.builder(
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                    itemCount: imageUrls.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            imageUrls[index],
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    }),
                Hspacing(height: getProportionateScreenHeight(40))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class KeyFuncContainer extends StatelessWidget {
  final String feature;
  const KeyFuncContainer({
    super.key,
    required this.feature,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.check_circle,
          size: 40.r,
          color: AppColors.de.primaryColor,
        ),
        Wspacing(width: 10.r),
        Text(
          feature,
          style: textTheme(context).labelMedium!.copyWith(
                fontWeight: FontWeight.w400,
              ),
        ),
      ],
    );
  }
}
