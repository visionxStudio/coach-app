// packages
import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:digicoach/src/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
// localization
import 'package:digicoach/app_localization.dart';
// common
import 'package:digicoach/src/common/constants/constants.dart';
import 'package:digicoach/src/common/widgets/button/custom_rounded_button.dart';
import 'package:digicoach/src/common/widgets/custom_progress_indicator_overlay/custom_progress_indicator_overlay.dart';
import 'package:digicoach/src/common/widgets/size/custom_size_widget.dart';
import 'package:digicoach/src/common/widgets/text/custom_normal_text_widget.dart';
// features
import 'package:digicoach/src/features/auth/new_auth/otp_page/widgets/otp_form.dart';
import 'package:digicoach/src/features/auth/bloc/signup_with_mobile/mobile_signup_state.dart';
import 'package:digicoach/src/features/auth/bloc/signup_with_mobile/signup_with_mobile_state_notifier.dart';

class OtpPage extends ConsumerStatefulWidget {
  const OtpPage({Key? key}) : super(key: key);

  @override
  _OtpPageState createState() => _OtpPageState();
}

class _OtpPageState extends ConsumerState<OtpPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    ref.listen<MobileSignUpState>(mobileSignUpStateProvider, (previous, next) {
      if (next.status.isSubmissionFailure) {
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(SnackBar(content: Text(next.errorMessage!)));
      }
      if (next.status.isSubmissionSuccess) {
        AutoRouter.of(context).push(const AccountConnectPageRoute());
      }
    });
    final double width = MediaQuery.of(context).size.width;
    return CustomProgressIndicatorOverlay(
      isLoading: ref.watch(mobileSignUpStateProvider).status ==
          FormzStatus.submissionInProgress,
      child: Scaffold(
        backgroundColor: kScafoldColor,
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              AutoRouter.of(context).pop();
            },
            borderRadius: BorderRadius.circular(50.0),
            child: const Icon(
              Icons.arrow_back,
              color: kPrimaryColor,
            ),
          ),
          elevation: 0.0,
          backgroundColor: kScafoldColor,
        ),
        body: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.8,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // const Spacer(),
                  const HeightWidget(30.0),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      NormalText(
                        "verification_page.otp_verification".tr(context),
                        fontSize: 24.0,
                        isCentered: true,
                      ),
                      const HeightWidget(8.0),
                      Consumer(
                        builder: (ctx, ref, child) {
                          final state = ref.read(mobileSignUpStateProvider);
                          return NormalText(
                            "verification_page.five_digit_code".tr(context) +
                                "(${state.countryCode})" +
                                state.mobileNumber.value,
                            lineHight: 1.4,
                            color: kLightGreyColor,
                            isCentered: true,
                          );
                        },
                      ),
                    ],
                  ),
                  // const Spacer(),
                  const HeightWidget(50.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Form(
                      key: _formKey,
                      child: const OtpForm(),
                    ),
                  ),

                  const Spacer(),
                  const Spacer(),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomRoundedButton(
                        text: "verification_page.continue".tr(context),
                        onTap: () async {
                          if (_formKey.currentState!.validate()) {
                            ref
                                .read(mobileSignUpStateProvider.notifier)
                                .checkSmsCode();
                          }
                          return;
                        },
                        borderRadius: 8.0,
                        backgroundColor: kBottonColor,
                        fontWeight: FontWeight.w400,
                        width: width * 0.9,
                      ),
                      const HeightWidget(16.0),
                      NormalText(
                        "verification_page.resend_otp".tr(context),
                        color: kTextLinkColor,
                        fontWeight: FontWeight.w400,
                      )
                    ],
                  ),
                  const Spacer(),
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
