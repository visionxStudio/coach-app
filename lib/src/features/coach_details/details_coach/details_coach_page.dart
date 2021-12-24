import 'package:auto_route/auto_route.dart';
import 'package:digicoach/src/common/widgets/image_picker/image_picker_widget.dart';
import 'package:digicoach/app_localization.dart';
import 'package:digicoach/src/common/constants/constants.dart';
import 'package:digicoach/src/common/widgets/button/custom_elevated_button.dart';
import 'package:digicoach/src/common/widgets/input_field/minimal_input_field.dart';
import 'package:digicoach/src/common/widgets/size/custom_size_widget.dart';
import 'package:digicoach/src/common/widgets/text/custom_normal_text_widget.dart';
import 'package:digicoach/src/features/coach_details/bloc/coach_provider.dart';
import 'package:digicoach/src/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailsCoachPage extends ConsumerStatefulWidget {
  const DetailsCoachPage({Key? key}) : super(key: key);

  @override
  _DetailsCoachPageState createState() => _DetailsCoachPageState();
}

class _DetailsCoachPageState extends ConsumerState<DetailsCoachPage> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                const ImagePickerWidget(),
                const HeightWidget(16.0),
                Consumer(
                  builder: (ctx, ref, child) {
                    final state = ref.watch(coachStateProvider);
                    return Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          MinimalInputField(
                            hintText: "details_page.name".tr(context),
                            textInputType: TextInputType.name,
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return "Field is required ";
                              } else if (state.name!.invalid) {
                                return "Invalid name";
                              }
                              return null;
                            },
                            onChanged: ref
                                .read(coachStateProvider.notifier)
                                .nameChanged,
                          ),
                          MinimalInputField(
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return "Field is required ";
                              } else if (state.email!.invalid) {
                                return "Invalid Email";
                              }
                              return null;
                            },
                            hintText: "details_page.email".tr(context),
                            textInputType: TextInputType.emailAddress,
                            onChanged: ref
                                .read(coachStateProvider.notifier)
                                .emailChanged,
                          ),
                          MinimalInputField(
                            hintText: "details_page.postal".tr(context),
                            textInputType: TextInputType.text,
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return "Field is required ";
                              }
                              return null;
                            },
                            onChanged: ref
                                .read(coachStateProvider.notifier)
                                .postalAddressChanged,
                          ),
                        ],
                      ),
                    );
                  },
                ),
                const HeightWidget(8.0),
                CustomElevatedButton(
                  label: "details_page.continue".tr(context),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      context.router.push(const CoachGenderPageRoute());
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
