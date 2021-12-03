import 'package:digicoach/src/common/constants/constants.dart';
import 'package:digicoach/src/common/utils/app_size_utils.dart';
import 'package:digicoach/src/common/widgets/size/custom_size_widget.dart';
import 'package:digicoach/src/common/widgets/text/custom_normal_text_widget.dart';
import 'package:digicoach/src/features/home/bloc/search_controller.dart';
import 'package:digicoach/src/features/home/widgets/bottom_page_count_widget.dart';
import 'package:digicoach/src/features/home/widgets/coach_student_list.dart';
import 'package:digicoach/src/features/home/widgets/search_input_fiel_widget.dart';
import 'package:digicoach/src/features/main_dashboard_container/bloc/main_dashboard_controller.dart';
import 'package:digicoach/src/features/main_dashboard_container/data/coach_student_detail_model.dart';
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
    return Container(
      color: kSecondaryColor,
      width: double.infinity,
      child: SingleChildScrollView(
        controller: scrollController,
        physics: const BouncingScrollPhysics(),
        // scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Column(
            children: [
              const HeightWidget(10),
              const SearchInputFieldWidget(),
              SizedBox(
                width: double.infinity,
                height: height(26),
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: mainProvider.topmenulist.length,
                    itemBuilder: (context, index) {
                      String item = mainProvider.topmenulist[index];

                      return InkWell(
                        hoverColor: kLightestGreyColor,
                        focusColor: kLightestGreyColor,
                        highlightColor: kLightestGreyColor,
                        onTap: () {
                          mainProvider.changeTopMenuIndex(index);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          margin: index == 3
                              ? const EdgeInsets.only(left: 20)
                              : const EdgeInsets.symmetric(horizontal: 5),
                          padding: const EdgeInsets.symmetric(
                              horizontal: kDefaultPadding / 2, vertical: 0),
                          decoration: BoxDecoration(
                              color: kWhiteColor,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: kBlackColor.withOpacity(.20)),
                              gradient: mainProvider.topmenuIndex ==
                                          mainProvider.topmenulist.length - 1 &&
                                      mainProvider.topmenuIndex == index
                                  ? const LinearGradient(
                                      end: Alignment.bottomLeft,
                                      begin: Alignment.bottomRight,
                                      colors: <Color>[
                                        Color(0xFF65C7F7),
                                        Color(0xFF0052D4),
                                      ], // red to yellow
                                    )
                                  : mainProvider.topmenuIndex ==
                                              mainProvider.topmenulist.length -
                                                  2 &&
                                          mainProvider.topmenuIndex == index
                                      ? const LinearGradient(
                                          end: Alignment.bottomLeft,
                                          begin: Alignment.bottomRight,
                                          colors: <Color>[
                                            Color(0xFF65C7F7),
                                            Color(0xFF0052D4),
                                          ], // red to yellow
                                        )
                                      : index >= 3
                                          ? const LinearGradient(
                                              end: Alignment.bottomLeft,
                                              begin: Alignment.bottomRight,
                                              colors: <Color>[
                                                kTopMenuUnselectedColor,
                                                kTopMenuUnselectedColor
                                              ], // red to yellow
                                            )
                                          : null),
                          child: NormalText(
                            item,
                            fontSize: kDefaultFontSize - 7,
                            color: index >= 3 ? kWhiteColor : null,
                          ),
                        ),
                      );
                    }),
              ),
              const HeightWidget(5),
              Consumer(
                builder: (ctx, ref, child) {
                  SearchController searchController =
                      ref.watch(searchControllerProvider);

                  final bool isSearching = searchController.isSearching;
                  List<CoachStudentModel> coachStudentLists =
                      searchController.coachStudent;
                  if (!isSearching) {
                    return Column(
                      children: [
                        //for student
                        if (mainProvider.topmenuIndex ==
                            mainProvider.topmenulist.length - 1)
                          CoachStudentListBuilder(
                            coachStudentLists: mainProvider.studentDetailList,
                            isCoach: false,
                          ),
                        // ListView.builder(
                        //     physics: const NeverScrollableScrollPhysics(),
                        //     itemCount: mainProvider.studentDetailList.length,
                        //     shrinkWrap: true,
                        //     itemBuilder: (context, index) {
                        //       CoachStudentModel items =
                        //           mainProvider.studentDetailList[index];
                        //       return InkWell(
                        //         onTap: () {
                        //           context.router.push(
                        //               StudentProfilePageRoute(model: items));
                        //         },
                        //         child: StudentDashboardDisplayItemWidget(
                        //             items: items),
                        //       );
                        //     }),

                        //for caoach
                        if (mainProvider.topmenuIndex <=
                            mainProvider.topmenulist.length - 2)
                          CoachStudentListBuilder(
                            coachStudentLists: mainProvider.coachDetailList,
                            isCoach: true,
                          ),
                        // ListView.builder(
                        //     physics: const NeverScrollableScrollPhysics(),
                        //     itemCount: mainProvider.coachDetailList.length,
                        //     shrinkWrap: true,
                        //     itemBuilder: (context, index) {
                        //       CoachStudentModel items =
                        //           mainProvider.coachDetailList[index];
                        //       return InkWell(
                        //           onTap: () {
                        //             context.router.push(
                        //                 CoachProfilePageRoute(model: items));
                        //           },
                        //           child: CoachDashboardDisplayItemWidget(
                        //               items: items));
                        //     }),
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
                            coachStudentLists: coachStudentLists,
                            isCoach: false,
                          ),
                        if (mainProvider.topmenuIndex <=
                            mainProvider.topmenulist.length - 2)
                          CoachStudentListBuilder(
                            coachStudentLists: coachStudentLists,
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
      ),
    );
  }
}
