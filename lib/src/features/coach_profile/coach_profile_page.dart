import 'package:digicoach/src/common/constants/asset_image_link.dart';
import 'package:digicoach/src/common/constants/constants.dart';
import 'package:digicoach/src/common/utils/app_size_utils.dart';
import 'package:digicoach/src/common/widgets/size/custom_size_widget.dart';
import 'package:digicoach/src/common/widgets/text/custom_normal_text_widget.dart';
import 'package:digicoach/src/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_svg/svg.dart';

class CoachProfilePage extends StatelessWidget {
  const CoachProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kScafoldColor,
        appBar: AppBar(
          backgroundColor: kWhiteColor,
          elevation: 0,
          leading: BackButton(
            onPressed: () {
              context.router.navigateBack();
            },
            color: kPrimaryColor,
          ),
          title: const NormalText(
            'coach_profile_page.title',
            isBold: true,
            color: kPrimaryColor,
            fontSize: 14,
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
              child: Column(
            children: [
              const HeightWidget(10),
              const TopCoachHeaderProfileDetailWidget(),
              const HeightWidget(10),
              Container(
                height: height(130),
                color: kWhiteColor,
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Flexible(
                      child: QualityMesurementWidget(
                        value: "3",
                        color: kGreen,
                        option: "coach_profile_page.sizeweight",
                      ),
                    ),
                    Flexible(
                      child: QualityMesurementWidget(
                        value: "9",
                        color: kGreen,
                        option: "coach_profile_page.flexibility",
                      ),
                    ),
                    Flexible(
                      child: QualityMesurementWidget(
                        value: "6",
                        color: kCircleColor1,
                        option: "coach_profile_page.sleep",
                      ),
                    ),
                    Flexible(
                      child: QualityMesurementWidget(
                        value: "6",
                        color: kGreen,
                        option: "coach_profile_page.stress",
                      ),
                    ),
                    Flexible(
                      child: QualityMesurementWidget(
                        value: "10",
                        color: kCircleColor,
                        option: "coach_profile_page.qualityeating",
                      ),
                    )
                  ],
                ),
              ),
              const HeightWidget(10),
              Container(
                color: kWhiteColor,
                padding: const EdgeInsets.only(
                    top: kDefaultmargin / 2,
                    bottom: kDefaultmargin,
                    left: kDefaultPadding / 2,
                    right: kDefaultPadding / 2),
                margin:
                    const EdgeInsets.symmetric(vertical: kDefaultmargin / 2),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        NormalText(
                          "coach_profile_page.globalinfo",
                          color: kPrimaryColor,
                          fontSize: 14,
                          isBold: true,
                        ),
                        Icon(
                          Icons.help,
                          color: kDarkGrey,
                        )
                      ],
                    ),
                    const HeightWidget(10),
                    Row(
                      children: const [
                        Expanded(
                          child: MenuScoreItemWidget(
                            value: "24",
                            icon: IconAsset.carryout,
                            title: "coach_profile_page.coursecarryout",
                          ),
                        ),
                        WidthWidget(10),
                        Expanded(
                          child: MenuScoreItemWidget(
                            value: "54h",
                            icon: IconAsset.watch,
                            title: "coach_profile_page.totaltime",
                          ),
                        ),
                      ],
                    ),
                    const HeightWidget(10),
                    Row(
                      children: const [
                        Expanded(
                          child: MenuScoreItemWidget(
                            value: "24",
                            icon: IconAsset.badge,
                            title: "coach_profile_page.badges",
                          ),
                        ),
                        WidthWidget(10),
                        Expanded(
                          child: MenuScoreItemWidget(
                            value: "24",
                            icon: IconAsset.chatss,
                            title: "coach_profile_page.comments",
                          ),
                        ),
                      ],
                    ),
                    const HeightWidget(10),
                    Row(
                      children: const [
                        MenuScoreItemWidget(
                          value: "24",
                          icon: IconAsset.stars,
                          title: "coach_profile_page.note",
                        ),
                      ],
                    ),
                    const HeightWidget(30),
                  ],
                ),
              ),
              const HeightWidget(10),
              Container(
                color: kWhiteColor,
                padding: const EdgeInsets.symmetric(
                    vertical: kDefaultPadding, horizontal: kDefaultPadding),
                margin: const EdgeInsets.symmetric(vertical: kDefaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const NormalText(
                      "coach_profile_page.inregards",
                      fontSize: 14,
                      color: kPrimaryColor,
                    ),
                    const HeightWidget(10),
                    const NormalText(
                      "Je suis assez sportif, je fais un peu de couse à pied et j’aime bien la méditation. Je manque sérieusement de souplesse et j’aimerai progresser. Je souhaite devenir plus fort physiquement.",
                      fontSize: 14,
                    ),
                    const HeightWidget(10),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: kDefaultPadding,
                          horizontal: kDefaultPadding),
                      margin: const EdgeInsets.symmetric(
                          vertical: kDefaultPadding,
                          horizontal: kDefaultPadding),
                      decoration: BoxDecoration(
                          color: kScafoldColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: [
                          const NormalText("coach_profile_page.coachfile"),
                          const HeightWidget(20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              FieldandValueWidget(
                                title: "coach_profile_page.sex",
                                value: "coach_profile_page.women",
                              ),
                              FieldandValueWidget(
                                title: "coach_profile_page.weight",
                                value: "100",
                              ),
                            ],
                          ),
                          const HeightWidget(10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              FieldandValueWidget(
                                title: "coach_profile_page.age",
                                value: "26ans",
                              ),
                              FieldandValueWidget(
                                title: "coach_profile_page.cut",
                                value: "1m74",
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    const HeightWidget(10)
                  ],
                ),
              ),
              const HeightWidget(10),
            ],
          )),
        ));
  }
}

