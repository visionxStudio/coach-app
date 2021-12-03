import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:digicoach/src/common/constants/asset_image_link.dart';
import 'package:digicoach/src/common/constants/strings.dart';
import 'package:digicoach/src/common/widgets/back_and_close_button.dart';
import 'package:digicoach/src/common/widgets/button/custom_rounded_button.dart';
import 'package:digicoach/src/common/widgets/text/custom_subtitle.dart';
import 'package:digicoach/src/features/auth/avatar/avatar.dart';
import 'package:digicoach/src/features/auth/login/login_page.dart';
import 'package:digicoach/src/features/auth/widgets/gradient_shader_text.dart';
import 'package:digicoach/src/routes/router.dart';
import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  const AvatarPage({Key? key}) : super(key: key);

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
                  onBackTap: () {},
                  onCloseTap: () {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (_) => const LoginPage()));
                  },
                ),
                const Spacer(),
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      GradientShaderText(text: Strings.kLetsgo),
                      SizedBox(height: 8.0),
                      CustomSubtitle(text: Strings.kChooseProfile),
                    ],
                  ),
                ),
                const Spacer(),
                const CreateAvatar(
                  image: ImageAsset.individual,
                  title: Strings.kIndividual,
                  description: Strings.kGoodMood,
                ),
                const SizedBox(height: 8.0),
                const Divider(),
                const SizedBox(height: 16.0),
                const CreateAvatar(
                  image: ImageAsset.coach,
                  title: Strings.kCoach,
                  description: Strings.kProof,
                ),
                const Spacer(),
                const Spacer(),
                CustomRoundedButton(
                    text: "Sign Up",
                    onTap: () {
                      context.router.push(OnBoardingMainPageRoute());
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
