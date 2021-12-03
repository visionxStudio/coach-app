import 'package:digicoach/src/common/constants/asset_image_link.dart';
import 'package:digicoach/src/common/constants/strings.dart';
import 'package:digicoach/src/common/utils/device_info.dart';
import 'package:digicoach/src/common/widgets/app_widgets.dart';
import 'package:digicoach/src/common/widgets/back_and_close_button.dart';
import 'package:digicoach/src/common/widgets/button/custom_rounded_button.dart';
import 'package:digicoach/src/common/widgets/text/custom_subtitle.dart';
import 'package:digicoach/src/features/auth/login/login_page.dart';
import 'package:digicoach/src/features/auth/widgets/gradient_shader_text.dart';
import 'package:digicoach/src/routes/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PersonalInfoPage extends ConsumerStatefulWidget {
  const PersonalInfoPage({Key? key}) : super(key: key);

  @override
  _PersonalInfoPageState createState() => _PersonalInfoPageState();
}

class _PersonalInfoPageState extends ConsumerState<PersonalInfoPage> {
  bool val = false;
  DeviceInfo deviceInfo = DeviceInfo();

  @override
  void initState() {
    init();

    super.initState();
  }

  void init() async {
    await deviceInfo.initPlatformState();
  }

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
                    }),
                const Spacer(),
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      GradientShaderText(text: Strings.kLetsgo),
                      CustomSubtitle(text: Strings.kPersonalInformation)
                    ],
                  ),
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildFormTextField(
                      hintText: "Email",
                      leadingIcon: IconAsset.date,
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                    ),
                    buildFormTextField(
                      hintText: "Nom",
                      leadingIcon: IconAsset.address,
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                    ),
                    buildFormTextField(
                      hintText: "Mot de passe",
                      leadingIcon: IconAsset.postal,
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                    ),
                    buildFormTextField(
                      hintText: "Confirmation du mot de passe",
                      leadingIcon: IconAsset.villie,
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                    ),
                    buildFormTextField(
                      hintText: "Confirmation du mot de passe",
                      leadingIcon: IconAsset.pays,
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                    ),
                    const SizedBox(height: 8.0),
                  ],
                ),
                const CustomSubtitle(text: Strings.kInformation),
                const Spacer(),
                const Spacer(),
                CustomRoundedButton(
                  text: "Continue",
                  onTap: () {
                    context.router.push(const AvatarPageRoute());
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
