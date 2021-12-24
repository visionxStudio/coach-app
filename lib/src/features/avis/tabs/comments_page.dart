import 'package:digicoach/app_localization.dart';
import 'package:digicoach/src/common/constants/constants.dart';
import 'package:digicoach/src/common/widgets/container/custom_container.dart';
import 'package:digicoach/src/common/widgets/rating_bar/custom_rating_bar.dart';
import 'package:digicoach/src/common/widgets/size/custom_size_widget.dart';
import 'package:digicoach/src/common/widgets/text/custom_normal_text_widget.dart';
import 'package:digicoach/src/features/avis/data/comment_model.dart';
import 'package:flutter/material.dart';

class CommentsPage extends StatelessWidget {
  const CommentsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NormalText(
            "avis_page.avis".tr(context) + " (${comments.length})",
            fontWeight: FontWeight.bold,
            color: kPrimaryColor,
          ),
          const HeightWidget(16.0),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: comments.length,
            itemBuilder: (BuildContext context, int index) {
              final CommentModel comment = comments[index];

              return Container(
                margin: const EdgeInsets.only(bottom: 16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      comment.image,
                      height: 45.0,
                    ),
                    const WidthWidget(16.0),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          NormalText(
                            comment.name,
                            color: kPrimaryColor,
                          ),
                          const HeightWidget(8.0),
                          NormalText(
                            comment.date,
                            color: kLightBlueTextColor,
                          ),
                          const HeightWidget(8.0),
                          NormalText(
                            comment.comment,
                            color: kPrimaryColor,
                          ),
                          const HeightWidget(8.0),
                          CustomRatingStar(
                            rating: comment.rating,
                            showFullStars: true,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
