import 'package:digicoach/src/common/service/exceptions/network_exceptions.dart';
import 'package:digicoach/src/core/form_inputs/email.dart';
import 'package:digicoach/src/core/form_inputs/password.dart';
import 'package:digicoach/src/features/auth/bloc/auth_state_notifier.dart';
import 'package:digicoach/src/features/auth/bloc/login_state.dart';
import 'package:digicoach/src/features/auth/data/auth_repositiories.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';

final loginStateProvider =
    StateNotifierProvider.autoDispose<LoginNotifier, LoginState>((ref) =>
        LoginNotifier(ref.watch(authRepoProvider),
            ref.watch(authStateProvider.notifier)));

class LoginNotifier extends StateNotifier<LoginState> {
  LoginNotifier(this._authRepo, this._authStateNotifier)
      : super(LoginState.initial());

  final AuthRepository _authRepo;
  final AuthStateNotifier _authStateNotifier;

  void emailChanged(String value) {
    final email = Email.dirty(value);
    state = state.copyWith(
      email: email,
      status: Formz.validate([email]),
    );
  }

  void passwordChanged(String value) {
    final password = Password.dirty(value);
    state = state.copyWith(
      password: password,
      status: Formz.validate([password]),
    );
  }

  Future<void> login() async {
    if (!state.status.isValidated) return;

    state = state.copyWith(status: FormzStatus.submissionInProgress);

    try {
      await _authRepo.login(
          email: state.email.value, password: state.password.value);
      _authStateNotifier.checkAuthState();
    } on NetworkExceptions catch (e) {
      state = state.copyWith(
        status: FormzStatus.submissionFailure,
        errorMessage: e.getIntlException(),
      );
    }

    state = state.copyWith(status: FormzStatus.submissionSuccess);
  }
}
