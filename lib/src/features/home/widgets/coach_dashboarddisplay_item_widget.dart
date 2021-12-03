import 'package:digicoach/src/common/constants/asset_image_link.dart';
import 'package:digicoach/src/common/constants/constants.dart';
import 'package:digicoach/src/common/widgets/size/custom_size_widget.dart';
import 'package:digicoach/src/common/widgets/text/custom_normal_text_widget.dart';
import 'package:digicoach/src/common/widgets/text/shader_text.dart';
import 'package:digicoach/src/features/home/widgets/icon_with_number_like_comment_average_widget.dart';
import 'package:digicoach/src/features/main_dashboard_container/data/coach_student_detail_model.dart';
import 'package:flutter/material.dart';

class CoachDashboardDisplayItemWidget extends StatelessWidget {
  const CoachDashboardDisplayItemWidget({
    Key? key,
    required this.items,
  }) : super(key: key);

  final CoachStudentModel items;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(kDefaultPadding - 8),
      margin: const EdgeInsets.symmetric(vertical: kDefaultmargin / 2),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.4),
          spreadRadius: 1,
          blurRadius: 2,
          offset: const Offset(-2, 3),
        )
      ], color: kWhiteColor, borderRadius: BorderRadius.circular(20)),
      child: Row(
        children: [
          Column(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    items.profile,
                    height: 73,
                    width: 73,
                  )),
              const HeightWidget(5),
              NormalText(
                items.name,
                fontSize: kDefaultFontSize - 5,
              )
            ],
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ShaderText(text: items.title),
                const HeightWidget(5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.place,
                      color: kDarkGrey,
                      size: 13,
                    ),
                    const WidthWidget(10),
                    NormalText(
                      items.address,
                      fontSize: kDefaultFontSize - 6,
                      color: kDarkGrey,
                    ),
                  ],
                ),
                const HeightWidget(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconWithNumberWidget(
                      imageIcon: ImageAsset.heart,
                      number: items.heart.toString(),
                    ),
                    const WidthWidget(20),
                    IconWithNumberWidget(
                      imageIcon: ImageAsset.msg,
                      number: items.comment.toString(),
                    ),
                    const WidthWidget(20),
                    IconWithNumberWidget(
                      imageIcon: ImageAsset.star,
                      number: items.averageRating.toString() + "/5",
                    ),
                  ],
                )
              ],
            ),
          ),
          Column(
            children: [
              Image.asset(
                ImageAsset.meditation,
                height: 32,
                fit: BoxFit.fitHeight,
              ),
              const HeightWidget(10),
              Row(
                children: [
                  NormalText(
                    items.fee.toStringAsFixed(0),
                    color: kGreen,
                    fontSize: kDefaultFontSize + 2,
                    isBold: true,
                  ),
                  const Icon(
                    Icons.euro,
                    size: 20,
                    color: kGreen,
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
