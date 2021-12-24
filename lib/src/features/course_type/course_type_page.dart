import 'package:digicoach/src/common/constants/constants.dart';
import 'package:digicoach/src/common/utils/app_size_utils.dart';
import 'package:digicoach/src/common/widgets/button/custom_elevated_button.dart';
import 'package:digicoach/src/common/widgets/custom_progress_indicator_overlay/custom_progress_indicator_overlay.dart';
import 'package:digicoach/src/common/widgets/input_field/minimal_input_field.dart';
import 'package:digicoach/src/common/widgets/size/custom_size_widget.dart';
import 'package:digicoach/src/common/widgets/text/custom_normal_text_widget.dart';
import 'package:digicoach/src/features/course/bloc/course_provider.dart';
import 'package:digicoach/src/features/course/bloc/course_state.dart';
import 'package:digicoach/src/routes/router.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';

class SelectCourseTypePage extends ConsumerStatefulWidget {
  const SelectCourseTypePage({Key? key}) : super(key: key);

  @override
  _SelectCourseTypePageState createState() => _SelectCourseTypePageState();
}

class _SelectCourseTypePageState extends ConsumerState<SelectCourseTypePage> {
  bool disableButton = true;

  List<String> courselist = [
    'Hatha',
    'Ashtanga',
    'Vinyasa',
    'Iyengar',
    'Yin et réparateur',
    'Jivamukti',
    'Yoga pilates',
    'Autres'
  ];
  List<int> selected = [];

  void addItemsInList(int index) {
    if (selected.contains(index)) {
      //remove
      selected.remove(index);
    } else {
      selected.add(index);
    }
    if (selected.isNotEmpty) {
      disableButton = false;
    } else {
      disableButton = true;
    }
    setState(() {});
  }

  bool checkSelected(int value) {
    if (selected.contains(value)) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<CourseState>(courseStateProvider, (previous, next) {
      if (next.status.isSubmissionFailure) {
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(SnackBar(content: Text(next.errorMessage!)));
      }
      if (next.status.isSubmissionSuccess) {
        AutoRouter.of(context).replace(const CourseSelectionPageRoute());
      }
    });
    return CustomProgressIndicatorOverlay(
      isLoading: ref.watch(courseStateProvider).status ==
          FormzStatus.submissionInProgress,
      child: Scaffold(
        backgroundColor: kScaffoldBackgroundColor,
        appBar: AppBar(
          leading: BackButton(
            color: kPrimaryColor,
            onPressed: () {
              context.router.navigateBack();
            },
          ),
          elevation: 0,
          backgroundColor: kScaffoldBackgroundColor,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: NormalText(
                    "select_coursetype.selectcoursetype",
                    fontSize: kDefaultFontSize + 2,
                    isCentered: true,
                    color: kPrimaryColor,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: NormalText(
                    "select_coursetype.subtitle",
                    fontSize: kDefaultFontSize - 4,
                    isCentered: true,
                    color: ksearchText,
                  ),
                ),
                const HeightWidget(30),
                SizedBox(
                  width: SizeConfig.screenWidth,
                  // height: height(200),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: GridView.count(
                      shrinkWrap: true,
                      primary: false,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      padding: EdgeInsets.zero,
                      mainAxisSpacing: 10,
                      childAspectRatio: 3.4,
                      children: List.generate(
                        courselist.length,
                        (index) {
                          return InkWell(
                            onTap: () {
                              addItemsInList(index);
                            },
                            child: Container(
                                padding: EdgeInsets.zero,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: checkSelected(index)
                                      ? kNavBarBackgroundColor
                                      : kWhiteColor,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: checkSelected(index)
                                        ? kPrimaryColorDark
                                        : kWhiteColor,
                                  ),
                                ),
                                child: NormalText(
                                  courselist[index],
                                  color: kscheduleTextColor,
                                  fontSize: 14,
                                )),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                const HeightWidget(20),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: MinimalInputField(hintText: "Autres"),
                ),
                const HeightWidget(10),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: kDefaultmargin),
                  child: InkWell(
                    onTap: () {},
                    child: DottedBorder(
                        borderType: BorderType.RRect,
                        radius: const Radius.circular(12),
                        padding: const EdgeInsets.all(10),
                        dashPattern: const [8, 4],
                        child: Row(
                          children: const [
                            CircleAvatar(
                              radius: 15,
                              backgroundColor: knavbarInactiveColor,
                              child: CircleAvatar(
                                radius: 12,
                                backgroundColor: kScaffoldBackgroundColor,
                                child: Icon(
                                  Icons.add,
                                  color: knavbarInactiveColor,
                                ),
                              ),
                            ),
                            WidthWidget(10),
                            NormalText(
                              "Add more",
                              color: knavbarInactiveColor,
                              fontSize: 14,
                            )
                          ],
                        )),
                  ),
                ),
                const HeightWidget(25),
                CustomElevatedButton(
                  backgroundColor:
                      disableButton ? kdisableButton : kPrimaryColorDark,
                  onPressed: () async {
                    if (selected.isNotEmpty) {
                      final List<int> selectedTopics = selected.map((e) {
                        return e + 1;
                      }).toList();
                      ref
                          .read(courseStateProvider.notifier)
                          .topicsChanged(topicsList: selectedTopics);

                      await ref
                          .read(courseStateProvider.notifier)
                          .createCourse()
                          .whenComplete(() {
                        ref.refresh(courseStateProvider);
                      });
                    } else {
                      return;
                    }
                  },
                  label: 'select_coursetype.continue',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
