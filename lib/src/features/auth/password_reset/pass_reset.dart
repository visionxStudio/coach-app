import 'package:digicoach/src/common/constants/asset_image_link.dart';
import 'package:digicoach/src/common/constants/strings.dart';
import 'package:digicoach/src/common/widgets/app_widgets.dart';
import 'package:digicoach/src/common/widgets/back_and_close_button.dart';
import 'package:digicoach/src/common/widgets/button/custom_rounded_button.dart';
import 'package:digicoach/src/common/widgets/custom_radio_widget.dart';
import 'package:digicoach/src/common/widgets/text/custom_subtitle.dart';
import 'package:digicoach/src/features/auth/login/login_widget.dart';
import 'package:digicoach/src/features/auth/password_reset/pass_reset_number.dart';
import 'package:digicoach/src/features/auth/login/login_page.dart';
import 'package:digicoach/src/features/auth/widgets/gradient_shader_text.dart';
import 'package:flutter/material.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({Key? key}) : super(key: key);

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
                    GradientShaderText(text: Strings.kWelcome),
                    CustomSubtitle(
                        text:
                            "Enregistrez-vous avec les réseaux ou remplissez le formulaire")
                  ],
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Divider(
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
                const Spacer(),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    buildFormTextField(
                      hintText: "Email",
                      leadingIcon: IconAsset.mail,
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                    ),
                    buildFormTextField(
                      hintText: "Mot de passe",
                      leadingIcon: IconAsset.password,
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                    ),
                    const SizedBox(height: 8.0),
                    Row(
                      children: const [
                        CustomRadioWidget(),
                        SizedBox(
                          width: 8.0,
                        ),
                        CustomSubtitle(text: "Se souvenir de moi"),
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                const BuildSocialSignup(),
                const Spacer(),
                CustomRoundedButton(
                  text: "Sign In",
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const PassResetNumberPage()));
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
