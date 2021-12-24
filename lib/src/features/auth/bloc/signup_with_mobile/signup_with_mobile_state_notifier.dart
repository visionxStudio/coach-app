import 'package:digicoach/src/common/service/exceptions/firebase_exceptions/exception_handler.dart';
import 'package:digicoach/src/common/service/exceptions/network_exceptions.dart';
import 'package:digicoach/src/common/utils/storage/base_storage.dart';
import 'package:digicoach/src/core/form_inputs/mobile_number.dart';
import 'package:digicoach/src/core/form_inputs/otp.dart';
import 'package:digicoach/src/features/auth/bloc/auth_state_notifier.dart';
import 'package:digicoach/src/features/auth/bloc/signup_with_mobile/mobile_signup_state.dart';
import 'package:digicoach/src/features/auth/data/auth_repositiories.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';

final mobileSignUpStateProvider = StateNotifierProvider.autoDispose<
    SignUpWithMobileNotifier, MobileSignUpState>(
  (ref) => SignUpWithMobileNotifier(
    ref.watch(authRepoProvider),
    ref.watch(authStateProvider.notifier),
  ),
);

class SignUpWithMobileNotifier extends StateNotifier<MobileSignUpState> {
  SignUpWithMobileNotifier(
    this._authRepo,
    this._authStateNotifier,
  ) : super(MobileSignUpState.initial());
  final AuthRepository _authRepo;
  final AuthStateNotifier _authStateNotifier;

  /// checking if [MobileNumber] is valid
  void mobileNumberChanged(String value) {
    final mobileNumber = MobileNumber.dirty(value);
    state = state.copyWith(
      mobileNumber: mobileNumber,
      status: Formz.validate([mobileNumber]),
    );
  }

  // copying the state for mobile number
  void countryCodeChanged(String countryCode) {
    state = state.copyWith(
      countryCode: countryCode,
    );
  }

  /// checking if [Otp] is valid
  void smsCodeChanged(String code) {
    final smsCode = Otp.dirty(code);
    state = state.copyWith(
      smsCode: smsCode,
      status: Formz.validate([smsCode]),
    );
  }

  Future<void> initiatePhoneLogin() async {
    if (!state.status.isValidated) return;

    state = state.copyWith(status: FormzStatus.submissionInProgress);
    try {
      await _authRepo.signupWithPhone(
          mobileNumber: state.countryCode + state.mobileNumber.value);
      state = state.copyWith(
        status: FormzStatus.submissionSuccess,
      );
    } on FirebaseAuthException catch (e) {
      state = state.copyWith(
        status: FormzStatus.submissionFailure,
        errorMessage: AuthExceptionHandler.handleException(e),
      );
    } on NetworkExceptions catch (e) {
      state = state.copyWith(
        status: FormzStatus.submissionFailure,
        errorMessage: e.getIntlException(),
      );
    }
  }

  void checkSmsCode() async {
    if (!state.status.isValidated) return;
    state = state.copyWith(status: FormzStatus.submissionInProgress);

    await shareprefrence.read("verificationId").then((verificationId) async {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId.replaceAll("\"", ""),
        smsCode: state.smsCode.value,
      );

      try {
        await FirebaseAuth.instance
            .signInWithCredential(credential)
            .then((UserCredential user) async {
          if (user.user != null) {
            await user.user!.getIdToken().then((String idToken) async {
              _authRepo
                  .login(
                idToken: idToken,
                mobileNumber: state.countryCode + state.mobileNumber.value,
              )
                  .then((value) {
                state = state.copyWith(status: FormzStatus.submissionSuccess);
                _authStateNotifier.checkAuthState();
              });
            });
          }
        });
      } on FirebaseAuthException catch (e) {
        state = state.copyWith(
          status: FormzStatus.submissionFailure,
          errorMessage: AuthExceptionHandler.handleException(e),
          // errorMessage: e.message,
        );
      } on NetworkExceptions catch (e) {
        state = state.copyWith(
          status: FormzStatus.submissionFailure,
          errorMessage: e.getIntlException(),
        );
      }
    });
  }
}
