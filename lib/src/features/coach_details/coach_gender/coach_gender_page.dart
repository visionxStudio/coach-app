import 'package:auto_route/auto_route.dart';
import 'package:digicoach/app_localization.dart';
import 'package:digicoach/src/common/constants/asset_image_link.dart';
import 'package:digicoach/src/common/constants/constants.dart';
import 'package:digicoach/src/common/widgets/button/custom_elevated_button.dart';
import 'package:digicoach/src/common/widgets/custom_progress_indicator_overlay/custom_progress_indicator_overlay.dart';
import 'package:digicoach/src/common/widgets/date_picker/bloc/date_picker_controller.dart';
import 'package:digicoach/src/common/widgets/date_picker/date_picker.dart';
import 'package:digicoach/src/common/widgets/size/custom_size_widget.dart';
import 'package:digicoach/src/common/widgets/text/custom_normal_text_widget.dart';
import 'package:digicoach/src/features/coach_details/bloc/coach_provider.dart';
import 'package:digicoach/src/features/coach_details/coach_gender/bloc/coach_gender_controller.dart';
import 'package:digicoach/src/features/coach_details/coach_gender/bloc/coach_language_controller.dart';
import 'package:digicoach/src/features/coach_details/coach_gender/widgets/select_gender_widget.dart';
import 'package:digicoach/src/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';

class CoachGenderPage extends ConsumerStatefulWidget {
  const CoachGenderPage({Key? key}) : super(key: key);

  @override
  _CoachGenderPageState createState() => _CoachGenderPageState();
}

class _CoachGenderPageState extends ConsumerState<CoachGenderPage> {
  final items = ["French", "English", "Spanish", "Arabic", "Portuguese"];

  @override
  Widget build(BuildContext context) {
    return CustomProgressIndicatorOverlay(
      isLoading: ref.watch(coachStateProvider).status ==
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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  const HeightWidget(8.0),
                  NormalText(
                    "details_page.basic_information".tr(context),
                    fontSize: 24.0,
                    fontWeight: FontWeight.w400,
                    color: kPrimaryColor,
                  ),
                  const HeightWidget(8.0),
                  NormalText(
                    "details_page.little_intro".tr(context),
                    fontSize: 16.0,
                    isCentered: true,
                    fontWeight: FontWeight.w400,
                    color: ksearchText,
                  ),
                  const HeightWidget(8.0),
                  const HeightWidget(16.0),
                  Column(
                    children: [
                      const DateTimeWidget(),
                      Consumer(
                        builder: (ctx, ref, child) {
                          final language = ref.watch(languageProvider);

                          return Container(
                            height: 50.0,
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            decoration: BoxDecoration(
                                color: kWhiteColor,
                                borderRadius: BorderRadius.circular(8.0)),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                isExpanded: true,
                                hint: NormalText(
                                  language.selectedLanguage.isEmpty
                                      ? "details_page.language".tr(context)
                                      : language.selectedLanguage.join(", "),
                                  color: language.selectedLanguage.isNotEmpty
                                      ? kBlackColor
                                      : ksearchText,
                                ),
                                items: items.map((item) {
                                  return buildMenuItems(
                                      item: item,
                                      selectedLanguage:
                                          language.selectedLanguage);
                                }).toList(),
                                onChanged: (value) {
                                  language.addLanguage(value!);
                                },
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  const HeightWidget(16.0),
                  Column(
                    children: [
                      NormalText(
                        "details_page.gender_select".tr(context),
                        fontWeight: FontWeight.bold,
                      ),
                      const HeightWidget(16.0),
                      Consumer(
                        builder: (ctx, ref, child) {
                          final genderIndex = ref.watch(genderProvider);
                          return Row(
                            children: [
                              SelectGenderWidget(
                                svgIcon: IconAsset.male,
                                gender: "details_page.male"
                                    .tr(context)
                                    .toUpperCase(),
                                isSelected:
                                    genderIndex.selectedGenderIndex == 0,
                                onTap: () {
                                  genderIndex.changeGenderIndex(0);
                                },
                              ),
                              SelectGenderWidget(
                                svgIcon: IconAsset.female,
                                gender: "details_page.female"
                                    .tr(context)
                                    .toUpperCase(),
                                isSelected:
                                    genderIndex.selectedGenderIndex == 1,
                                onTap: () {
                                  genderIndex.changeGenderIndex(1);
                                },
                              ),
                              SelectGenderWidget(
                                svgIcon: IconAsset.other,
                                gender: "details_page.other"
                                    .tr(context)
                                    .toUpperCase(),
                                isSelected:
                                    genderIndex.selectedGenderIndex == 2,
                                onTap: () {
                                  genderIndex.changeGenderIndex(2);
                                },
                              ),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                  const HeightWidget(16.0),
                  CustomElevatedButton(
                    label: "details_page.continue".tr(context),
                    onPressed: () async {
                      if (ref
                              .read(datePickerControllerProvider)
                              .isDateChanged &&
                          ref
                              .read(languageProvider)
                              .selectedLanguage
                              .isNotEmpty &&
                          ref.read(genderProvider).selectedGenderIndex <= 3) {
                        final state = ref.read(coachStateProvider);
                        await ref
                            .read(coachStateProvider.notifier)
                            .updateCoachInformation(
                              date: ref
                                  .read(datePickerControllerProvider)
                                  .dateTime,
                              email: state.email!.value,
                              genderValue:
                                  ref.read(genderProvider).selectedGenderIndex,
                              postal: state.postal,
                              language:
                                  ref.read(languageProvider).selectedLanguage,
                              name: state.name!.value,
                            )
                            .then(
                              (_) => context.router.push(
                                const CoachDocumentsPageRoute(),
                              ),
                            );
                      } else {
                        return;
                      }
                    },
                  ),
                  const HeightWidget(8.0),
                  NormalText(
                    "details_page.skip_now".tr(context),
                    fontSize: 18.0,
                    color: kTextLinkColor,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItems(
          {required String item, required List<String> selectedLanguage}) =>
      DropdownMenuItem(
        enabled: true,
        value: item,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  item,
                  style: TextStyle(
                    color: selectedLanguage.contains(item)
                        ? kBottonColor
                        : kBlackColor,
                  ),
                ),
                selectedLanguage.contains(item)
                    ? const Icon(
                        Icons.done,
                        color: kBottonColor,
                        size: 16.0,
                      )
                    : const SizedBox(),
              ],
            ),
            const Divider(),
          ],
        ),
      );
}
