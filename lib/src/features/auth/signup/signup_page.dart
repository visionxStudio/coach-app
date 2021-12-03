import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:digicoach/src/common/constants/asset_image_link.dart';
import 'package:digicoach/src/common/constants/constants.dart';
import 'package:digicoach/src/common/constants/strings.dart';
import 'package:digicoach/src/common/widgets/app_widgets.dart';
import 'package:digicoach/src/common/widgets/back_and_close_button.dart';
import 'package:digicoach/src/common/widgets/button/custom_rounded_button.dart';
import 'package:digicoach/src/common/widgets/custom_radio_widget.dart';
import 'package:digicoach/src/common/widgets/text/custom_subtitle.dart';
import 'package:digicoach/src/common/widgets/text/text_span.dart';
import 'package:digicoach/src/features/auth/login/login_widget.dart';
import 'package:digicoach/src/features/auth/login/login_page.dart';
import 'package:digicoach/src/features/auth/widgets/gradient_shader_text.dart';
import 'package:digicoach/src/routes/app_router.gr.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height - 53,
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ArrowbackAndCloseButton(onBackTap: () {
                  Navigator.of(context);
                }, onCloseTap: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (_) => const LoginPage()));
                }),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    GradientShaderText(text: Strings.kLetsgo),
                    CustomSubtitle(text: Strings.kRegisterwithNetwork)
                  ],
                ),
                const Spacer(),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildFormTextField(
                      hintText: "Email",
                      leadingIcon: IconAsset.mail,
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                    ),
                    buildFormTextField(
                      hintText: "Nom",
                      leadingIcon: IconAsset.user,
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                    ),
                    buildFormTextField(
                      hintText: "Mot de passe",
                      leadingIcon: IconAsset.user,
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                    ),
                    buildFormTextField(
                      hintText: "Confirmation du mot de passe",
                      leadingIcon: IconAsset.password,
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                    ),
                    const SizedBox(height: 4.0),
                    const CustomSubtitle(
                      text: Strings.kMinimumpass,
                      fontSize: 14.0,
                    ),
                    const SizedBox(height: 8.0),
                    Row(
                      children: [
                        const CustomRadioWidget(),
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 8.0),
                            child: Center(
                              child: RichText(
                                textAlign: TextAlign.left,
                                text: TextSpan(
                                  children: [
                                    customTextSpan(
                                      text: Strings.kSignInterms1,
                                      fontSize: 10.0,
                                      color: kGreyColor,
                                      onTap: TapGestureRecognizer()
                                        ..onTap = () {},
                                    ),
                                    customTextSpan(
                                      text: Strings.kSignInterms2,
                                      underLine: true,
                                      fontSize: 10.0,
                                      fontWeight: FontWeight.w500,
                                      onTap: TapGestureRecognizer()
                                        ..onTap = () {},
                                    ),
                                    customTextSpan(
                                      text: Strings.kSignInterms3,
                                      fontSize: 10.0,
                                      color: kGreyColor,
                                      onTap: TapGestureRecognizer()
                                        ..onTap = () {},
                                    ),
                                    customTextSpan(
                                      text: Strings.kSignInterms4,
                                      underLine: true,
                                      fontSize: 10.0,
                                      fontWeight: FontWeight.w500,
                                      onTap: TapGestureRecognizer()
                                        ..onTap = () {},
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                const BuildSocialSignup(),
                const Spacer(),
                CustomRoundedButton(
                  text: "Continue",
                  onTap: () {
                    context.router.push(const PersonalInfoPageRoute());
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