class FieldandValueWidget extends StatelessWidget {
  final String title;
  final String value;

  const FieldandValueWidget({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Column(
        children: [
          NormalText(
            title,
            color: kBottonColor,
            fontSize: 14,
            isBold: true,
          ),
          const HeightWidget(8),
          NormalText(
            value,
            color: kPrimaryColor,
            fontSize: 14,
          )
        ],
      ),
    );
  }
}

class MenuScoreItemWidget extends StatelessWidget {
  final String title;
  final String icon;
  final String value;
  const MenuScoreItemWidget({
    Key? key,
    required this.title,
    required this.icon,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: kScafoldColor, borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NormalText(
            title,
            fontSize: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.symmetric(
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                    color: kNavBarBackgroundColor,
                    borderRadius: BorderRadius.circular(10)),
                child: SvgPicture.asset(
                  icon,
                  height: 21,
                  width: 19,
                ),
              ),
              const WidthWidget(10),
              NormalText(
                value,
                fontSize: kDefaultFontSize + 2,
                color: kPrimaryColor,
              )
            ],
          )
        ],
      ),
    );
  }
}

class QualityMesurementWidget extends StatelessWidget {
  final String value;
  final String option;
  final Color color;
  const QualityMesurementWidget({
    Key? key,
    required this.value,
    required this.option,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundColor: color,
          child: NormalText(
            value,
            color: kWhiteColor,
            fontSize: 20,
          ),
        ),
        const HeightWidget(5),
        NormalText(
          option,
          fontSize: 10,
          color: kCircleOptionColor,
          isCentered: true,
        )
      ],
    );
  }
}

class TopCoachHeaderProfileDetailWidget extends StatefulWidget {
  const TopCoachHeaderProfileDetailWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<TopCoachHeaderProfileDetailWidget> createState() =>
      _TopCoachHeaderProfileDetailWidgetState();
}

class _TopCoachHeaderProfileDetailWidgetState
    extends State<TopCoachHeaderProfileDetailWidget> {
  List<String> tagdetail = [
    'Augmenter la musculature et la masse',
    'Force physique',
    'Perte de poids',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kWhiteColor,
      margin: const EdgeInsets.symmetric(vertical: kDefaultmargin / 2),
      padding: const EdgeInsets.symmetric(
          vertical: kDefaultPadding, horizontal: kDefaultPadding / 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: const [
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage(ImageAsset.testprofile),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: CircleAvatar(
                    radius: 12,
                    backgroundColor: kBottonColor,
                    child: Icon(
                      Icons.check,
                      color: kWhiteColor,
                      size: 14,
                    )),
              )
            ],
          ),
          const WidthWidget(10),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const NormalText(
                "Emery Saris",
                fontSize: kDefaultFontSize - 4,
              ),
              const HeightWidget(5),
              Row(
                children: const [
                  NormalText(
                    "9855072319",
                    fontSize: kDefaultFontSize - 6,
                    color: kLightBlueTextColor,
                  ),
                  VerticalDivider(
                    width: 10,
                  ),
                  NormalText(
                    "abc@gmail.com",
                    fontSize: kDefaultFontSize - 6,
                    color: kLightBlueTextColor,
                  ),
                ],
              ),
              const HeightWidget(5),
              Wrap(
                children: [
                  ...tagdetail.map(
                    (e) => Container(
                      margin: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                          color: kNavBarBackgroundColor,
                          borderRadius: BorderRadius.circular(10)),
                      padding: const EdgeInsets.all(5),
                      child: NormalText(
                        e,
                        fontSize: 10,
                        color: kCoursesTextColor,
                      ),
                    ),
                  ),
                ],
              ),
              const HeightWidget(5),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: kProfileEditbuttonColor)),
                    child: InkWell(
                      onTap: () {
                        context.router.push(const ProfileModifyPageRoute());
                      },
                      child: Row(
                        children: const [
                          Icon(
                            Icons.edit,
                            color: kscheduleTextColor,
                            size: 10,
                          ),
                          WidthWidget(5),
                          WidthWidget(5),
                          NormalText(
                            'coach_profile_page.modify',
                            fontSize: 10,
                            color: kscheduleTextColor,
                            isBold: true,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ))
        ],
      ),
    );
  }
}
