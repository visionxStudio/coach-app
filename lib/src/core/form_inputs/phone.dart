import 'package:formz/formz.dart';

enum PhoneValidationError {
  /// Generic invalid error.
  invalid
}

/// Form input for an phone number input.
class Phone extends FormzInput<String, PhoneValidationError> {
  const Phone.pure() : super.pure('');
  const Phone.dirty(value) : super.dirty(value);

  @override
  PhoneValidationError? validator(String value) {
    return (value.startsWith('9') && value.length == 10)
        ? null
        : PhoneValidationError.invalid;
  }
}
