import 'package:digicoach/src/common/constants/asset_image_link.dart';
import 'package:digicoach/src/common/constants/constants.dart';
import 'package:digicoach/src/common/constants/enums.dart';
import 'package:digicoach/src/common/constants/strings.dart';
import 'package:digicoach/src/common/utils/app_size_utils.dart';
import 'package:digicoach/src/common/widgets/appbar/appbar_background.dart';
import 'package:digicoach/src/common/widgets/size/custom_size_widget.dart';
import 'package:digicoach/src/common/widgets/text/custom_normal_text_widget.dart';
import 'package:digicoach/src/features/home/widgets/home_body_widget.dart';
import 'package:digicoach/src/features/main_dashboard_container/bloc/main_dashboard_controller.dart';
import 'package:digicoach/src/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:auto_route/auto_route.dart';

final _upArrowVisibilityProvider = StateProvider((_) => false);

class HomePage extends ConsumerStatefulWidget {
  /// Home for Coach/Students
  const HomePage({Key? key}) : super(key: key);
  static TextEditingController searchController = TextEditingController();

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  ScrollController homepageScrollController = ScrollController();

  ///it control while scrolling showing arrow up
  bool homeScrollArrowUp = false;

  @override
  void initState() {
    super.initState();
    homepageScrollController.addListener(() {
      _scrollControllerArrowUpController(
          homepageScrollController.position.pixels);
    });
  }

  void _scrollControllerArrowUpController(double pixel) {
    if (pixel > 100) {
      ref.read(_upArrowVisibilityProvider.notifier).state = true;
    } else {
      ref.read(_upArrowVisibilityProvider.notifier).state = false;
    }
  }

  ///method to to jump scrollbar at the top of the list
  void _scrollListAtTheTop() {
    if (homepageScrollController.hasClients) {
      final position = homepageScrollController.position.minScrollExtent;
      homepageScrollController.animateTo(
        position,
        duration: const Duration(seconds: 1),
        curve: Curves.easeOut,
      );
    }
  }

  @override
  void dispose() {
    homepageScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mainProvider = ref.watch(mainDashboardProvider);
    // mainProvider.onInit();
    if (mainProvider.coachDetailList.isEmpty) {
      return const Center(
        child: NormalText("NO DATA FOUND"),
      );
    }
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 60.0),
        child: AppbarBackgroudWidget(
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: kDefaultPadding, vertical: kDefaultPadding / 2),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const WidthWidget(20),
                InkWell(
                  onTap: () {
                    //TODO:check either its student or teacher
                    //if coach then navigate to its respective coach profile setting
                    //else navigate to respective student profile setting
                    if (mainProvider.userType == UserType.coach) {
                      context.router.push(const CoachProfileSettingPageRoute());
                    } else {
                      context.router
                          .push(const StudentProfileSettingPageRoute());
                    }
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: width(20),
                        height: height(19),
                        child: AspectRatio(
                            aspectRatio: 10,
                            child: Image.asset(ImageAsset.profile)),
                      ),
                      const HeightWidget(2),
                      const NormalText(
                        "Profil",
                        color: kWhiteColor,
                        fontSize: 13,
                      ),
                    ],
                  ),
                ),
                const WidthWidget(20),
                const Spacer(),
                const NormalText(
                  Strings.appName,
                  color: kWhiteColor,
                ),
                const Spacer(),
                const NormalText(
                  "Name Surname",
                  color: kWhiteColor,
                  fontSize: 14,
                ),
              ],
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          HomeBodyWidget(
            mainProvider: mainProvider,
            scrollController: homepageScrollController,
          ),
          Positioned(
            bottom: height(65),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              width: SizeConfig.screenWidth,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.map,
                      size: 40,
                    ),
                  ),
                  // if (homeScrollArrowUp)
                  Consumer(
                    builder: (context, ref, child) {
                      final isVisible = ref.watch(_upArrowVisibilityProvider);
                      return AnimatedOpacity(
                        opacity: isVisible ? 1 : 0,
                        duration: const Duration(milliseconds: 100),
                        child: InkWell(
                          onTap: () => _scrollListAtTheTop(),
                          child: const CircleAvatar(
                            backgroundColor: kPrimaryColor,
                            radius: 20,
                            child: Icon(
                              Icons.arrow_upward,
                              size: 20,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
