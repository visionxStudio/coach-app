import 'package:digicoach/src/common/constants/constants.dart';
import 'package:digicoach/src/features/home/coach_details/coach_details.dart';
import 'package:digicoach/src/features/home/data/coach_list.dart';
import 'package:flutter/material.dart';

import 'coach_dashboarddisplay_item_widget.dart';

class CoachStudentListBuilder extends StatelessWidget {
  const CoachStudentListBuilder(
      {Key? key, required this.coachModel, required this.isCoach})
      : super(key: key);
  final List<CoachModel> coachModel;
  final bool isCoach;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: coachModel.length,
      shrinkWrap: true,
      primary: false,
      itemBuilder: (context, index) {
        CoachModel items = coachModel[index];
        return InkWell(
            onTap: () {
              showModalBottomSheet(
                enableDrag: true,
                isScrollControlled: true,
                barrierColor: kLightGrey.withOpacity(0.6),
                backgroundColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0),
                ),
                context: context,
                builder: (context) {
                  return CoachDetails(coachDetail: items);
                },
              );
            },
            child: CoachDashboardDisplayItemWidget(item: items)
            // : StudentDashboardDisplayItemWidget(items: items),
            );
      },
    );
  }
}
