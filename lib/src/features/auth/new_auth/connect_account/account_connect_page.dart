import 'package:auto_route/auto_route.dart';
import 'package:digicoach/app_localization.dart';
import 'package:digicoach/src/common/constants/constants.dart';
import 'package:digicoach/src/common/utils/app_size_utils.dart';
import 'package:digicoach/src/common/widgets/button/custom_rounded_button.dart';
import 'package:digicoach/src/common/widgets/size/custom_size_widget.dart';
import 'package:digicoach/src/common/widgets/text/custom_normal_text_widget.dart';
import 'package:digicoach/src/routes/router.dart';
import 'package:flutter/material.dart';

class AccountConnectPage extends StatelessWidget {
  const AccountConnectPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScafoldColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: SizedBox(
            width: double.infinity,
            height: SizeConfig.screenHeight,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  HeightWidget(SizeConfig.screenHeight < 700 ? 90 : 80.0),
                  NormalText(
                    "connect_account.connect_social_account".tr(context),
                    color: kPrimaryColor,
                    fontSize: 24.0,
                    fontWeight: FontWeight.w400,
                  ),
                  HeightWidget(SizeConfig.screenHeight < 700 ? 80 : 50.0),
                  Column(
                    children: [
                      Column(
                        children: [
                          CustomRoundedButton(
                            text: "connect_account.google_connect".tr(context),
                            backgroundColor: kWhiteColor,
                            fontColor: kPrimaryColor,
                            borderRadius: 8.0,
                            width: SizeConfig.screenWidth * 0.9,
                            onTap: () {},
                          ),
                          HeightWidget(
                              SizeConfig.screenHeight < 700 ? 12 : 8.0),
                          CustomRoundedButton(
                            text:
                                "connect_account.facebook_connect".tr(context),
                            backgroundColor: kWhiteColor,
                            fontColor: kPrimaryColor,
                            borderRadius: 8.0,
                            width: SizeConfig.screenWidth * 0.9,
                            onTap: () {},
                          ),
                          HeightWidget(
                              SizeConfig.screenHeight < 700 ? 12 : 8.0),
                          CustomRoundedButton(
                            text: "connect_account.apple_connect".tr(context),
                            backgroundColor: kWhiteColor,
                            fontColor: kPrimaryColor,
                            borderRadius: 8.0,
                            width: SizeConfig.screenWidth * 0.9,
                            onTap: () {},
                          ),
                        ],
                      ),
                      HeightWidget(SizeConfig.screenHeight < 700 ? 30 : 20.0),
                      Column(
                        children: [
                          CustomRoundedButton(
                            text: "connect_account.continue".tr(context),
                            backgroundColor: kBottonColor,
                            borderRadius: 8.0,
                            width: SizeConfig.screenWidth * 0.9,
                            onTap: () {
                              context.router
                                  .push(const SelectProfilePageRoute());
                            },
                          ),
                          HeightWidget(
                              SizeConfig.screenHeight < 700 ? 12 : 8.0),
                          NormalText(
                            "connect_account.skip_now".tr(context),
                            color: kPrimaryColor,
                          )
                        ],
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
