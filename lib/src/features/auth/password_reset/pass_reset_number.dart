import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:digicoach/src/common/widgets/back_and_close_button.dart';
import 'package:digicoach/src/common/widgets/button/custom_rounded_button.dart';
import 'package:digicoach/src/common/widgets/text/custom_subtitle.dart';
import 'package:digicoach/src/features/auth/login/login_page.dart';
import 'package:digicoach/src/features/auth/widgets/gradient_shader_text.dart';
import 'package:digicoach/src/routes/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class PassResetNumberPage extends StatelessWidget {
  const PassResetNumberPage({Key? key}) : super(key: key);

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
                    // CustomHeading(
                    //     title: "Mot de passe oublié ?",
                    //     center: false,
                    //     fontSize: 34.0),
                    GradientShaderText(
                      text: "Mot de passe oublié ?",
                      fontSize: 34.0,
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(height: 8.0),
                    CustomSubtitle(
                        text:
                            "Si vous avez besoin de rénitialiser votre mot de passe nous pouvons vous aider en vous envoyant un message avec un nouveau mot de passe.")
                  ],
                ),
                const Spacer(),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 50.0,
                      child: InternationalPhoneNumberInput(
                        spaceBetweenSelectorAndTextField: 4.0,
                        selectorConfig: const SelectorConfig(
                          leadingPadding: 0.0,
                          selectorType: PhoneInputSelectorType.DROPDOWN,
                          trailingSpace: false,
                          setSelectorButtonAsPrefixIcon: false,
                          showFlags: true,
                          useEmoji: true,
                        ),
                        cursorColor: Colors.blue,
                        onInputChanged: (PhoneNumber number) {},
                        inputBorder: InputBorder.none,
                        maxLength: 10,
                        hintText: "Votre numéro de téléphone",
                        inputDecoration: const InputDecoration(
                          enabledBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          hintText: "Votre numéro de téléphone",
                          focusedBorder: InputBorder.none,
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                        textStyle: const TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.w600),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Divider(
                        color: Colors.grey.withOpacity(0.3),
                      ),
                    )
                  ],
                ),
                const Spacer(),
                const Spacer(),
                CustomRoundedButton(
                  text: "Next",
                  onTap: () {
                    context.router.push(const OTPPageRoute());
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
