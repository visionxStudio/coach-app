import 'package:digicoach/app_localization.dart';
import 'package:digicoach/src/common/constants/asset_image_link.dart';
import 'package:digicoach/src/common/constants/constants.dart';
import 'package:digicoach/src/common/utils/app_size_utils.dart';
import 'package:digicoach/src/common/widgets/input_field/minimal_input_field.dart';
import 'package:digicoach/src/common/widgets/size/custom_size_widget.dart';
import 'package:digicoach/src/common/widgets/text/custom_normal_text_widget.dart';
import 'package:digicoach/src/features/home/coach_details/bloc/coach_details_controller.dart';
import 'package:digicoach/src/features/home/coach_details/widgets/coach_description.dart';
import 'package:digicoach/src/features/home/coach_details/widgets/coach_information_pageview.dart';
import 'package:digicoach/src/features/home/coach_details/widgets/custom_tab_bar.dart';
import 'package:digicoach/src/features/home/data/coach_list.dart';
import 'package:digicoach/src/features/home/widgets/coach_dashboarddisplay_item_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CoachDetails extends ConsumerStatefulWidget {
  const CoachDetails({Key? key, required this.coachDetail}) : super(key: key);
  final CoachModel coachDetail;

  @override
  _CoachDetailsState createState() => _CoachDetailsState();
}

class _CoachDetailsState extends ConsumerState<CoachDetails> {
  List<int> val = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.95,
      maxChildSize: 0.95,
      minChildSize: 0.85,
      builder: (_, controller) {
        return Container(
          decoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: BorderRadius.circular(16.0),
          ),
          // height: MediaQuery.of(context).size.height - 50,
          child: SingleChildScrollView(
            controller: controller,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const HeightWidget(16.0),
                const TopNotch(),
                const HeightWidget(kDefaultmargin),
                CoachDashboardDisplayItemWidget(
                  item: widget.coachDetail,
                  showPricing: false,
                ),
                const HeightWidget(kDefaultmargin),
                const TabBar(),
                const HeightWidget(kDefaultmargin),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          CoachDescription(
                              description: widget.coachDetail.description),
                          const HeightWidget(kDefaultmargin),
                          CoachInformationPageview(
                            coachFile: widget.coachDetail.coachFile,
                            coachJourney: widget.coachDetail.coachJourney,
                          ),
                          const HeightWidget(kDefaultmargin),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const NormalText(
                                "LES +",
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: kPrimaryColor,
                              ),
                              const HeightWidget(kDefaultmargin - 8),
                              SizedBox(
                                width: double.infinity,
                                // height: 30.0,
                                child: Wrap(
                                  children: [
                                    ...val.map(
                                      (e) => Container(
                                        margin:
                                            const EdgeInsets.only(right: 4.0),
                                        child: Chip(
                                          // backgroundColor: kWhiteColor,
                                          label: NormalText(
                                            "skill $e",
                                            fontSize: kDefaultFontSize - 8,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const HeightWidget(kDefaultmargin),
                          const BadgesEarned(
                            bronze: true,
                            silver: true,
                            gold: false,
                            trophy: false,
                          ),
                        ],
                      ),
                      const HeightWidget(kDefaultmargin + 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          NormalText(
                            "coach_bottomsheet.comments".tr(context),
                            color: kPrimaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: kDefaultFontSize - 4,
                          ),
                          const HeightWidget(kDefaultmargin),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                ImageAsset.avatar1,
                                height: 32.0,
                                width: 32.0,
                              ),
                              const WidthWidget(16.0),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const NormalText(
                                    "Bessie Cooper",
                                    fontSize: kDefaultFontSize - 4,
                                    color: kBlackColor,
                                  ),
                                  const NormalText(
                                    "3 mins ago",
                                    color: kLightBlueTextColor,
                                    fontSize: kDefaultFontSize - 6,
                                  ),
                                  const HeightWidget(kDefaultmargin),
                                  SizedBox(
                                    width: SizeConfig.screenWidth * 0.7,
                                    child: const NormalText(
                                      "Je pratique la méditation depuis maintenant 6 ans, je me suis spécialisé au vietnam dans  les pratiques cognitives de bien-être.",
                                      fontSize: kDefaultFontSize - 6,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          const HeightWidget(kDefaultmargin),
                          SizedBox(
                            width: double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                NormalText(
                                  "coach_bottomsheet.more_comments".tr(context),
                                  color: kBottonColor,
                                  fontSize: kDefaultFontSize - 6,
                                ),
                                const WidthWidget(8.0),
                                const RotatedBox(
                                    quarterTurns: 5,
                                    child: Icon(
                                      Icons.arrow_forward_ios,
                                      color: kBottonColor,
                                      size: 12.0,
                                    ))
                              ],
                            ),
                          ),
                          const HeightWidget(kDefaultmargin),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset(
                                ImageAsset.avatar2,
                                height: 32.0,
                                width: 32.0,
                              ),
                              const WidthWidget(8.0),
                              const Expanded(
                                child: MinimalInputField(
                                  hintText: "Add a Comment",
                                  backgroundColor: kScafoldColor,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      const HeightWidget(kDefaultmargin + 50),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

class BadgesEarned extends StatelessWidget {
  const BadgesEarned({
    Key? key,
    required this.bronze,
    required this.silver,
    required this.gold,
    required this.trophy,
  }) : super(key: key);

  final bool bronze;
  final bool silver;
  final bool gold;
  final bool trophy;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        NormalText(
          "coach_bottomsheet.badges".tr(context),
          fontSize: 24.0,
          color: kPrimaryColor,
          fontWeight: FontWeight.w500,
        ),
        const HeightWidget(16.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Opacity(
                opacity: bronze ? 1.0 : 0.2,
                child: Image.asset(
                  ImageAsset.bronze,
                  height: 40.0,
                ),
              ),
            ),
            const Spacer(),
            Expanded(
              child: Opacity(
                opacity: silver ? 1.0 : 0.2,
                child: Image.asset(
                  ImageAsset.silver,
                  height: 40.0,
                ),
              ),
            ),
            const Spacer(),
            Expanded(
              child: Opacity(
                opacity: gold ? 1.0 : 0.2,
                child: Image.asset(
                  ImageAsset.gold,
                  height: 40.0,
                ),
              ),
            ),
            const Spacer(),
            Expanded(
              child: Opacity(
                opacity: trophy ? 1.0 : 0.2,
                child: Image.asset(
                  ImageAsset.trophy,
                  height: 40.0,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class TabBar extends StatelessWidget {
  const TabBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final coachDetailProvider = ref.watch(coachDetailControllerProvider);
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  coachDetailProvider.changeCoachDetailIndex(value: 0);
                },
                child: CustomTabBar(
                  tabLabel: "coach_bottomsheet.regards".tr(context),
                  isActive: coachDetailProvider.index == 0,
                ),
              ),
              const WidthWidget(16.0),
              InkWell(
                onTap: () {
                  coachDetailProvider.changeCoachDetailIndex(value: 1);
                },
                child: CustomTabBar(
                  tabLabel: "coach_bottomsheet.course".tr(context),
                  isActive: coachDetailProvider.index == 1,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class TopNotch extends StatelessWidget {
  const TopNotch({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 5.0,
        width: MediaQuery.of(context).size.width * 0.15,
        decoration: BoxDecoration(
          color: kLightGrey.withOpacity(0.2),
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }
}
