import 'package:formz/formz.dart';

/// Validation errors for the [Name] [FormzInput].
enum NameValidatorError {
  /// Generic invalid error.
  invalid
}

/// Form input for an Name input.
class Name extends FormzInput<String, NameValidatorError> {
  const Name.pure() : super.pure('');
  const Name.dirty(value) : super.dirty(value);

  @override
  NameValidatorError? validator(String value) {
    return value.length > 3 ? null : NameValidatorError.invalid;
  }
}
