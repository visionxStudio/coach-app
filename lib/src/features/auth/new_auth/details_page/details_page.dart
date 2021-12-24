import 'package:auto_route/auto_route.dart';
import 'package:digicoach/app_localization.dart';
import 'package:digicoach/src/common/constants/constants.dart';
import 'package:digicoach/src/common/utils/app_size_utils.dart';
import 'package:digicoach/src/common/widgets/button/custom_rounded_button.dart';
import 'package:digicoach/src/common/widgets/date_picker/date_picker.dart';
import 'package:digicoach/src/common/widgets/image_picker/image_picker_widget.dart';
import 'package:digicoach/src/common/widgets/input_field/minimal_input_field.dart';
import 'package:digicoach/src/common/widgets/size/custom_size_widget.dart';
import 'package:digicoach/src/common/widgets/text/custom_normal_text_widget.dart';
import 'package:digicoach/src/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailsPage extends ConsumerStatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends ConsumerState<DetailsPage> {
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
                  color: kLightGreyColor,
                ),
                const HeightWidget(8.0),
                const ImagePickerWidget(),
                const HeightWidget(16.0),
                Column(
                  children: [
                    MinimalInputField(
                      hintText: "details_page.name".tr(context),
                      textInputType: TextInputType.name,
                    ),
                    const DateTimeWidget(
                        // onTap: () async {},
                        ),
                    MinimalInputField(
                      hintText: "details_page.email".tr(context),
                      textInputType: TextInputType.emailAddress,
                    ),
                    MinimalInputField(
                      hintText: "details_page.postal".tr(context),
                      textInputType: TextInputType.text,
                    ),
                  ],
                ),
                const HeightWidget(8.0),
                CustomRoundedButton(
                  width: SizeConfig.screenWidth * 0.9,
                  backgroundColor: kBottonColor,
                  borderRadius: 8.0,
                  fontWeight: FontWeight.w400,
                  text: "details_page.continue".tr(context),
                  onTap: () {
                    context.router.push(NavBarRoute());
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
