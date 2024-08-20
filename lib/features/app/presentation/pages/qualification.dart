// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:portfolio/core/constants/colors.dart';
import 'package:portfolio/core/custom_widgets/size_config.dart';
import 'package:portfolio/core/custom_widgets/spacing.dart';

class Qualification extends StatelessWidget {
  const Qualification({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme theme = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Hspacing(height: 10),
              Text(
                'My Qualification',
                style: theme.displayLarge!.copyWith(
                  fontFamily: 'QuietSans',
                ),
              ),
              const Hspacing(height: 15),
              Row(
                children: [
                  Icon(Iconsax.activity,
                      size: getProportionateScreenHeight(25)),
                  const Wspacing(width: 5),
                  Text(
                    'Experience',
                    style: theme.titleLarge,
                  ),
                ],
              ),
              const Hspacing(height: 30),
              Expanded(
                child: ListView.separated(
                    shrinkWrap: true,
                    separatorBuilder: (context, index) {
                      return const Hspacing(height: 20);
                    },
                    itemCount: exp.length,
                    itemBuilder: (context, index) {
                      return QualifiContainer(theme: theme);
                    }),
              ),
              Row(
                children: [
                  Icon(
                    Icons.school_outlined,
                    size: getProportionateScreenHeight(25),
                  ),
                  const Wspacing(width: 5),
                  Text(
                    'Education',
                    style: theme.titleLarge,
                  ),
                ],
              ),
              const Hspacing(height: 30),
              Expanded(
                child: ListView.separated(
                    shrinkWrap: true,
                    separatorBuilder: (context, index) {
                      return const Hspacing(height: 20);
                    },
                    itemCount: exp.length,
                    itemBuilder: (context, index) {
                      return QualifiContainer(theme: theme);
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class QualifiContainer extends StatelessWidget {
  const QualifiContainer({
    super.key,
    required this.theme,
  });

  final TextTheme theme;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Icon(
          Iconsax.lamp,
          size: getProportionateScreenHeight(30),
        ),
        // const Wspacing(width: 30),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'TalCube',
              style: theme.labelMedium,
            ),
            const Hspacing(height: 10),
            Text(
              'Flutter developer',
              style:
                  theme.bodySmall!.copyWith(color: Colors.grey, fontSize: 18),
            ),
            const Hspacing(height: 10),
            Row(
              children: [
                const Icon(Iconsax.calendar),
                const Wspacing(width: 5),
                Text(
                  'August 2022 ',
                  style: theme.bodySmall!
                      .copyWith(color: AppColors.de.primaryColor),
                ),
                Text(
                  '-',
                  style: theme.bodySmall!
                      .copyWith(color: AppColors.de.primaryColor),
                ),
                Text(
                  'May 2023 ',
                  style: theme.bodySmall!
                      .copyWith(color: AppColors.de.primaryColor),
                )
              ],
            )
          ],
        ),
        const SizedBox(),
      ],
    );
  }
}

class ExperienceModel {
  final String placeOfWork;
  final String position;
  final String startDate;
  final String endDate;
  ExperienceModel({
    required this.placeOfWork,
    required this.position,
    required this.startDate,
    required this.endDate,
  });
}

class EducationModel {
  final String school;
  final String certification;
  final String startDate;
  final String endDate;
  EducationModel({
    required this.school,
    required this.certification,
    required this.startDate,
    required this.endDate,
  });
}

List<EducationModel> edu = [
  EducationModel(
    school: 'Federal University of Technology Minna',
    certification: 'B.Tech(Computer science)',
    startDate: '2019',
    endDate: '2025',
  ),
];

List<ExperienceModel> exp = [
  ExperienceModel(
    placeOfWork: 'Dezirely',
    position: 'Lead Mobile Developer',
    startDate: 'August 2022',
    endDate: 'May 2023',
  ),
  ExperienceModel(
    placeOfWork: '',
    position: 'Lead Mobile Developer',
    startDate: 'August 2022',
    endDate: 'May 2023',
  ),
];
