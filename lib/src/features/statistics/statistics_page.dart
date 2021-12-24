import 'package:digicoach/app_localization.dart';
import 'package:digicoach/src/common/constants/asset_image_link.dart';
import 'package:digicoach/src/common/constants/constants.dart';
import 'package:digicoach/src/common/widgets/button/custom_elevated_button.dart';
import 'package:digicoach/src/common/widgets/container/custom_container.dart';
import 'package:digicoach/src/common/widgets/size/custom_size_widget.dart';
import 'package:digicoach/src/common/widgets/text/custom_normal_text_widget.dart';
import 'package:digicoach/src/features/dashboard/widgets/information_item.dart';
import 'package:digicoach/src/features/statistics/data/badges.dart';
import 'package:digicoach/src/features/statistics/data/course_activity.dart';
import 'package:digicoach/src/features/statistics/data/dashboard_information.dart';
import 'package:digicoach/src/features/statistics/widgets/activity_graph.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:digicoach/src/routes/router.dart';

class StatisticsPage extends StatelessWidget {
  const StatisticsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScafoldColor,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: kBlackColor),
        leading: const SizedBox(),
        title: Text(
          "dashboard_page.my_stats".tr(context),
          style: const TextStyle(
            color: kPrimaryColor,
            fontWeight: FontWeight.bold,
            fontSize: kDefaultFontSize - 2,
          ),
        ),
        elevation: 0.0,
        backgroundColor: kWhiteColor,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const HeightWidget(16.0),
            const DashboardDigicoinWidget(),
            const DashboardGridInformation(),
            const DashboardGraph(),
            DashBoardBadges(
              badgeType: diplomaBadges,
              title: "dashboard_page.diploma_badges",
              onTap: () {},
            ),
            DashBoardBadges(
              badgeType: activityBadges,
              title: "dashboard_page.activity_badges",
              onTap: () {},
            ),
            const HeightWidget(80.0),
          ],
        ),
      ),
    );
  }
}

class DashBoardBadges extends StatelessWidget {
  final List<String> badgeType;
  final String title;
  final VoidCallback onTap;
  const DashBoardBadges({
    Key? key,
    required this.title,
    required this.onTap,
    required this.badgeType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Column(
        children: [
          TitleAndInfoWidget(
            title: title,
            onTap: () {},
          ),
          const HeightWidget(16.0),
          SizedBox(
            height: 110.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: badgeType.map((badge) {
                return Column(
                  children: [
                    NormalText(
                      badge,
                      fontSize: kDefaultFontSize - 6,
                    ),
                    const HeightWidget(8.0),
                    Container(
                      width: 74.0,
                      height: 74.0,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                      ),
                      decoration: BoxDecoration(
                        color: kNavBarBackgroundColor,
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Center(
                        child: Image.asset(
                          IconAsset.badges,
                          height: 34.0,
                        ),
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),
          )
        ],
      ),
    );
  }
}

class DashboardGraph extends StatelessWidget {
  const DashboardGraph({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const NormalText(
                  "Répartition de votre activité",
                  color: kPrimaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: kDefaultFontSize - 4,
                ),
                const HeightWidget(8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    NormalText(
                      "Vos cours du 01/01/2022 au 30/12/2023",
                      color: kPrimaryColor,
                      fontSize: kDefaultFontSize - 6,
                    ),
                    Icon(
                      Icons.filter_list,
                      color: kDarkGrey,
                    )
                  ],
                ),
                const HeightWidget(16.0),
                ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: courseActivity.length,
                  itemBuilder: (BuildContext context, int index) {
                    final CourseActivityModel course = courseActivity[index];
                    return CustomCourseActivityGraph(
                        index: index,
                        color: course.color,
                        title: course.title,
                        duration: course.duration,
                        image: course.image,
                        completedDuration: course.completedDuration,
                        course: course.course);
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DashboardGridInformation extends StatelessWidget {
  const DashboardGridInformation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Column(
        children: [
          TitleAndInfoWidget(
            title: "Informations globales",
            onTap: () {},
          ),
          const HeightWidget(16.0),
          GridView.builder(
            padding: const EdgeInsets.all(4.0),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 1.85,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
            ),
            itemCount: dashboardInfo.length,
            itemBuilder: (context, index) {
              final DashboardInformation dashboardInformation =
                  dashboardInfo[index];
              return InformationItem(
                onTap: () {
                  if (index == 0) {
                    context.router.push(const RatingPageRoute());
                  }
                  if (index == 1) {
                    context.router.push(const AvisPageRoute());
                  }

                  if (index == 2) {
                    context.router.push(const SettingsPageRoute());
                  }
                },
                image: dashboardInformation.icon,
                data: dashboardInformation.value,
                title: dashboardInformation.title,
              );
            },
          ),
        ],
      ),
    );
  }
}

class TitleAndInfoWidget extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const TitleAndInfoWidget({
    required this.onTap,
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        NormalText(
          title,
          color: kAppBarColor,
          fontWeight: FontWeight.bold,
          fontSize: kDefaultFontSize - 4,
        ),
        GestureDetector(
          onTap: onTap,
          child: const Icon(
            Icons.info_outline_rounded,
            size: 16.0,
            color: kDarkGrey,
          ),
        ),
      ],
    );
  }
}

class DashboardDigicoinWidget extends StatelessWidget {
  final bool showButton;
  const DashboardDigicoinWidget({
    Key? key,
    this.showButton = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Column(
        children: [
          Column(
            children: [
              NormalText(
                "dashboard_page.credit".tr(context),
                color: kPrimaryColor,
                fontSize: kDefaultFontSize - 4,
                fontWeight: FontWeight.w600,
              ),
              const HeightWidget(16.0),
              const NormalText(
                "28 DigiCoins",
                fontWeight: FontWeight.w500,
                fontSize: kDefaultFontSize + 18,
                color: kBottonColor,
              ),
              const HeightWidget(16.0),
              NormalText(
                "dashboard_page.achieved".tr(context),
                color: kdashboardLightColor,
                fontSize: kDefaultFontSize - 6,
              ),
            ],
          ),
          const HeightWidget(16.0),
          showButton
              ? CustomElevatedButton(
                  label: "dashboard_page.use_digicoins".tr(context),
                  fontsize: kDefaultFontSize - 4,
                  onPressed: () {
                    context.router.push(const RedeemDigicoinPageRoute());
                  },
                  showImage: true,
                  image: IconAsset.utilizeDigicoins,
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
