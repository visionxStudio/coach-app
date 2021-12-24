import 'package:digicoach/src/common/constants/asset_image_link.dart';
import 'package:digicoach/src/common/constants/constants.dart';
import 'package:digicoach/src/features/education/education_page.dart';
import 'package:digicoach/src/features/home/home_page.dart';
import 'package:digicoach/src/features/my_appointments/my_appointments.dart';
import 'package:digicoach/src/features/statistics/statistics_page.dart';
import 'package:digicoach/src/features/sutdent_profile/student_profile_page.dart';
import 'package:flutter/material.dart';

enum NavBarPage {
  /// Home for Coach/Studtent
  home,

  /// Calendar for Coach/Student & video conference
  calendar,

  /// Dashboard
  dashboard,

  /// Profile
  education,

  /// Chat
  profile,
}

extension NavBarPageX on NavBarPage {
  String getAsset() {
    switch (this) {
      case NavBarPage.home:
        return IconAsset.dashboadIcon1;
      case NavBarPage.calendar:
        return IconAsset.calendarIcon1;
      case NavBarPage.dashboard:
        return IconAsset.homeIcon1;
      case NavBarPage.education:
        return IconAsset.educationIcon1;
      case NavBarPage.profile:
        return IconAsset.profileIcon;
    }
  }
}

class NavBar extends StatefulWidget {
  final NavBarPage activeNavPage;
  const NavBar({
    Key? key,
    this.activeNavPage = NavBarPage.dashboard,
  }) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  late NavBarPage activeNavPage;

  @override
  void initState() {
    activeNavPage = NavBarPage.dashboard;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Builder(
        builder: (context) {
          switch (activeNavPage) {
            case NavBarPage.home:
              return const StatisticsPage();
            // return const CoachStatisticsPage();
            case NavBarPage.calendar:
              // return const CalendarPage();
              return const MyAppointmentsPage();
            case NavBarPage.dashboard:
              return const HomePage();
            case NavBarPage.education:
              return const EducationPage();
            case NavBarPage.profile:
              //return const CoachProfilePage();
              return const StudentProfilePage();
          }
        },
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        height: kNavBarHeight - 10,
        decoration: BoxDecoration(
          color: kWhiteColor,
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, -8),
              blurRadius: 16.0,
              spreadRadius: 0.0,
              color: kPureBlack.withOpacity(0.1),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: NavBarPage.values
              .map(
                (e) => _NavBarButton(
                    index: e.index,
                    onTap: () => setState(() {
                          activeNavPage = e;
                        }),
                    active: activeNavPage == e,
                    asset: e.getAsset()),
              )
              .toList(),
        ),
      ),
      // bottomNavigationBar: CustomPaint(
      //   size: const Size(double.infinity, 167.0),
      //   painter: BottomNavigaionBarClipper(),
      //   child: Container(
      //     color: Colors.transparent,
      //     padding: const EdgeInsets.only(top: 8.0),
      //     width: double.infinity,
      //     height: kNavBarHeight,
      //     child: Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceAround,
      //       crossAxisAlignment: CrossAxisAlignment.end,
      //       children: NavBarPage.values
      //           .map(
      //             (e) => _NavBarButton(
      //               onTap: () => setState(() {
      //                 activeNavPage = e;
      //               }),
      //               center: e == NavBarPage.dashboard,
      //               active: activeNavPage == e,
      //               index: e.index,
      //               asset: e.getAsset(),
      //             ),
      //           )
      //           .toList(),
      //     ),
      //   ),
      // ),
    );
  }
}

class _NavBarButton extends StatelessWidget {
  const _NavBarButton({
    Key? key,
    required this.index,
    required this.onTap,
    required this.active,
    required this.asset,
    this.center = false,
  }) : super(key: key);

  final VoidCallback onTap;
  final int index;
  final bool active;
  final String asset;
  final bool center;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(8.0),
          height: center ? 50.0 : 45.0,
          width: center ? 50.0 : 45.0,
          decoration: BoxDecoration(
            color: active ? kNavBarBackgroundColor : kWhiteColor,
            shape: BoxShape.circle,
          ),
          child: index == 4
              ? Center(
                  child: Stack(
                    children: [
                      Image.asset(
                        asset,
                        height: center ? 50.0 : 35.0,
                      ),
                    ],
                  ),
                )
              : Center(
                  child: Stack(
                    children: [
                      Image.asset(
                        asset,
                        height: center ? 50.0 : 35.0,
                        color:
                            active ? kNavBackgroundColor : knavbarInactiveColor,
                      ),
                    ],
                  ),
                ),
        ),

        // child: index != 2
        //     ? Image.asset(
        //         asset,
        //         height: center ? 50.0 : 35.0,
        //         color: active ? kNavBackgroundColor : kGreyColor,
        //       )
        //     : Container(
        //         padding: const EdgeInsets.all(6.0),
        //         height: center ? 50.0 : 35.0,
        //         width: center ? 50.0 : 35.0,
        //         decoration: BoxDecoration(
        //           color: active ? kNavBackgroundColor : kGreyColor,
        //           shape: BoxShape.circle,
        //         ),
        //         child: Center(
        //           child: Stack(
        //             children: [
        //               Image.asset(
        //                 asset,
        //                 height: center ? 50.0 : 35.0,
        //               ),
        //             ],
        //           ),
        //         ),
        //       ),
      ),
    );
  }
}
