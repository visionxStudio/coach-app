import 'package:digicoach/app_localization.dart';
import 'package:digicoach/src/common/constants/constants.dart';
import 'package:digicoach/src/common/utils/app_size_utils.dart';
import 'package:digicoach/src/common/widgets/button/custom_elevated_button.dart';
import 'package:digicoach/src/common/widgets/input_field/minimal_input_field.dart';
import 'package:digicoach/src/common/widgets/size/custom_size_widget.dart';
import 'package:digicoach/src/common/widgets/text/custom_normal_text_widget.dart';
import 'package:digicoach/src/features/auth/new_auth/connect_account/widgets/social_login.dart';
import 'package:flutter/material.dart';

class ConnectAccountWithEmail extends StatelessWidget {
  const ConnectAccountWithEmail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScafoldColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              height: SizeConfig.screenHeight * 0.9,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Spacer(),
                  const HeightWidget(16.0),
                  const NormalText(
                    "Créer un compte",
                    fontSize: 24.0,
                    isCentered: true,
                  ),
                  const Spacer(),
                  const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const MinimalInputField(hintText: "Adresse e-mail"),
                      const MinimalInputField(hintText: "Mot de passe"),
                      NormalText(
                        "login_page.password_rule1".tr(context),
                        color: kDarkGrey,
                        fontSize: 16.0,
                      ),
                      NormalText(
                        "login_page.password_rule2".tr(context),
                        color: kDarkGrey,
                        fontSize: 16.0,
                      ),
                    ],
                  ),
                  const HeightWidget(16.0),
                  Column(
                    children: [
                      CustomElevatedButton(
                        label: "Créer un compte",
                        onPressed: () {},
                      ),
                      const HeightWidget(8),
                      NormalText(
                        "mobile_number_page.already_account".tr(context),
                        color: kTextLinkColor,
                        fontWeight: FontWeight.w400,
                      )
                    ],
                  ),
                  const Spacer(),
                  const HeightWidget(16.0),
                  const SocialLogin(),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
