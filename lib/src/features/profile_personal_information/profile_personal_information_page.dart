import 'package:digicoach/app_localization.dart';
import 'package:digicoach/src/common/constants/asset_image_link.dart';
import 'package:digicoach/src/common/constants/constants.dart';
import 'package:digicoach/src/common/constants/enums.dart';
import 'package:digicoach/src/common/utils/app_size_utils.dart';
import 'package:digicoach/src/common/widgets/input_field/custom_regular_input_field.dart';
import 'package:digicoach/src/common/widgets/size/custom_size_widget.dart';
import 'package:digicoach/src/common/widgets/text/custom_normal_text_widget.dart';
import 'package:digicoach/src/features/main_dashboard_container/bloc/main_dashboard_controller.dart';
import 'package:digicoach/src/features/profile_setting/coach_profile_setting_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:ui' as ui;

import 'package:super_tooltip/super_tooltip.dart';

class ProfilePersonalInformationPage extends ConsumerStatefulWidget {
  const ProfilePersonalInformationPage({Key? key}) : super(key: key);

  @override
  _ProfilePersonalInformationPageState createState() =>
      _ProfilePersonalInformationPageState();
}

class _ProfilePersonalInformationPageState
    extends ConsumerState<ProfilePersonalInformationPage> {
  SuperTooltip? tooltip;
  int km = 1;
  TextEditingController dateofbirthController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController postalcodeController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController countryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ProfileSettingBackgroundWidget(
      title: 'ps_pi_page.title',
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomRegularInputField(
              iscomplete: false,
              svg: true,
              controller: dateofbirthController,
              hintText: 'ps_pi_page.dateofbirth',
              leadingIcon: IconAsset.calendar),
          CustomRegularInputField(
              iscomplete: false,
              svg: true,
              controller: addressController,
              hintText: 'ps_pi_page.address',
              leadingIcon: IconAsset.addresssvg),
          CustomRegularInputField(
              iscomplete: false,
              svg: true,
              controller: postalcodeController,
              hintText: 'ps_pi_page.codepostal',
              leadingIcon: IconAsset.postalcode),
          CustomRegularInputField(
              iscomplete: false,
              svg: true,
              controller: cityController,
              hintText: 'ps_pi_page.city',
              leadingIcon: IconAsset.building),
          CustomRegularInputField(
              iscomplete: false,
              svg: true,
              controller: countryController,
              hintText: 'ps_pi_page.country',
              leadingIcon: IconAsset.mapsearch),
          HeightWidget(height(30)),
          if (ref.watch(mainDashboardProvider).userType == UserType.coach)
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: kDefaultPadding + 8),
                  child: Row(
                    children: [
                      const ShaderIcon(icon: IconAsset.mapsearch),
                      Expanded(
                        child: NormalText(
                          AppLocalizations.of(context)
                              .translate("ps_pi_page.travelarea"),
                          isCentered: true,
                        ),
                      ),
                    ],
                  ),
                ),
                const HeightWidget(10),
                NormalText("$km km"),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const ShaderIcon(icon: IconAsset.tooltip),
                    Expanded(
                      child: Slider(
                          value: km.toDouble(),
                          min: 1,
                          max: 100,
                          divisions: 100,
                          activeColor: kIndicatorColor3,
                          inactiveColor: kIndicatorColor3.withOpacity(.6),
                          label: '${km.round()} Km',
                          onChanged: (double newValue) {
                            setState(() {
                              km = newValue.round();
                            });
                          },
                          semanticFormatterCallback: (double newValue) {
                            return '${newValue.round()}';
                          }),
                    ),
                  ],
                )
              ],
            )
        ],
      ),
    );
  }
}

class ShaderIcon extends StatelessWidget {
  final String icon;
  const ShaderIcon({Key? key, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (Rect bounds) {
        return ui.Gradient.linear(
          const Offset(-4.0, 4.0),
          const Offset(4.0, -4.0),
          [kIconGradientColor2, kIconGradientColor1],
        );
      },
      child: SvgPicture.asset(
        icon,
        width: width(36),
        height: height(30),
        color: kPrimaryColor,
        cacheColorFilter: true,
      ),
    );
  }
}
