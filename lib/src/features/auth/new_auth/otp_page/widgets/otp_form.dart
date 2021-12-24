import 'package:digicoach/src/common/constants/constants.dart';
import 'package:digicoach/src/features/auth/bloc/signup_with_mobile/signup_with_mobile_state_notifier.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpForm extends ConsumerStatefulWidget {
  final Color? backgroundColor;
  final Function(String)? onSubmitted;
  const OtpForm({
    Key? key,
    this.onSubmitted,
    this.backgroundColor,
  }) : super(key: key);

  @override
  _OtpFormState createState() => _OtpFormState();
}

class _OtpFormState extends ConsumerState<OtpForm> {
  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      validator: (String? value) {
        if (value!.length != 6) {
          return "Please enter six digit pin";
        } else if (value.isEmpty) {
          return "Fields cannot be empty";
        }
        return null;
      },
      length: 6,
      obscureText: false,
      keyboardType: TextInputType.number,
      cursorColor: kBlackColor,
      animationType: AnimationType.scale,
      cursorHeight: 18.0,
      errorTextSpace: 24.0,
      pinTheme: PinTheme(
        borderWidth: 0.0,
        activeColor: kWhiteColor,
        disabledColor: kWhiteColor,
        inactiveFillColor: widget.backgroundColor ?? kWhiteColor,
        selectedColor: kGreyColor,
        selectedFillColor: kWhiteColor,
        shape: PinCodeFieldShape.box,
        inactiveColor: kWhiteColor,
        borderRadius: BorderRadius.circular(4),
        fieldHeight: 50,
        fieldWidth: 50,
        activeFillColor: Colors.white,
      ),
      animationDuration: const Duration(milliseconds: 300),
      enableActiveFill: true,
      onCompleted: widget.onSubmitted,
      // onChanged: widget.onChanged,
      // onChanged: (String value) {},
      onChanged: ref.watch(mobileSignUpStateProvider.notifier).smsCodeChanged,
      beforeTextPaste: (text) {
        return true;
      },
      appContext: context,
    );
  }
}
