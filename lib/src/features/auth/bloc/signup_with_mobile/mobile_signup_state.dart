import 'package:digicoach/src/core/form_inputs/mobile_number.dart';
import 'package:digicoach/src/core/form_inputs/otp.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'mobile_signup_state.freezed.dart';

@freezed
class MobileSignUpState with _$MobileSignUpState {
  /// State of Signup form
  const factory MobileSignUpState({
    /// Formz MobileNumberChecking
    required MobileNumber mobileNumber,
    // countryCode
    required String countryCode,
    // smsCode
    required Otp smsCode,

    // checking the status for form
    required FormzStatus status,

    /// Error message if form submission is failed
    String? errorMessage,
  }) = _MobileSignUpState;

  /// Initial state of Signup form
  factory MobileSignUpState.initial() => const MobileSignUpState(
        mobileNumber: MobileNumber.pure(),
        countryCode: "+977",
        smsCode: Otp.pure(),
        status: FormzStatus.pure,
      );
}
