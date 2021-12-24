import 'package:formz/formz.dart';

enum MobileNumberValidationError { invalid }

/// Forz input for MobileNumber filed with MobileNumber length 6
class MobileNumber extends FormzInput<String, MobileNumberValidationError> {
  const MobileNumber.dirty(value) : super.dirty(value);
  const MobileNumber.pure() : super.pure('');

  @override
  validator(String value) {
    return (value.length == 10) ? null : MobileNumberValidationError.invalid;
  }
}
