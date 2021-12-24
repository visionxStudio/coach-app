import 'package:auto_route/auto_route.dart';
import 'package:digicoach/app_localization.dart';
import 'package:digicoach/src/common/constants/asset_image_link.dart';
import 'package:digicoach/src/common/constants/constants.dart';
import 'package:digicoach/src/common/widgets/button/custom_elevated_button.dart';
import 'package:digicoach/src/common/widgets/size/custom_size_widget.dart';
import 'package:digicoach/src/common/widgets/text/custom_normal_text_widget.dart';
import 'package:digicoach/src/features/home/coach_details/bloc/coach_details_controller.dart';
import 'package:digicoach/src/features/home/coach_details/widgets/courses.dart';
import 'package:digicoach/src/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CourseTypeButtomsheet extends StatelessWidget {
  const CourseTypeButtomsheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: kWhiteColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      height: 320.0,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Spacer(),
                NormalText(
                  "Type de Course",
                  fontWeight: FontWeight.w600,
                ),
                Spacer(),
                Icon(
                  Icons.info_outline,
                  color: knavbarInactiveColor,
                ),
              ],
            ),
            const HeightWidget(16.0),
            Row(
              children: [
                Consumer(
                  builder: (ctx, ref, child) {
                    final courseProvider =
                        ref.watch(coachDetailControllerProvider);
                    return Courses(
                      onTap: () {
                        courseProvider.changeSelectedCourseIndex(value: 0);
                      },
                      backgroundColor: const Color(0xFFE4F8F5),
                      course: "courses.live".tr(context),
                      image: IconAsset.live,
                      isSelected: courseProvider.selectedCourseIndex == 0,
                      price: 29,
                    );
                  },
                ),
                Consumer(
                  builder: (ctx, ref, child) {
                    final courseProvider =
                        ref.watch(coachDetailControllerProvider);
                    return Courses(
                      onTap: () {
                        courseProvider.changeSelectedCourseIndex(value: 1);
                      },
                      backgroundColor: const Color(0xFFF6F0DD),
                      course: "courses.home".tr(context),
                      image: IconAsset.home,
                      isSelected: courseProvider.selectedCourseIndex == 1,
                      price: 29,
                    );
                  },
                ),
                Consumer(
                  builder: (ctx, ref, child) {
                    final courseProvider =
                        ref.watch(coachDetailControllerProvider);
                    return Courses(
                      onTap: () {
                        courseProvider.changeSelectedCourseIndex(value: 2);
                      },
                      backgroundColor: const Color(0xFFDBEEDE),
                      course: "courses.share".tr(context),
                      image: IconAsset.share,
                      isSelected: courseProvider.selectedCourseIndex == 2,
                      price: 29,
                    );
                  },
                ),
              ],
            ),
            const HeightWidget(16.0),
            SizedBox(
              width: double.infinity,
              child: CustomElevatedButton(
                label: "courses.continue".tr(context),
                onPressed: () {
                  context.router.push(const AppointmentPageRoute());
                },
                backgroundColor: kBottonColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
