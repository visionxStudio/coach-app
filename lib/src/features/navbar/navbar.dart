import 'package:digicoach/src/common/constants/asset_image_link.dart';
import 'package:digicoach/src/common/constants/constants.dart';
import 'package:digicoach/src/features/calendar/calendar_page.dart';
import 'package:digicoach/src/features/education/education_page.dart';
import 'package:digicoach/src/features/home/home_page.dart';
import 'package:digicoach/src/features/dashboard/dashboard.dart';
import 'package:digicoach/src/features/message/message_page.dart';
import 'package:digicoach/src/features/navbar/bottom_nav_clipper.dart';
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
  chat,
}

extension NavBarPageX on NavBarPage {
  /// Returns asses name for navbar page icon
  String getAsset() {
    switch (this) {
      case NavBarPage.home:
        return IconAsset.dashboardIcon;
      case NavBarPage.calendar:
        return IconAsset.calendarIcon;
      case NavBarPage.dashboard:
        return IconAsset.homeIcon;
      case NavBarPage.education:
        return IconAsset.educationIcon;
      case NavBarPage.chat:
        return IconAsset.chatIcon;
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
              return const HomePage();
            case NavBarPage.calendar:
              return const CalendarPage();
            case NavBarPage.dashboard:
              return const Dashboard();
            case NavBarPage.education:
              return const EducationPage();
            case NavBarPage.chat:
              return const MessagePage();
          }
        },
      ),
      bottomNavigationBar: CustomPaint(
        size: const Size(double.infinity, 167.0),
        painter: BottomNavigaionBarClipper(),
        child: Container(
          color: Colors.transparent,
          padding: const EdgeInsets.only(top: 8.0),
          width: double.infinity,
          height: kNavBarHeight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: NavBarPage.values
                .map(
                  (e) => _NavBarButton(
                    onTap: () => setState(() {
                      activeNavPage = e;
                    }),
                    center: e == NavBarPage.dashboard,
                    active: activeNavPage == e,
                    index: e.index,
                    asset: e.getAsset(),
                  ),
                )
                .toList(),
          ),
        ),
      ),
      // TODO BottomSheet should be in dashboard page not here
      // bottomSheet: mainController.showFilterBottomSheet
      //     ? const ShowCoachBottomFilterWidget()
      //     : mainController.showCalendarBottomSheet
      //         ? const CalendarBottomSheetWidget()
      //         : null,
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
        child: index != 2
            ? Image.asset(
                asset,
                height: center ? 50.0 : 35.0,
                color: active ? kNavBackgroundColor : kGreyColor,
              )
            : Container(
                padding: const EdgeInsets.all(6.0),
                height: center ? 50.0 : 35.0,
                width: center ? 50.0 : 35.0,
                decoration: BoxDecoration(
                  color: active ? kNavBackgroundColor : kGreyColor,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Stack(
                    children: [
                      Image.asset(
                        asset,
                        height: center ? 50.0 : 35.0,
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
