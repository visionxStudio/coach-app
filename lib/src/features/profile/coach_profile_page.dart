import 'package:digicoach/src/common/constants/asset_image_link.dart';
import 'package:digicoach/src/common/constants/constants.dart';
import 'package:digicoach/src/common/utils/app_size_utils.dart';
import 'package:digicoach/src/common/widgets/size/custom_size_widget.dart';
import 'package:digicoach/src/common/widgets/text/custom_normal_text_widget.dart';
import 'package:digicoach/src/features/profile/data/like_comment_reply_model.dart';
import 'package:digicoach/src/features/profile/profile_controller.dart';
import 'package:digicoach/src/features/profile/widget/coach_info_page_view_widget.dart';
import 'package:digicoach/src/features/home/widgets/icon_with_number_like_comment_average_widget.dart';
import 'package:digicoach/src/features/main_dashboard_container/data/coach_student_detail_model.dart';
import 'package:digicoach/src/features/profile/widget/user_like_comment_widget.dart';
import 'package:digicoach/src/routes/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CoachProfilePage extends ConsumerWidget {
  final CoachStudentModel model;
  const CoachProfilePage({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(profileController);
    return Scaffold(
        backgroundColor: kSecondaryColor,
        appBar: profileAppbar(context),
        body: BodyWidget(provider: provider, model: model));
  }

  AppBar profileAppbar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: BackButton(
        onPressed: () {
          context.router.navigateBack();
        },
        color: kPrimaryColor,
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: kDefaultPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                model.coachingImage,
                color: kBlackColor,
                height: 38,
                fit: BoxFit.fitHeight,
              ),
              const HeightWidget(4),
              NormalText(
                model.coachtype.toUpperCase(),
                color: kBlackColor,
                fontSize: kDefaultFontSize - 6,
              )
            ],
          ),
        )
      ],
    );
  }
}

class BodyWidget extends StatefulWidget {
  const BodyWidget({
    Key? key,
    required this.provider,
    required this.model,
  }) : super(key: key);

  final ProfileController provider;
  final CoachStudentModel model;

  @override
  State<BodyWidget> createState() => _BodyWidgetState();
}

class _BodyWidgetState extends State<BodyWidget> {
  @override
  void initState() {
    super.initState();
    widget.provider.scrollController = ScrollController();
    widget.provider.scrollController.addListener(() {
      widget.provider.hideAndShowProfileImage(
          widget.provider.scrollController.position.pixels);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
          child: Stack(
        children: [
          SingleChildScrollView(
            controller: widget.provider.scrollController,
            child: Column(
              children: [
                const HeightWidget(80),
                Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          color: kHomeBackground,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30))),
                      child: Column(children: [
                        const HeightWidget(10),
                        FavAndAddressSectionWidget(model: widget.model),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            NormalText(
                              widget.model.name,
                              fontSize: kDefaultFontSize + 2,
                            ),
                            const HeightWidget(10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                IconWithNumberWidget(
                                  imageIcon: ImageAsset.heart,
                                  number: widget.model.heart.toString(),
                                ),
                                const WidthWidget(20),
                                IconWithNumberWidget(
                                  imageIcon: ImageAsset.msg,
                                  number: widget.model.comment.toString(),
                                ),
                                const WidthWidget(20),
                                IconWithNumberWidget(
                                  imageIcon: ImageAsset.star,
                                  number:
                                      widget.model.averageRating.toString() +
                                          "/5",
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: kDefaultPadding,
                                  vertical: kDefaultPadding / 2),
                              child: Column(
                                children: const [
                                  Align(
                                      alignment: Alignment.topLeft,
                                      child: NormalText(
                                        "À propos",
                                        isBold: true,
                                      )),
                                  HeightWidget(8),
                                  NormalText(
                                      """Je pratique la méditation depuis maintenant 6 ans, je me suis spécialisé au vietnam dans                                             les pratiques cognitives de bien-être. J’adore ce que je fais et j’essaie de guider mes élèves jusqu’à atteindre leur objectif.                                            Je suis de nature très calme, curieux et très social.
                                        Je vous attends pour une session de bien-être. Sautez le pas !"""),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const CoachInformationPageView(),
                        const HeightWidget(10),
                        if (widget.provider.userLikeCommentList.isNotEmpty)
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                                vertical: kDefaultmargin,
                                horizontal: kDefaultmargin / 2),
                            margin: const EdgeInsets.symmetric(
                                vertical: kDefaultmargin / 2),
                            decoration: BoxDecoration(
                              color: kWhiteColor,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Column(
                              children: [
                                const Divider(),
                                ListView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: widget
                                        .provider.userLikeCommentList.length,
                                    itemBuilder: (context, index) {
                                      LikeCommentReplyModel userComment = widget
                                          .provider.userLikeCommentList[index];
                                      return UserCommentAndReplytWidget(
                                        index: index,
                                        model: userComment,
                                        subcommet: false,
                                      );
                                    }),
                              ],
                            ),
                          ),
                      ]),
                    ),
                  ],
                ),
              ],
            ),
          ),
          if (widget.provider.showProfileImage)
            Positioned(
              top: kDefaultmargin + 5,
              child: Container(
                width: SizeConfig.screenWidth,
                height: height(120),
                alignment: Alignment.topCenter,
                //color: kGreyColor,
                child: CircleAvatar(
                  radius: 60,
                  backgroundColor: kSecondaryColor,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(widget.model.profile),
                  ),
                ),
              ),
            )
        ],
      )),
      BottomProfileChatAndFeeWidget(model: widget.model)
    ]);
  }

  @override
  void dispose() {
    widget.provider.scrollController.dispose();
    super.dispose();
  }
}

