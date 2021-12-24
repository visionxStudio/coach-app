import 'package:auto_route/auto_route.dart';
import 'package:digicoach/app_localization.dart';
import 'package:digicoach/src/common/constants/asset_image_link.dart';
import 'package:digicoach/src/common/constants/constants.dart';
import 'package:digicoach/src/common/utils/app_size_utils.dart';
import 'package:digicoach/src/common/widgets/custom_progress_indicator_overlay/custom_progress_indicator_overlay.dart';
import 'package:digicoach/src/common/widgets/size/custom_size_widget.dart';
import 'package:digicoach/src/common/widgets/text/custom_normal_text_widget.dart';
import 'package:digicoach/src/features/coach_details/bloc/coach_provider.dart';
import 'package:digicoach/src/features/course/bloc/course_provider.dart';
import 'package:digicoach/src/features/course/bloc/course_state.dart';
import 'package:digicoach/src/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';

class SelectProfilePage extends ConsumerStatefulWidget {
  const SelectProfilePage({Key? key}) : super(key: key);

  @override
  _SelectProfilePageState createState() => _SelectProfilePageState();
}

class _SelectProfilePageState extends ConsumerState<SelectProfilePage> {
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
        backgroundColor: kScafoldColor,
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              AutoRouter.of(context).pop();
            },
            borderRadius: BorderRadius.circular(50.0),
            child: const Icon(
              Icons.arrow_back,
              color: kPrimaryColor,
            ),
          ),
          elevation: 0.0,
          backgroundColor: kScafoldColor,
        ),
        body: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            height: SizeConfig.screenHeight,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  const HeightWidget(30.0),
                  NormalText(
                    "profile_page.choose_profile".tr(context),
                    fontSize: 24.0,
                  ),
                  const HeightWidget(50.0),
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            AutoRouter.of(context)
                                .push(const DetailsPageRoute());
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            decoration: BoxDecoration(
                              color: kWhiteColor,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Column(
                              children: [
                                Image.asset(
                                  ImageAsset.individual2,
                                  height: 106,
                                  width: 106,
                                ),
                                const HeightWidget(8.0),
                                NormalText(
                                  "profile_page.particular".tr(context),
                                  color: kPrimaryColor,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      const WidthWidget(16.0),
                      Expanded(
                        child: GestureDetector(
                          onTap: () async {
                            await ref
                                .read(coachStateProvider.notifier)
                                .createCoach()
                                .whenComplete(() => context.router
                                    .push(const CourseSelectionPageRoute()));
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            decoration: BoxDecoration(
                              color: kWhiteColor,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Column(
                              children: [
                                Image.asset(
                                  ImageAsset.coach2,
                                  height: 106,
                                  width: 106,
                                ),
                                const HeightWidget(8.0),
                                NormalText(
                                  "profile_page.coach".tr(context),
                                  color: kPrimaryColor,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
