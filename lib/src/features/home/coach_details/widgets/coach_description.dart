import 'package:auto_size_text/auto_size_text.dart';
import 'package:digicoach/app_localization.dart';
import 'package:digicoach/src/common/constants/constants.dart';
import 'package:digicoach/src/common/widgets/size/custom_size_widget.dart';
import 'package:digicoach/src/features/home/coach_details/bloc/coach_details_controller.dart';
import 'package:digicoach/src/features/home/coach_details/widgets/coach_course.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CoachDescription extends StatelessWidget {
  const CoachDescription({Key? key, required this.description})
      : super(key: key);
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Consumer(
          builder: (context, ref, child) {
            final coachDetailProvider =
                ref.watch(coachDetailControllerProvider);
            return coachDetailProvider.index == 1
                ? const CoachCourses()
                : AutoSizeText(
                    description,
                    maxLines: coachDetailProvider.isTextExpanded ? 10 : 4,
                    style: const TextStyle(fontSize: kDefaultFontSize - 4),
                    overflowReplacement: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          description,
                          maxLines: 4,
                          style:
                              const TextStyle(fontSize: kDefaultFontSize - 4),
                          overflow: TextOverflow.ellipsis,
                        ),
                        GestureDetector(
                          onTap: () {
                            coachDetailProvider.toggleMaxLines();
                          },
                          child: Column(
                            children: [
                              const HeightWidget(8.0),
                              Row(
                                children: [
                                  Text(
                                    "coach_bottomsheet.show_more".tr(context),
                                    style: const TextStyle(
                                        color: kBlueVioletColor,
                                        fontSize: kDefaultFontSize - 4),
                                  ),
                                  const WidthWidget(4.0),
                                  const RotatedBox(
                                    quarterTurns: 5,
                                    child: Icon(
                                      Icons.arrow_forward_ios,
                                      color: kBlueVioletColor,
                                      size: 12.0,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
          },
        ),
        Consumer(
          builder: (ctx, ref, child) {
            final coachProvider = ref.watch(coachDetailControllerProvider);
            return coachProvider.index == 1
                ? const SizedBox()
                : coachProvider.isTextExpanded
                    ? Column(
                        children: [
                          const HeightWidget(8.0),
                          GestureDetector(
                            onTap: () => coachProvider.toggleMaxLines(),
                            child: Row(
                              children: [
                                Text(
                                  "coach_bottomsheet.show_less".tr(context),
                                  style: const TextStyle(
                                    color: kBlueVioletColor,
                                  ),
                                ),
                                const WidthWidget(4.0),
                                const RotatedBox(
                                  quarterTurns: 5,
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    color: kBlueVioletColor,
                                    size: 16.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    : const SizedBox();
          },
        ),
      ],
    );
  }
}
