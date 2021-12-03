import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:digicoach/src/features/home/widgets/student_dashboard_display_item_widget.dart.dart';
import 'package:digicoach/src/features/main_dashboard_container/data/coach_student_detail_model.dart';
import 'package:digicoach/src/routes/app_router.gr.dart';
import 'package:flutter/material.dart';

import 'coach_dashboarddisplay_item_widget.dart';

class CoachStudentListBuilder extends StatelessWidget {
  const CoachStudentListBuilder(
      {Key? key, required this.coachStudentLists, required this.isCoach})
      : super(key: key);
  final List<CoachStudentModel> coachStudentLists;
  final bool isCoach;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: coachStudentLists.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          CoachStudentModel items = coachStudentLists[index];
          return InkWell(
            onTap: () {
              context.router.push(StudentProfilePageRoute(model: items));
            },
            child: isCoach
                ? CoachDashboardDisplayItemWidget(items: items)
                : StudentDashboardDisplayItemWidget(items: items),
          );
        });
  }
}
