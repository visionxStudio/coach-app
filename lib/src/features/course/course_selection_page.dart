import 'package:auto_route/auto_route.dart';
import 'package:digicoach/app_localization.dart';
import 'package:digicoach/src/common/constants/constants.dart';
import 'package:digicoach/src/common/utils/app_size_utils.dart';
import 'package:digicoach/src/common/widgets/button/custom_elevated_button.dart';
import 'package:digicoach/src/common/widgets/size/custom_size_widget.dart';
import 'package:digicoach/src/common/widgets/text/custom_normal_text_widget.dart';
import 'package:digicoach/src/features/course/bloc/course_provider.dart';
import 'package:digicoach/src/features/course/data/course_list.dart';
import 'package:digicoach/src/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CourseSelectionPage extends StatelessWidget {
  const CourseSelectionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScafoldColor,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: kBlackColor),
        elevation: 0.0,
        backgroundColor: kScafoldColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                const CourseInfo(),
                const HeightWidget(32.0),
                const CourseList(),
                const HeightWidget(32.0),
                CustomElevatedButton(
                  label: "courses_list.continue".tr(context).toUpperCase(),
                  onPressed: () {
                    context.router.push(const DetailsCoachPageRoute());
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CourseList extends StatelessWidget {
  const CourseList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: courses.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        final CoursesModel course = courses[index];
        return Consumer(
          builder: (ctx, ref, child) {
            final courseIndex = ref.watch(courseControllerProvider);
            return GestureDetector(
              onTap: () {
                ref.read(courseStateProvider.notifier).interestIdChanged(index);
                context.router.push(const SelectCoursePreferencePageRoute());
                ref.read(courseControllerProvider).addCourse(index);
              },
              child: Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 12.0),
                    width: double.infinity,
                    height: SizeConfig.screenHeight < kTabletBreakpoint
                        ? 55.0
                        : 65.0,
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    decoration: BoxDecoration(
                      color: courseIndex.selectedCourses.contains(index)
                          ? course.backgroundColor
                          : course.backgroundColor.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: SizedBox(
                      width: SizeConfig.screenWidth,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.done,
                            color: courseIndex.selectedCourses.contains(index)
                                ? kWhiteColor
                                : kWhiteColor.withOpacity(0.2),
                          ),
                          const WidthWidget(8.0),
                          NormalText(
                            course.course,
                            color: kWhiteColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0.0,
                    child: Container(
                      height: SizeConfig.screenHeight < kTabletBreakpoint
                          ? 55.0
                          : 65.0,
                      width: 100.0,
                      decoration: BoxDecoration(
                        color: kWhiteColor.withOpacity(0.4),
                        // color: kWhiteColor,
                        borderRadius: const BorderRadius.horizontal(
                          left: Radius.circular(300.0),
                        ),
                      ),
                      child: Center(
                        child: Image.asset(
                          course.courseImage,
                          height: 24.0,
                          color: course.backgroundColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

class CourseInfo extends StatelessWidget {
  const CourseInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NormalText(
          "course_selection.select_course".tr(context),
          fontSize: SizeConfig.screenHeight < kTabletBreakpoint ? 24.0 : 28.0,
          fontWeight: FontWeight.w500,
          isCentered: true,
          color: kPrimaryColor,
        ),
        const HeightWidget(8.0),
        NormalText(
          "course_selection.course_ability".tr(context),
          isCentered: true,
          color: ksearchText,
        ),
      ],
    );
  }
}
