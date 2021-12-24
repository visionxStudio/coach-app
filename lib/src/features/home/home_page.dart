import 'package:digicoach/app_localization.dart';
import 'package:digicoach/src/common/constants/asset_image_link.dart';
import 'package:digicoach/src/common/constants/constants.dart';
import 'package:digicoach/src/common/utils/app_size_utils.dart';
import 'package:digicoach/src/common/widgets/size/custom_size_widget.dart';
import 'package:digicoach/src/common/widgets/text/custom_normal_text_widget.dart';
import 'package:digicoach/src/features/home/widgets/custom_chip.dart';
import 'package:digicoach/src/features/home/widgets/custom_switch.dart';
import 'package:digicoach/src/features/home/widgets/home_body_widget.dart';
import 'package:digicoach/src/features/home/widgets/search_input_fiel_widget.dart';
import 'package:digicoach/src/features/main_dashboard_container/bloc/main_dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:auto_route/auto_route.dart';
import 'package:digicoach/src/routes/router.dart';

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
    if (mainProvider.coachDetailList.isEmpty) {
      return const Center(
        child: NormalText("NO DATA FOUND"),
      );
    }
    return Scaffold(
      backgroundColor: kScafoldColor,
      appBar: PreferredSize(
        preferredSize: Size(SizeConfig.screenWidth, 170),
        child: SafeArea(
          child: Container(
            color: kScafoldColor,
            padding: const EdgeInsets.symmetric(
                horizontal: kDefaultPadding, vertical: kDefaultPadding / 2),
            child: Column(
              children: [
                const HomePageSearch(),
                Row(
                  children: [
                    CustomChip(
                      title: "homepage.live".tr(context),
                      isActive: true,
                    ),
                    CustomChip(
                      title: "homepage.video".tr(context),
                    ),
                    CustomChip(
                      title: "homepage.home".tr(context),
                    ),
                  ],
                ),
                const HeightWidget(8.0),
                HomePageSwitch(
                  ref: ref,
                  mainProvider: mainProvider,
                )
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
            bottom: height(80),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              width: SizeConfig.screenWidth,
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisAlignment: MainAxisAlignment.end,

                children: [
                  // InkWell(
                  //   onTap: () {
                  //     context.router.push(const MapPageRoute());
                  //   },
                  //   child: Container(
                  //     padding: const EdgeInsets.all(10),
                  //     decoration: BoxDecoration(
                  //       color: kPrimaryColor,
                  //       borderRadius: BorderRadius.circular(20),
                  //     ),
                  //     child: Row(
                  //       crossAxisAlignment: CrossAxisAlignment.center,
                  //       children: const [
                  //         Icon(
                  //           Icons.place_outlined,
                  //           color: kWhiteColor,
                  //           size: kDefaultFontSize - 3,
                  //         ),
                  //         WidthWidget(8),
                  //         NormalText(
                  //           "Place",
                  //           color: kWhiteColor,
                  //           fontSize: kDefaultFontSize - 8,
                  //         ),
                  //         WidthWidget(10),
                  //       ],
                  //     ),
                  //   ),
                  // ),

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

class HomePageSearch extends StatelessWidget {
  const HomePageSearch({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Expanded(child: SearchInputFieldWidget()),
        const WidthWidget(8.0),
        Container(
          height: 46.0,
          width: 46.0,
          decoration: BoxDecoration(
            color: kNavBarBackgroundColor,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: GestureDetector(
            onTap: () => context.router.push(const MessagePageRoute()),
            child: Stack(
              children: [
                Center(
                  child: Image.asset(
                    IconAsset.chatHome,
                    height: 25.0,
                    width: 25.0,
                  ),
                ),
                Positioned(
                  right: 12.0,
                  top: 12.0,
                  child: Container(
                    height: 10.0,
                    width: 10.0,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class HomePageSwitch extends StatelessWidget {
  const HomePageSwitch({
    Key? key,
    required this.mainProvider,
    required this.ref,
  }) : super(key: key);

  final WidgetRef ref;
  final MainDashboardProvider mainProvider;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (ctx, watch, child) {
        return Container(
          padding: const EdgeInsets.all(4.0),
          decoration: BoxDecoration(
            color: kChipColor,
            borderRadius: BorderRadius.circular(25.0),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomSwitch(
                title: "homepage.coach".tr(context),
                // isActive: switchIndex == 0,
                isActive: mainProvider.topmenuIndex == 3,
                onTap: () {
                  mainProvider.changeTopMenuIndex(3);
                },
              ),
              const WidthWidget(4.0),
              CustomSwitch(
                title: "homepage.recontres".tr(context),
                isActive: mainProvider.topmenuIndex == 4,
                onTap: () {
                  mainProvider.changeTopMenuIndex(4);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
