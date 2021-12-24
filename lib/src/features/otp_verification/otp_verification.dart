import 'package:digicoach/src/common/constants/constants.dart';
import 'package:digicoach/src/common/widgets/container/custom_container.dart';
import 'package:digicoach/src/common/widgets/rounded_button_text.dart';
import 'package:digicoach/src/common/widgets/size/custom_size_widget.dart';
import 'package:digicoach/src/common/widgets/text/custom_normal_text_widget.dart';
import 'package:digicoach/src/features/auth/new_auth/otp_page/widgets/otp_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OtpVerificationPage extends ConsumerStatefulWidget {
  const OtpVerificationPage({Key? key}) : super(key: key);

  @override
  _OtpVerificationPageState createState() => _OtpVerificationPageState();
}

class _OtpVerificationPageState extends ConsumerState<OtpVerificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScafoldColor,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: kPrimaryColor),
        backgroundColor: kWhiteColor,
        centerTitle: true,
        elevation: 0.0,
        title: const NormalText(
          "Vérification OTP",
          color: kPrimaryColor,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const HeightWidget(16.0),
            CustomContainer(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    OtpForm(
                      backgroundColor: kScafoldColor,
                      onSubmitted: (String code) {},
                    ),
                    const HeightWidget(32.0),
                    RoundedButtonAndText(
                        buttonText: "Continuer",
                        optionText: "Vous n'avez pas reçu d'OTP? Renvoyer",
                        buttonTap: () {},
                        optionTap: () {}),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
