import 'package:digicoach/src/common/constants/constants.dart';
import 'package:digicoach/src/common/widgets/size/custom_size_widget.dart';
import 'package:digicoach/src/common/widgets/text/custom_normal_text_widget.dart';
import 'package:digicoach/src/features/home/coach_details/widgets/course_type_bottomsheet.dart';
import 'package:digicoach/src/features/home/widgets/coach_dashboarddisplay_item_widget.dart';
import 'package:flutter/material.dart';

class CoachCourses extends StatelessWidget {
  const CoachCourses({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ListView.builder(
        itemCount: 3,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              showModalBottomSheet(
                isScrollControlled: true,
                barrierColor: kLightGrey.withOpacity(0.6),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                context: context,
                builder: (context) {
                  return const CourseTypeButtomsheet();
                },
              );
            },
            child: Container(
              margin: const EdgeInsets.only(bottom: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const NormalText(
                    "Mediation en pleine consience",
                    color: kPrimaryColor,
                    fontSize: kDefaultFontSize - 4,
                  ),
                  const HeightWidget(8.0),
                  const NormalText(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vitae amet arcu rhoncus ac.",
                    color: kLightBlueTextColor,
                    fontSize: kDefaultFontSize - 6,
                  ),
                  const HeightWidget(8.0),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const LikesAndCommentsCount(
                        likes: 3,
                        comments: 7,
                      ),
                      Column(
                        children: const [
                          NormalText(
                            "29€",
                            fontSize: 24.0,
                            fontWeight: FontWeight.w500,
                            color: kBottonColor,
                          ),
                          HeightWidget(8.0),
                        ],
                      ),
                    ],
                  ),
                  const HeightWidget(8.0),
                  const Divider(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
