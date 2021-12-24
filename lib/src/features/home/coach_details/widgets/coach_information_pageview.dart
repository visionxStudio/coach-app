import 'package:digicoach/src/common/constants/constants.dart';
import 'package:digicoach/src/common/widgets/size/custom_size_widget.dart';
import 'package:digicoach/src/common/widgets/text/custom_normal_text_widget.dart';
import 'package:digicoach/src/features/home/coach_details/bloc/coach_details_controller.dart';
import 'package:digicoach/src/features/home/data/coach_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CoachInformationPageview extends StatefulWidget {
  const CoachInformationPageview(
      {Key? key, required this.coachFile, required this.coachJourney})
      : super(key: key);
  final CoachJourney coachJourney;
  final CoachFile coachFile;

  @override
  State<CoachInformationPageview> createState() =>
      _CoachInformationPageviewState();
}

class _CoachInformationPageviewState extends State<CoachInformationPageview> {
  int currentPageIndex = 0;

  final PageController pageController = PageController();

  //pagecontrller
  List<Widget> coachPageList = [];
  @override
  void initState() {
    super.initState();
    coachPageList = [
      CoachDetailOne(
        coachFile: widget.coachFile,
      ),
      CoachDetailTwo(
        coachJourney: widget.coachJourney,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 250,
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        decoration: BoxDecoration(
          color: kNavBarBackgroundColor,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Consumer(
          builder: (ctx, ref, child) {
            final pageProvider = ref.watch(coachDetailControllerProvider);
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  height: 200,
                  child: PageView.builder(
                    itemCount: coachPageList.length,
                    onPageChanged: (int page) {
                      pageProvider.changePageViewIndex(value: page);
                    },
                    controller: pageController,
                    itemBuilder: (BuildContext context, int index) {
                      return coachPageList[index];
                    },
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    for (int i = 0; i < 2; i++)
                      if (i == pageProvider.pageViewIndex) ...[
                        circularIndicator(true)
                      ] else
                        circularIndicator(false),
                  ],
                ),
              ],
            );
          },
        ));
  }
}

class CoachDetailOne extends StatelessWidget {
  final CoachFile coachFile;
  const CoachDetailOne({
    Key? key,
    required this.coachFile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const NormalText(
            "Finche de coach",
            color: kPrimaryColor,
            fontSize: kDefaultFontSize - 4,
            fontWeight: FontWeight.w600,
          ),
          Column(
            children: [
              const NormalText(
                "Sexe",
                color: kBottonColor,
                fontSize: kDefaultFontSize - 4,
                fontWeight: FontWeight.w600,
              ),
              const HeightWidget(8.0),
              NormalText(
                coachFile.gender,
                color: kPrimaryColor,
                fontSize: kDefaultFontSize - 4,
                fontWeight: FontWeight.normal,
              )
            ],
          ),
          Column(
            children: [
              const NormalText(
                "Age",
                color: kBottonColor,
                fontSize: kDefaultFontSize - 4,
                fontWeight: FontWeight.w600,
              ),
              const HeightWidget(8.0),
              NormalText(
                "${coachFile.age} ans",
                color: kPrimaryColor,
                fontSize: kDefaultFontSize - 4,
                fontWeight: FontWeight.normal,
              )
            ],
          ),
          Column(
            children: [
              const NormalText(
                "Language",
                color: kBottonColor,
                fontSize: kDefaultFontSize - 4,
                fontWeight: FontWeight.w600,
              ),
              const HeightWidget(8.0),
              NormalText(
                coachFile.language.join(", "),
                color: kPrimaryColor,
                fontSize: kDefaultFontSize - 4,
                fontWeight: FontWeight.normal,
              )
            ],
          ),
        ],
      ),
    );
  }
}

// for CoachDetail 2
class CoachDetailTwo extends StatelessWidget {
  final CoachJourney coachJourney;
  const CoachDetailTwo({
    Key? key,
    required this.coachJourney,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const NormalText(
            "Parcours",
            color: kPrimaryColor,
            fontSize: kDefaultFontSize - 4,
            fontWeight: FontWeight.w600,
          ),
          Column(
            children: [
              const NormalText(
                "Diplôme",
                color: kBottonColor,
                fontSize: kDefaultFontSize - 4,
                fontWeight: FontWeight.w600,
              ),
              const HeightWidget(8.0),
              NormalText(
                coachJourney.diploma,
                color: kPrimaryColor,
                fontSize: kDefaultFontSize - 4,
                fontWeight: FontWeight.normal,
              )
            ],
          ),
          Column(
            children: [
              const NormalText(
                "Expérience",
                color: kBottonColor,
                fontSize: kDefaultFontSize - 4,
                fontWeight: FontWeight.w600,
              ),
              const HeightWidget(8.0),
              NormalText(
                "${coachJourney.experience} ans",
                color: kPrimaryColor,
                fontSize: kDefaultFontSize - 4,
                fontWeight: FontWeight.normal,
              )
            ],
          ),
          Column(
            children: [
              const NormalText(
                "Formation",
                color: kBottonColor,
                fontSize: kDefaultFontSize - 4,
                fontWeight: FontWeight.w600,
              ),
              const HeightWidget(8.0),
              NormalText(
                coachJourney.training,
                color: kPrimaryColor,
                fontSize: kDefaultFontSize - 4,
                fontWeight: FontWeight.normal,
              )
            ],
          ),
        ],
      ),
    );
  }
}

///circle indicatior of page displayed
Widget circularIndicator(bool isActive) {
  return AnimatedContainer(
    curve: Curves.linear,
    duration: const Duration(milliseconds: 600),
    margin: const EdgeInsets.symmetric(horizontal: 4),
    height: 8,
    width: isActive ? 16 : 8,
    decoration: isActive
        ? BoxDecoration(
            color: isActive ? kBottonColor : kTopMenuUnselectedColor,
            borderRadius: const BorderRadius.all(
              Radius.circular(12),
            ),
          )
        : const BoxDecoration(
            color: kTopMenuUnselectedColor,
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
          ),
  );
}
