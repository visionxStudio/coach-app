import 'package:digicoach/src/common/constants/constants.dart';
import 'package:digicoach/src/common/utils/app_size_utils.dart';
import 'package:digicoach/src/common/widgets/size/custom_size_widget.dart';
import 'package:digicoach/src/common/widgets/text/custom_normal_text_widget.dart';
import 'package:flutter/material.dart';

class CustomCourseActivityGraph extends StatefulWidget {
  final Color color;
  final String title;
  final double duration;
  final int course;
  final String image;
  final int index;
  final double completedDuration;
  const CustomCourseActivityGraph(
      {Key? key,
      required this.color,
      required this.title,
      required this.duration,
      required this.image,
      required this.completedDuration,
      required this.index,
      required this.course})
      : super(key: key);

  @override
  _CustomCourseActivityGraphState createState() =>
      _CustomCourseActivityGraphState();
}

class _CustomCourseActivityGraphState extends State<CustomCourseActivityGraph> {
  @override
  void initState() {
    super.initState();
    calculateCompletedCoursePercentage();
  }

  double calculateCompletedCoursePercentage() {
    return (SizeConfig.screenWidth / widget.duration) *
        widget.completedDuration;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Image.asset(
              widget.image,
              height: kDefaultFontSize - 2,
              color: kCoursesTextColor,
            ),
            const WidthWidget(8.0),
            NormalText(
              widget.title,
              color: kCoursesTextColor,
              fontSize: kDefaultFontSize - 6,
            ),
          ],
        ),
        const HeightWidget(16.0),
        Stack(
          children: [
            Container(
              width: double.infinity,
              height: kDefaultFontSize + 6,
              decoration: BoxDecoration(
                color: kchartBackgroundColor,
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
            Container(
              width: calculateCompletedCoursePercentage(),
              height: kDefaultFontSize + 6,
              decoration: BoxDecoration(
                color: widget.color,
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
          ],
        ),
        const HeightWidget(16.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            NormalText(
              "Cours ${widget.course.toString()}",
              color: kdashboardLightColor,
              fontSize: kDefaultFontSize - 6,
            ),
            NormalText(
              "Total duration ${widget.duration.toInt().toString()} min",
              color: kdashboardLightColor,
              fontSize: kDefaultFontSize - 6,
            ),
          ],
        ),
        widget.index < 4 ? const HeightWidget(32.0) : const HeightWidget(16.0),
      ],
    );
  }
}
