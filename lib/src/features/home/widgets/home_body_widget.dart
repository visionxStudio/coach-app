import 'package:digicoach/src/common/constants/constants.dart';
import 'package:digicoach/src/common/widgets/size/custom_size_widget.dart';
import 'package:digicoach/src/common/widgets/text/custom_normal_text_widget.dart';
import 'package:digicoach/src/features/home/bloc/search_controller.dart';
import 'package:digicoach/src/features/home/data/coach_list.dart';
import 'package:digicoach/src/features/home/widgets/bottom_page_count_widget.dart';
import 'package:digicoach/src/features/home/widgets/coach_student_list.dart';
import 'package:digicoach/src/features/main_dashboard_container/bloc/main_dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeBodyWidget extends StatelessWidget {
  const HomeBodyWidget({
    Key? key,
    required this.mainProvider,
    required this.scrollController,
  }) : super(key: key);

  final ScrollController scrollController;
  final MainDashboardProvider mainProvider;
  @override
  Widget build(BuildContext context) {
    if (mainProvider.coachDetailList.isEmpty) {
      return const Center(
        child: NormalText("NO DATA FOUND"),
      );
    }
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        controller: scrollController,
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const HeightWidget(10),
            Consumer(
              builder: (ctx, ref, child) {
                SearchController searchController =
                    ref.watch(searchControllerProvider);

                final bool isSearching = searchController.isSearching;

                if (!isSearching) {
                  return Column(
                    children: [
                      //for student
                      if (mainProvider.topmenuIndex ==
                          mainProvider.topmenulist.length - 1)
                        CoachStudentListBuilder(
                          coachModel: coachList,
                          isCoach: false,
                        ),

                      //for caoach
                      if (mainProvider.topmenuIndex <=
                          mainProvider.topmenulist.length - 2)
                        CoachStudentListBuilder(
                          coachModel: coachList,
                          isCoach: true,
                        ),
                    ],
                  );
                }
                // searching Widget
                return SizedBox(
                  height: MediaQuery.of(context).size.height,
                  // width: double.infinity,
                  child: Column(
                    children: [
                      if (mainProvider.topmenuIndex ==
                          mainProvider.topmenulist.length - 1)
                        CoachStudentListBuilder(
                          coachModel: coachList,
                          isCoach: false,
                        ),
                      if (mainProvider.topmenuIndex <=
                          mainProvider.topmenulist.length - 2)
                        CoachStudentListBuilder(
                          coachModel: coachList,
                          isCoach: true,
                        ),
                    ],
                  ),
                );
              },
            ),
            const BottomPageCountWidget(),
            const SizedBox(height: kNavBarHeight),
          ],
        ),
      ),
    );
  }
}
