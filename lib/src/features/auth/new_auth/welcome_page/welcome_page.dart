import 'package:auto_route/auto_route.dart';
import 'package:digicoach/app_localization.dart';
import 'package:digicoach/src/common/constants/asset_image_link.dart';
import 'package:digicoach/src/common/constants/constants.dart';
import 'package:digicoach/src/common/widgets/button/custom_rounded_button.dart';
import 'package:digicoach/src/common/widgets/size/custom_size_widget.dart';
import 'package:digicoach/src/common/widgets/text/custom_normal_text_widget.dart';
import 'package:digicoach/src/common/widgets/text/text_span.dart';
import 'package:digicoach/src/routes/router.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    final double width = MediaQuery.of(context).size.width;
    const double topHeight = 0.4;
    return Scaffold(
      backgroundColor: kScafoldColor,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: height * 0.13,
              child: Image.asset(
                ImageAsset.welcome,
                width: MediaQuery.of(context).size.width,
                height: 291.42,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              width: width,
              height: height,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: height * topHeight,
                      child: Column(
                        children: [
                          HeightWidget(height * 0.1),
                          NormalText(
                            "welcome_page.welcome".tr(context),
                            color: kPrimaryColor,
                            fontSize: 38.0,
                            fontWeight: FontWeight.w400,
                          ),
                          const HeightWidget(8.0),
                          NormalText(
                            "welcome_page.coach_anywhere1".tr(context),
                            fontSize: 18.0,
                            color: kDarkGrey,
                            letterspacing: 0.5,
                          ),
                          const HeightWidget(4.0),
                          NormalText(
                            "welcome_page.coach_anywhere2".tr(context),
                            fontSize: 18.0,
                            letterspacing: 0.5,
                            color: kDarkGrey,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height * (1 - topHeight),
                      child: Column(
                        children: [
                          const Spacer(),
                          const Spacer(),
                          const Spacer(),
                          Column(
                            children: [
                              CustomRoundedButton(
                                text: "welcome_page.start"
                                    .tr(context)
                                    .toUpperCase(),
                                borderRadius: 8.0,
                                backgroundColor: kBottonColor,
                                fontWeight: FontWeight.w400,
                                width: width * 0.9,
                                onTap: () {
                                  AutoRouter.of(context)
                                      .push(const MobileNumberPageRoute());
                                },
                              ),
                              const HeightWidget(16.0),
                              CustomRoundedButton(
                                text: "welcome_page.already_account"
                                    .tr(context)
                                    .toUpperCase(),
                                borderRadius: 8.0,
                                backgroundColor: kWhiteColor,
                                fontColor: kBlackColor,
                                width: width * 0.9,
                                fontWeight: FontWeight.w400,
                                onTap: () {
                                  context.router.push(
                                      const ConnectAccountWithEmailRoute());
                                },
                              ),
                            ],
                          ),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 8.0),
                            child: Center(
                              child: RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                  children: [
                                    customTextSpan(
                                      text: "welcome_page.terms1".tr(context),
                                      color: ksearchText,
                                      letterSpacing: 0.4,
                                      height: 1.5,
                                      onTap: TapGestureRecognizer()
                                        ..onTap = () {},
                                    ),
                                    customTextSpan(
                                      text: "welcome_page.terms2".tr(context),
                                      underLine: true,
                                      color: ksearchText,
                                      letterSpacing: 0.4,
                                      height: 1.5,
                                      onTap: TapGestureRecognizer()
                                        ..onTap = () {},
                                    ),
                                    customTextSpan(
                                      text: "welcome_page.terms3".tr(context),
                                      color: ksearchText,
                                      letterSpacing: 0.4,
                                      height: 1.5,
                                      onTap: TapGestureRecognizer()
                                        ..onTap = () {},
                                    ),
                                    customTextSpan(
                                      text: "welcome_page.terms4".tr(context),
                                      color: ksearchText,
                                      underLine: true,
                                      letterSpacing: 0.4,
                                      height: 1.5,
                                      onTap: TapGestureRecognizer()
                                        ..onTap = () {},
                                    ),
                                    customTextSpan(
                                      text: "welcome_page.terms5".tr(context),
                                      color: ksearchText,
                                      letterSpacing: 0.4,
                                      height: 1.5,
                                      onTap: TapGestureRecognizer()
                                        ..onTap = () {},
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const HeightWidget(16.0),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
