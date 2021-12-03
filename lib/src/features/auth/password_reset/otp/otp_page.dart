// ignore_for_file: implementation_imports

import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:digicoach/src/common/constants/strings.dart';
import 'package:digicoach/src/common/widgets/back_and_close_button.dart';
import 'package:digicoach/src/common/widgets/button/custom_rounded_button.dart';
import 'package:digicoach/src/common/widgets/text/custom_subtitle.dart';
import 'package:digicoach/src/features/auth/password_reset/otp/otp_form.dart';
import 'package:digicoach/src/features/auth/widgets/gradient_shader_text.dart';
import 'package:digicoach/src/routes/app_router.gr.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OTPPage extends StatelessWidget {
  const OTPPage({Key? key}) : super(key: key);

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
                ArrowbackAndCloseButton(
                    onBackTap: () {
                      Navigator.of(context);
                    },
                    onCloseTap: () {}),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    GradientShaderText(
                      text: Strings.kVerifyPhone,
                      fontSize: 34.0,
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    SizedBox(height: 8.0),
                    CustomSubtitle(
                      text: Strings.kFiveDigitCode,
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      "+977 9800*****",
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 16.0),
                    CustomSubtitle(text: Strings.kResendCode),
                  ],
                ),
                const Spacer(),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32.0),
                  child: OtpForm(),
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
