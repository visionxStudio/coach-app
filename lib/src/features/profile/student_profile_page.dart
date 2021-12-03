import 'package:digicoach/src/common/constants/asset_image_link.dart';
import 'package:digicoach/src/common/constants/constants.dart';
import 'package:digicoach/src/common/utils/app_size_utils.dart';
import 'package:digicoach/src/common/widgets/appbar/appbar_background.dart';
import 'package:digicoach/src/common/widgets/size/custom_size_widget.dart';
import 'package:digicoach/src/common/widgets/text/custom_normal_text_widget.dart';
import 'package:digicoach/src/common/widgets/text/shader_text.dart';
import 'package:digicoach/src/features/dashboard/dashboard.dart';
import 'package:digicoach/src/features/main_dashboard_container/data/coach_student_detail_model.dart';
import 'package:digicoach/src/features/message/bloc/message_controller.dart';
import 'package:digicoach/src/features/navbar/navbar.dart';
import 'package:digicoach/src/features/profile/coach_profile_page.dart';
import 'package:digicoach/src/features/profile/data/like_comment_reply_model.dart';
import 'package:digicoach/src/features/profile/profile_controller.dart';
import 'package:digicoach/src/features/profile/widget/user_like_comment_widget.dart';
import 'package:digicoach/src/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:auto_route/auto_route.dart';

class StudentProfilePage extends StatefulWidget {
  final CoachStudentModel model;
  const StudentProfilePage({Key? key, required this.model}) : super(key: key);

  @override
  State<StudentProfilePage> createState() => _StudentProfilePageState();
}

class _StudentProfilePageState extends State<StudentProfilePage>
    with SingleTickerProviderStateMixin {
  late AnimationController progressController;
  late Animation<double> animation;
  double pts = 82;

  @override
  void initState() {
    super.initState();
    progressController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    animation = Tween<double>(begin: 0, end: pts).animate(progressController)
      ..addListener(() {
        setState(() {});
      });
    progressController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BodyWidget(
          animation: animation,
          pts: pts,
          model: widget.model,
        ),
      ),
    );
  }

  @override
  void dispose() {
    progressController.dispose();
    super.dispose();
  }
}

class BodyWidget extends ConsumerWidget {
  const BodyWidget(
      {Key? key,
      required this.animation,
      required this.pts,
      required this.model})
      : super(key: key);

