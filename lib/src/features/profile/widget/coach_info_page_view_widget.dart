import 'package:digicoach/src/common/constants/asset_image_link.dart';
import 'package:digicoach/src/common/constants/constants.dart';
import 'package:digicoach/src/common/utils/app_size_utils.dart';
import 'package:digicoach/src/common/widgets/size/custom_size_widget.dart';
import 'package:digicoach/src/common/widgets/text/custom_normal_text_widget.dart';
import 'package:digicoach/src/common/widgets/text/shader_text.dart';
import 'package:digicoach/src/features/profile/coach_profile_page.dart';
import 'package:flutter/material.dart';

class CoachInformationPageView extends StatefulWidget {
  const CoachInformationPageView({Key? key}) : super(key: key);

  @override
  State<CoachInformationPageView> createState() =>
      _CoachInformationPageViewState();
}

class _CoachInformationPageViewState extends State<CoachInformationPageView> {
  int currentPageIndex = 0;

  //pagecontrller
  final PageController pageController = PageController();

  List<Widget> coachPageList = const [
    CoachFileOne(
      index: 0,
    ),
    CoachFileOne(
      index: 1,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height(410),
      child: Stack(
        children: [
          PageView.builder(
            physics: const ClampingScrollPhysics(),
            itemCount: coachPageList.length,
            onPageChanged: (int page) {
              // getChangedPageAndMoveBar(page);
            },
            controller: pageController,
            itemBuilder: (context, index) {
              return coachPageList[index];
            },
          ),
        ],
      ),
    );
  }
}

class CoachFileOne extends StatelessWidget {
  final int index;
  const CoachFileOne({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: kWhiteColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: kBlackColor),
      ),
      child: Column(
        children: [
          const ShaderText(text: "Fiche du coach"),
          const HeightWidget(20),
          const CoachGeneralInformationWidgt(
              image: ImageAsset.gender, title: "Sexe", value: "Femme"),
          const HeightWidget(10),
          const CoachGeneralInformationWidgt(
              image: ImageAsset.age, title: "Âge", value: "26 ans"),
          const HeightWidget(10),
          const CoachGeneralInformationWidgt(
              image: ImageAsset.speak,
              title: "Langue des cours",
              value: "Anglais, Russe"),
          const HeightWidget(10),
          Row(
            children: [
              const WidthWidget(20),
              Icon(
                Icons.list_alt,
                size: height(35),
              ),
              SizedBox(
                width: SizeConfig.screenWidth - width(100),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    NormalText(
                      "Type of Course",
                      fontSize: kDefaultFontSize,
                      isCentered: true,
                    ),
                    HeightWidget(5),
                    NormalText(
                      """Méditation en pleine conscience
Yoga Méditation
Vipassana""",
                      fontSize: kDefaultFontSize - 4,
                      color: ksearchText,
                      isCentered: true,
                    )
                  ],
                ),
              )
            ],
          ),
          const HeightWidget(20),
          NormalText('${index + 1}/2'),
          const HeightWidget(10),
          Container(
            margin: const EdgeInsets.only(bottom: 15),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                for (int i = 0; i < 2; i++)
                  if (i == index) ...[circleBar(true)] else circleBar(false),
              ],
            ),
          ),
          const HeightWidget(10),
        ],
      ),
    );
  }
}

///circle indicatior of page displayed
Widget circleBar(bool isActive) {
  return AnimatedContainer(
    curve: Curves.linear,
    duration: const Duration(milliseconds: 200),
    margin: const EdgeInsets.symmetric(horizontal: 8),
    height: isActive ? 16 : 12,
    width: isActive ? 16 : 12,
    decoration: isActive
        ? const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xff9CECFB),
                Color(0xff65C7F7),
                Color(0xff0052D4),
              ],
              begin: Alignment.bottomLeft,
              end: Alignment.topLeft,
            ),
            // color: isActive ? kIndicatorColor3 : kSecondaryColor,
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
          )
        : BoxDecoration(
            color: kWhiteColor,
            border: Border.all(color: kBlackColor),
            borderRadius: const BorderRadius.all(
              Radius.circular(12),
            ),
          ),
  );
}

class CoachFileTwo extends StatelessWidget {
  const CoachFileTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
