import 'package:digicoach/app_localization.dart';
import 'package:digicoach/src/common/constants/constants.dart';
import 'package:digicoach/src/common/widgets/size/custom_size_widget.dart';
import 'package:digicoach/src/features/statistics/data/badges.dart';
import 'package:digicoach/src/features/statistics/statistics_page.dart';
import 'package:flutter/material.dart';

class CoachStatisticsPage extends StatelessWidget {
  const CoachStatisticsPage({Key? key}) : super(key: key);

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
              color: kPrimaryColor, fontWeight: FontWeight.bold),
        ),
        elevation: 0.0,
        backgroundColor: kWhiteColor,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const HeightWidget(16.0),
            const DashboardGridInformation(),
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
