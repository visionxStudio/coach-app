import 'package:digicoach/src/common/constants/asset_image_link.dart';
import 'package:digicoach/src/common/constants/constants.dart';
import 'package:digicoach/src/common/widgets/rating_bar/custom_rating_bar.dart';
import 'package:digicoach/src/common/widgets/size/custom_size_widget.dart';
import 'package:digicoach/src/common/widgets/text/custom_normal_text_widget.dart';
import 'package:digicoach/src/features/home/data/coach_list.dart';
import 'package:flutter/material.dart';

class CoachDashboardDisplayItemWidget extends StatelessWidget {
  const CoachDashboardDisplayItemWidget({
    Key? key,
    required this.item,
    this.showPricing = true,
  }) : super(key: key);

  final CoachModel item;
  final bool showPricing;
  final double spacerHeight = 8.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kWhiteColor,
      margin: const EdgeInsets.only(bottom: 6.0),
      padding: const EdgeInsets.symmetric(
          vertical: 8.0, horizontal: kDefaultPadding),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(100.0),
            child: Image.asset(
              item.image,
              height: 74.0,
              width: 74.0,
              fit: BoxFit.cover,
            ),
          ),
          const WidthWidget(16.0),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    NormalText(
                      item.name,
                      fontSize: kDefaultFontSize - 4,
                    ),
                    item.isCertified
                        ? Image.asset(
                            IconAsset.certified,
                            height: 13.0,
                          )
                        : const SizedBox(),
                  ],
                ),
                HeightWidget(spacerHeight),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.66,
                  height: 25.0,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    primary: false,
                    itemCount: item.courses.length,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        margin: const EdgeInsets.only(right: 4.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          color: kNavBarBackgroundColor,
                        ),
                        child: Center(
                          child: Row(
                            children: [
                              Image.asset(
                                ImageAsset.yoga,
                                height: kDefaultFontSize - 12,
                              ),
                              const WidthWidget(2.0),
                              NormalText(
                                item.courses[index],
                                fontSize: kDefaultFontSize - 8,
                                fontWeight: FontWeight.w500,
                                color: kCoursesTextColor,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                HeightWidget(spacerHeight),
                Skills(item: item),
                HeightWidget(spacerHeight),
                showPricing
                    ? SizedBox(
                        width: MediaQuery.of(context).size.width * 0.66,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                NormalText(
                                  item.address,
                                  fontSize: kDefaultFontSize - 6,
                                  color: kTopMenuUnselectedColor,
                                ),
                                HeightWidget(spacerHeight),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.66,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CustomRatingStar(rating: item.rating),
                                          HeightWidget(spacerHeight),
                                          LikesAndCommentsCount(
                                            likes: item.likes,
                                            comments: item.comments,
                                          ),
                                        ],
                                      ),
                                      NormalText(
                                        "${item.price}€",
                                        fontSize: kDefaultFontSize + 6,
                                        fontWeight: FontWeight.w500,
                                        color: kBottonColor,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    : SizedBox(
                        width: MediaQuery.of(context).size.width * 0.66,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                NormalText(
                                  item.address,
                                  fontSize: kDefaultFontSize - 6,
                                  color: kTopMenuUnselectedColor,
                                ),
                                HeightWidget(spacerHeight),
                                CustomRatingStar(rating: item.rating),
                              ],
                            ),
                            const LikeAndCommentWidget()
                          ],
                        ),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class LikesAndCommentsCount extends StatelessWidget {
  const LikesAndCommentsCount({
    Key? key,
    required this.comments,
    required this.likes,
  }) : super(key: key);

  final int likes;
  final int comments;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            Image.asset(
              IconAsset.like,
              height: kDefaultFontSize - 5,
            ),
            const WidthWidget(4.0),
            NormalText(
              "${likes.toString()} Likes",
              fontSize: kDefaultFontSize - 8,
              color: kLightBlueTextColor,
            )
          ],
        ),
        const WidthWidget(8.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              IconAsset.comment,
              height: kDefaultFontSize - 5,
            ),
            const WidthWidget(4.0),
            NormalText(
              "${comments.toString()} Comments",
              fontSize: kDefaultFontSize - 8,
              color: kLightBlueTextColor,
            )
          ],
        ),
      ],
    );
  }
}

class Skills extends StatelessWidget {
  const Skills({
    Key? key,
    required this.item,
  }) : super(key: key);

  final CoachModel item;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const NormalText(
          "LES+ : ",
          color: kLightBlueTextColor,
          fontSize: kDefaultFontSize - 6,
          maxline: 1,
        ),
        Flexible(
          child: NormalText(
            item.skills.join(", "),
            fontSize: kDefaultFontSize - 6,
            maxline: 1,
            color: kLightBlueTextColor,
          ),
        )
      ],
    );
  }
}

class LikeAndCommentWidget extends StatelessWidget {
  const LikeAndCommentWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 46.0,
          width: 46.0,
          decoration: BoxDecoration(
            color: kNavBarBackgroundColor,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Center(
            child: Image.asset(
              IconAsset.chatHome,
              height: 25.0,
              width: 25.0,
            ),
          ),
        ),
        const WidthWidget(8.0),
        Container(
          height: 46.0,
          width: 46.0,
          decoration: BoxDecoration(
            color: kNavBarBackgroundColor,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Center(
            child: Image.asset(
              IconAsset.like,
              color: kBottonColor,
              height: 25.0,
              width: 25.0,
            ),
          ),
        ),
      ],
    );
  }
}