  final CoachStudentModel model;
  final Animation<double> animation;
  final double pts;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(profileController);
    final chatProvider = ref.watch(messageController);
    return Column(
      children: [
        AppbarBackgroudWidget(
          child: Container(
            width: double.infinity,
            height: height(60),
            padding: const EdgeInsets.only(bottom: kDefaultPadding / 2),
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const WidthWidget(30),
                CircleAvatar(
                  radius: kDefaultFontSize - 6,
                  backgroundColor: kWhiteColor,
                  child: InkWell(
                    onTap: () {
                      context.navigateBack();
                    },
                    child: const Icon(
                      Icons.keyboard_backspace,
                      size: kDefaultFontSize - 2,
                    ),
                  ),
                ),
                const Spacer(
                  flex: 3,
                ),
                NormalText(
                  model.name,
                  isCentered: true,
                  color: kWhiteColor,
                ),
                const Spacer(
                  flex: 4,
                )
              ],
            ),
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8.0),
                  // TOP circular progress indicator
                  Stack(
                    children: [
                      CircularChart(
                        animation: animation,
                        pts: pts,
                      ),
                      Positioned(
                        right: 10,
                        bottom: 5,
                        child: InkWell(
                          onTap: () {
                            chatProvider.changeChatPage(chatpage: true);
                            chatProvider.isNavigateFromProfile = true;
                            context.router.push(
                                NavBarRoute(activeNavPage: NavBarPage.chat));
                            //mainProvider
                          },
                          child: Image.asset(
                            IconAsset.chatIcon,
                            width: 40,
                            fit: BoxFit.fitWidth,
                            color: kPrimaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const HeightWidget(10),
                  SizedBox(
                    width: double.infinity,
                    height: height(100),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Column(
                            children: const [
                              NormalText(
                                "Badges",
                                isBold: true,
                                fontSize: kDefaultFontSize - 8,
                              ),
                              HeightWidget(5),
                              CircleAvatar(
                                  radius: 28,
                                  backgroundColor: kStarbackgroundColor,
                                  child: CircleAvatar(
                                      radius: 26,
                                      backgroundColor: kStarbackgroundColor,
                                      backgroundImage: AssetImage(
                                        ImageAsset.starRating,
                                      ),
                                      child: NormalText(
                                        "4",
                                        fontSize: kDefaultFontSize - 6,
                                        isBold: true,
                                      ))),
                            ],
                          ),
                          const WidthWidget(8),
                          Column(
                            children: [
                              const NormalText(
                                "J’aime",
                                isBold: true,
                                fontSize: kDefaultFontSize - 8,
                              ),
                              const HeightWidget(5),
                              CircleAvatar(
                                  radius: 28,
                                  backgroundColor: kLikebackgroundColor,
                                  child: Container(
                                      alignment: Alignment.center,
                                      child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          Image.asset(
                                            ImageAsset.likeButton,
                                            width: width(44),
                                            height: height(48),
                                          ),
                                          const Positioned(
                                            bottom: 10,
                                            child: NormalText(
                                              "10",
                                              fontSize: kDefaultFontSize - 8,
                                            ),
                                          ),
                                        ],
                                      ))),
                            ],
                          ),
                          const WidthWidget(8),
                          Column(
                            children: [
                              const NormalText(
                                "Relations",
                                isBold: true,
                                fontSize: kDefaultFontSize - 8,
                              ),
                              const HeightWidget(3),
                              Container(
                                alignment: Alignment.center,
                                height: height(50),
                                width: width(50),
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    gradient: LinearGradient(colors: [
                                      krelationColor3,
                                      krelationColor2,
                                      krelationColor1,
                                    ])),
                                child: const NormalText(
                                  "25",
                                  isBold: true,
                                  color: kWhiteColor,
                                  isCentered: true,
                                ),
                              ),
                              const HeightWidget(8),
                              NormalText(
                                "2 relations en commun",
                                fontSize: kDefaultFontSize - 8,
                                color: const Color(0xFF2B3674).withOpacity(.5),
                              ),
                            ],
                          ),
                          const WidthWidget(8),
                          Column(
                            children: const [
                              NormalText(
                                "Commentaire",
                                isBold: true,
                                fontSize: kDefaultFontSize - 8,
                              ),
                              HeightWidget(3),
                              CircleAvatar(
                                  radius: 28,
                                  backgroundColor: kStarbackgroundColor,
                                  child: CircleAvatar(
                                    radius: 26,
                                    backgroundColor: kStarbackgroundColor,
                                    backgroundImage: AssetImage(
                                      ImageAsset.starRating,
                                    ),
                                    child: NormalText(
                                      "4.1",
                                      fontSize: kDefaultFontSize - 8,
                                      isBold: true,
                                      isCentered: true,
                                    ),
                                  )),
                            ],
                          ),
                          const WidthWidget(10),
                          Column(
                            children: [
                              const NormalText(
                                "Note",
                                isBold: true,
                                fontSize: kDefaultFontSize - 8,
                              ),
                              const HeightWidget(3),
                              CircleAvatar(
                                  radius: 28,
                                  backgroundColor: kLikebackgroundColor,
                                  child: Container(
                                      alignment: Alignment.center,
                                      child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          Image.asset(
                                            ImageAsset.likeButton,
                                            width: width(44),
                                            height: height(48),
                                          ),
                                          const Positioned(
                                            bottom: 10,
                                            child: NormalText(
                                              "10",
                                              fontSize: kDefaultFontSize - 8,
                                            ),
                                          ),
                                        ],
                                      ))),
                            ],
                          ),
                          const WidthWidget(8),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  const NormalText(
                    "À propos",
                    isBold: true,
                  ),
                  const HeightWidget(10),
                  const NormalText(
                    "J’adore le Tennis, je joue depuis maintenant 2 ans en tant qu’amateur. Je cherche des gens avec qui je pourrais jouer les weekends.",
                    letterspacing: 2,
                  ),
                  const HeightWidget(10),
                  Container(
                    margin: const EdgeInsets.all(8.0),
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: kWhiteColor,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: kBlackColor),
                    ),
                    child: Column(
                      children: [
                        const ShaderText(text: "BIO"),
                        const HeightWidget(20),
                        const CoachGeneralInformationWidgt(
                            image: ImageAsset.gender,
                            title: "Sexe",
                            value: "Femme"),
                        const HeightWidget(10),
                        const CoachGeneralInformationWidgt(
                            image: ImageAsset.age,
                            title: "Âge",
                            value: "26 ans"),
                        const HeightWidget(10),
                        Row(
                          children: [
                            const WidthWidget(20),
                            Icon(
                              Icons.list_alt,
                              size: height(35),
                            ),
                            SizedBox(
                              width: SizeConfig.screenWidth - width(130),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: const [
                                  NormalText(
                                    "Niveau",
                                    fontSize: kDefaultFontSize,
                                    isCentered: true,
                                  ),
                                  HeightWidget(5),
                                  NormalText(
                                    "Debutante",
                                    fontSize: kDefaultFontSize - 4,
                                    color: ksearchText,
                                    isCentered: true,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        const HeightWidget(10),
                        Row(
                          children: [
                            const WidthWidget(20),
                            Icon(
                              Icons.list_alt,
                              size: height(35),
                            ),
                            SizedBox(
                              width: SizeConfig.screenWidth - width(130),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: const [
                                  NormalText(
                                    "Centre d'interets",
                                    fontSize: kDefaultFontSize,
                                    isCentered: true,
                                  ),
                                  HeightWidget(5),
                                  NormalText(
                                    "Baskeball\nTennis\nFootball",
                                    fontSize: kDefaultFontSize - 4,
                                    color: ksearchText,
                                    isCentered: true,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        const HeightWidget(20),
                      ],
                    ),
                  ),

                  ///Her goest comment
                  const HeightWidget(30),

                  if (provider.userLikeCommentList.isNotEmpty)
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
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: provider.userLikeCommentList.length,
                              itemBuilder: (context, index) {
                                LikeCommentReplyModel userComment =
                                    provider.userLikeCommentList[index];
                                return UserCommentAndReplytWidget(
                                  index: index,
                                  model: userComment,
                                  subcommet: false,
                                  like: "j’aimes",
                                  reply: "Répondre",
                                );
                              }),
                          const Align(
                            alignment: Alignment.topRight,
                            child: NormalText("Voir plus",
                                color: kGreyColor,
                                fontSize: kDefaultFontSize - 4),
                          )
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
