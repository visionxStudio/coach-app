import 'package:digicoach/app_localization.dart';
import 'package:digicoach/src/common/constants/asset_image_link.dart';
import 'package:digicoach/src/common/constants/constants.dart';
import 'package:digicoach/src/common/utils/app_size_utils.dart';
import 'package:digicoach/src/common/widgets/button/custom_rounded_button.dart';
import 'package:digicoach/src/common/widgets/size/custom_size_widget.dart';
import 'package:flutter/material.dart';

class SocialLogin extends StatelessWidget {
  const SocialLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomRoundedButton(
          icon: IconAsset.google,
          fontColor: kNavBackgroundColor,
          backgroundColor: kWhiteColor,
          text: "login_page.google".tr(context),
          onTap: () {},
        ),
        HeightWidget(SizeConfig.screenHeight < 700 ? 12 : 8.0),
        CustomRoundedButton(
          icon: IconAsset.facebook,
          fontColor: kNavBackgroundColor,
          backgroundColor: kWhiteColor,
          text: "login_page.facebook".tr(context),
          onTap: () {},
        ),
        HeightWidget(SizeConfig.screenHeight < 700 ? 12 : 8.0),
        CustomRoundedButton(
          icon: IconAsset.apple,
          fontColor: kNavBackgroundColor,
          backgroundColor: kWhiteColor,
          text: "login_page.apple".tr(context),
          onTap: () {},
        ),
      ],
    );
  }
}
