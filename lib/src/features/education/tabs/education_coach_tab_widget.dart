import 'package:digicoach/src/common/constants/asset_image_link.dart';
import 'package:digicoach/src/common/constants/constants.dart';
import 'package:digicoach/src/common/utils/app_size_utils.dart';
import 'package:digicoach/src/common/widgets/size/custom_size_widget.dart';
import 'package:digicoach/src/common/widgets/text/custom_normal_text_widget.dart';
import 'package:digicoach/src/features/education/education_controller.dart';
import 'package:digicoach/src/features/home/widgets/search_input_fiel_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EducationCoachTabView extends ConsumerWidget {
  const EducationCoachTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final eduController = ref.watch(educationProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
      child: Column(
        children: [
          const HeightWidget(5),
          const SearchInputFieldWidget(),
          const HeightWidget(8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  eduController.changeFavoritSelectTab();
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: kDefaultmargin / 4),
                  padding: const EdgeInsets.symmetric(
                      horizontal: kDefaultPadding,
                      vertical: kDefaultPadding / 4),
                  decoration: BoxDecoration(
                      color: eduController.isFavorisSelectTab
                          ? kLightGreyColor
                          : null,
                      borderRadius: BorderRadius.circular(10)),
                  child: const NormalText(
                    "Favoris",
                    fontSize: kDefaultFontSize - 1,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  eduController.changeFavoritSelectTab();
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: kDefaultmargin / 4),
                  padding: const EdgeInsets.symmetric(
                      horizontal: kDefaultPadding,
                      vertical: kDefaultPadding / 4),
                  decoration: BoxDecoration(
                      color: eduController.isFavorisSelectTab
                          ? null
                          : kLightGreyColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: const NormalText(
                    "Tous",
                    fontSize: kDefaultFontSize - 1,
                  ),
                ),
              )
            ],
          ),
          const HeightWidget(10),
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              children: [
                !eduController.isFavorisSelectTab
                    ? ListView.builder(
                        shrinkWrap: true,
                        itemCount: 15,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return const EducationCoachUserInfoWidget();
                        })
                    : ListView.builder(
                        shrinkWrap: true,
                        itemCount: 3,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return const EducationCoachUserInfoWidget();
                        }),
              ],
            ),
          ))
        ],
      ),
    );
  }
}

class EducationCoachUserInfoWidget extends StatelessWidget {
  const EducationCoachUserInfoWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
          width: double.infinity,
          height: height(60),
          margin: const EdgeInsets.symmetric(
              vertical: kDefaultmargin / 3, horizontal: kDefaultmargin / 4),
          padding: const EdgeInsets.all(
            kDefaultPadding / 2,
          ),
          child: Row(
            children: [
              Container(
                width: width(5),
                margin: const EdgeInsets.only(right: kDefaultmargin),
                height: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  gradient: LinearGradient(
                    end: Alignment.topLeft,
                    begin: Alignment.bottomRight,
                    colors: <Color>[
                      Color(0xFF65C7F7),
                      Color(0xFF0052D4),
                    ], // red to yellow
                  ),
                ),
              ),
              Expanded(
                  flex: 9,
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            NormalText(
                              "Cameron Williamson",
                              fontSize: kDefaultFontSize - 2,
                              isBold: true,
                            ),
                            HeightWidget(4),
                            NormalText(
                              "a month ago",
                              fontSize: kDefaultFontSize - 6,
                              color: ksearchText,
                              isBold: true,
                            )
                          ],
                        ),
                      ),
                      const CircleAvatar(
                          radius: 40,
                          backgroundImage: AssetImage(
                            ImageAsset.testprofile,
                          ))
                    ],
                  ))
            ],
          )),
    );
  }
}
