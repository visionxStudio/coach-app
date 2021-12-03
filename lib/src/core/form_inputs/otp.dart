import 'package:formz/formz.dart';

enum OtpValidationError { invalid }

/// Forz input for Otp filed with otp length 6
class Otp extends FormzInput<String, OtpValidationError> {
  const Otp.dirty(value) : super.dirty(value);
  const Otp.pure() : super.pure('');

  @override
  validator(String value) {
    return (value.length == 6) ? null : OtpValidationError.invalid;
  }
}
