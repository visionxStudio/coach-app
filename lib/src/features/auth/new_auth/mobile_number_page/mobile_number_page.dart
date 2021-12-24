import 'package:auto_route/auto_route.dart';
import 'package:digicoach/app_localization.dart';
import 'package:digicoach/src/common/constants/constants.dart';
import 'package:digicoach/src/common/widgets/button/custom_rounded_button.dart';
import 'package:digicoach/src/common/widgets/input_field/minimal_input_field.dart';
import 'package:digicoach/src/common/widgets/size/custom_size_widget.dart';
import 'package:digicoach/src/common/widgets/text/custom_normal_text_widget.dart';
import 'package:digicoach/src/features/auth/bloc/signup_with_mobile/mobile_signup_state.dart';
import 'package:digicoach/src/features/auth/bloc/signup_with_mobile/signup_with_mobile_state_notifier.dart';
import 'package:digicoach/src/features/auth/new_auth/mobile_number_page/widgets/country_dropdown.dart';
import 'package:digicoach/src/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';

class MobileNumberPage extends ConsumerStatefulWidget {
  const MobileNumberPage({Key? key}) : super(key: key);

  @override
  _MobileNumberPageState createState() => _MobileNumberPageState();
}

class _MobileNumberPageState extends ConsumerState<MobileNumberPage> {
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
        context.router.push(const OtpPageRoute());
      }
    });

    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
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
          height: MediaQuery.of(context).size.height * 0.8,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // const Spacer(),
              const HeightWidget(30.0),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  NormalText(
                    "mobile_number_page.enter_mobile".tr(context),
                    fontSize: 24.0,
                    isCentered: true,
                  ),
                  const HeightWidget(8.0),
                  NormalText(
                    "mobile_number_page.will_send_otp".tr(context),
                    color: kLightGreyColor,
                    isCentered: true,
                  ),
                ],
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CountryCodeDropdown(),
                    const WidthWidget(8.0),
                    Consumer(
                      builder: (ctx, ref, child) {
                        final state = ref.watch(mobileSignUpStateProvider);
                        return Expanded(
                          child: Form(
                            key: _formKey,
                            child: MinimalInputField(
                              validator: (String? value) {
                                if (value!.isEmpty) {
                                  return "Field is required ";
                                } else if (state.mobileNumber.invalid) {
                                  return "Invalid mobile number";
                                }
                                return null;
                              },
                              errorText: state.mobileNumber.invalid
                                  ? "Invalid mobile number"
                                  : null,
                              onChanged: ref
                                  .read(mobileSignUpStateProvider.notifier)
                                  .mobileNumberChanged,
                              hintText: "(00)-00-00-00-00",
                              maxLines: 10,
                              textInputType: TextInputType.phone,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              const Spacer(),
              const Spacer(),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomRoundedButton(
                    text: "mobile_number_page.continue".tr(context),
                    onTap: () async {
                      if (_formKey.currentState!.validate()) {
                        await ref
                            .read(mobileSignUpStateProvider.notifier)
                            .initiatePhoneLogin();
                      } else {
                        return;
                      }
                    },
                    borderRadius: 8.0,
                    backgroundColor: kBottonColor,
                    fontWeight: FontWeight.w400,
                    width: width * 0.9,
                  ),
                  const HeightWidget(16.0),
                  NormalText(
                    "mobile_number_page.already_account".tr(context),
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
    );
  }
}