class DotWidget extends StatelessWidget {
  const DotWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: kDefaultmargin / 2),
      padding: const EdgeInsets.only(
          left: kDefaultPadding, right: kDefaultPadding / 3),
      width: width(5),
      height: height(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: kReplyMessageBorderColor,
      ),
    );
  }
}

class CoachGeneralInformationWidgt extends StatelessWidget {
  final String image;
  final String title;
  final String value;
  const CoachGeneralInformationWidgt({
    Key? key,
    required this.title,
    required this.value,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const WidthWidget(20),
        Image.asset(
          image,
          height: height(35),
        ),
        SizedBox(
          width: SizeConfig.screenWidth - width(130),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              NormalText(title, fontSize: kDefaultFontSize),
              const HeightWidget(5),
              NormalText(
                value,
                fontSize: kDefaultFontSize - 4,
                color: ksearchText,
              )
            ],
          ),
        )
      ],
    );
  }
}

class FavAndAddressSectionWidget extends StatelessWidget {
  const FavAndAddressSectionWidget({
    Key? key,
    required this.model,
  }) : super(key: key);

  final CoachStudentModel model;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const NormalText(
                "Favoris",
                fontSize: kDefaultFontSize - 7,
              ),
              Switch(value: true, onChanged: (value) {})
            ],
          ),
        ),
        Padding(
            padding: const EdgeInsets.only(right: kDefaultPadding),
            child: SizedBox(
              width: width(105),
              child: Row(
                children: [
                  const Icon(Icons.place),
                  Expanded(
                    child: NormalText(
                      model.address,
                      maxline: 1,
                    ),
                  )
                ],
              ),
            ))
      ],
    );
  }
}

///it will be at the bottom of the profile where it display chat and button
///to buy seat for particular coach.
class BottomProfileChatAndFeeWidget extends StatelessWidget {
  const BottomProfileChatAndFeeWidget({
    Key? key,
    required this.model,
  }) : super(key: key);

  final CoachStudentModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: kLightestGreyColor, border: Border.all(color: kBlackColor)),
      height: height(71),
      child: Row(
        children: [
          InkWell(
            onTap: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const WidthWidget(20),
                Image.asset(
                  IconAsset.chatIcon,
                  color: kPrimaryColor,
                  height: height(42),
                  fit: BoxFit.fitHeight,
                ),
                const WidthWidget(10),
                const NormalText(
                  "Discuter",
                  isBold: true,
                  fontSize: kDefaultFontSize - 4,
                )
              ],
            ),
          ),
          const Spacer(),
          Container(
            width: width(114),
            height: height(49),
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: InkWell(
              onTap: () {
                context.router.push(const BookingPageRoute());
              },
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const NormalText(
                      "Réserver",
                      color: kWhiteColor,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        NormalText(
                          model.fee.toString(),
                          isBold: true,
                          color: kGreen,
                          fontSize: kDefaultFontSize,
                        ),
                        const Icon(
                          Icons.euro,
                          color: kGreen,
                          size: kDefaultFontSize - 2,
                        ),
                      ],
                    )
                  ]),
            ),
          ),
          const WidthWidget(20),
        ],
      ),
    );
  }
}
