import 'package:digicoach/src/core/form_inputs/email.dart';
import 'package:digicoach/src/core/form_inputs/password.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState with _$LoginState {
  /// State of login form
  const factory LoginState({
    /// Formz input
    required Email email,
    required Password password,

    /// Status of form pure, valid, invalid, submissionInProgress
    /// submissionSuccess, submissionFailure & submissionCanceled
    required FormzStatus status,

    /// Error message if form submission is failed
    String? errorMessage,
  }) = _LoginState;

  /// Initial state of login form
  factory LoginState.initial() => const LoginState(
        email: Email.pure(),
        password: Password.pure(),
        status: FormzStatus.pure,
      );
}
