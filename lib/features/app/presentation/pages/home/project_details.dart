import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/constants.dart';
import 'package:portfolio/core/custom_widgets/size_config.dart';
import 'package:portfolio/core/custom_widgets/spacing.dart';

class ProjectDetails extends StatefulWidget {
  const ProjectDetails({super.key});

  @override
  State<ProjectDetails> createState() => _ProjectDetailsState();
}

class _ProjectDetailsState extends State<ProjectDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(getProportionateScreenWidth(20)),
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
                ),
              ),
              Hspacing(height: getProportionateScreenHeight(10)),
              Text(
                'About App',
                style: textTheme(context).titleLarge,
              ),
              Hspacing(height: getProportionateScreenHeight(20)),
              Text(
                appText.aboutDezirely,
                style: textTheme(context).bodySmall!.copyWith(
                      color: Colors.grey,
                      fontSize: 20,
                    ),
              ),
              Hspacing(height: getProportionateScreenHeight(20)),
              Text(
                'Key Funtionalities',
                style: textTheme(context).titleLarge,
              ),
              Hspacing(height: getProportionateScreenHeight(10)),
              const KeyFuncContainer(),
              const KeyFuncContainer(),
              const KeyFuncContainer(),
              const KeyFuncContainer()
            ],
          ),
        ),
      ),
    );
  }
}

class KeyFuncContainer extends StatelessWidget {
  const KeyFuncContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: getProportionateScreenHeight(10),
          width: getProportionateScreenWidth(10),
          decoration: BoxDecoration(
            color: AppColors.de.primaryColor,
            shape: BoxShape.circle,
          ),
        ),
        Wspacing(width: getProportionateScreenWidth(10)),
        Text(
          'Chat Feature',
          style: textTheme(context)
              .labelMedium!
              .copyWith(fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
