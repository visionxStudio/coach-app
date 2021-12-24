import 'package:digicoach/src/common/service/exceptions/network_exceptions.dart';
import 'package:digicoach/src/core/form_inputs/email.dart';
import 'package:digicoach/src/core/form_inputs/name.dart';
import 'package:digicoach/src/features/coach_details/bloc/coach_repo.dart';
import 'package:digicoach/src/features/coach_details/bloc/coach_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';

final coachStateProvider =
    StateNotifierProvider<CoachStateNotifier, CoachState>(
        (ref) => CoachStateNotifier(ref.watch(coachRepoProvider)));

class CoachStateNotifier extends StateNotifier<CoachState> {
  CoachStateNotifier(this._coachRepo) : super(CoachState.initial());

  // ignore: unused_field
  final CoachRepository _coachRepo;

  void nameChanged(String value) {
    final name = Name.dirty(value);

    state = state.copyWith(
      name: name,
      status: Formz.validate([name]),
    );
  }

  void emailChanged(String value) {
    final email = Email.dirty(value);
    state = state.copyWith(
      email: email,
      status: Formz.validate([email]),
    );
  }

  void postalAddressChanged(String value) {
    state = state.copyWith(
      postal: value,
    );
  }

  // void dateChanged(String date) {
  //   state = state.copyWith(
  //     date: date,
  //   );
  // }

  // void languageChanged(List<String> languageList) {
  //   state = state.copyWith(
  //     langugae: languageList,
  //   );
  // }

  // void genderChanged(String value) {
  //   state = state.copyWith(
  //     gender: value,
  //   );
  // }

  // Handling coach Creation process
  Future<void> createCoach() async {
    try {
      _coachRepo.createCoach();
    } on NetworkExceptions catch (e) {
      state = state.copyWith(
        status: FormzStatus.submissionFailure,
        errorMessage: e.getIntlException(),
      );
    }
  }

  // Handling coach details update process
  Future<void> updateCoachInformation({
    String? name,
    String? email,
    String? postal,
    DateTime? date,
    List<String>? language,
    int? genderValue,
  }) async {
    if (!state.status.isValidated) return;
    String? gender;
    if (genderValue == 0) {
      gender = "male";
    } else if (genderValue == 1) {
      gender = "female";
    } else if (genderValue == 2) {
      gender = "other";
    } else {
      gender = null;
    }
    state = state.copyWith(status: FormzStatus.submissionInProgress);
    try {
      await _coachRepo
          .updateCoachInformation(
            fullName: name!,
            email: email!,
            postal: postal!,
            date: "${date!.year}-${date.month}-${date.day}",
            language: language!,
            gender: gender!,
          )
          .then(
            (_) => state = state.copyWith(
              status: FormzStatus.submissionSuccess,
            ),
          );
    } on NetworkExceptions catch (e) {
      state = state.copyWith(
        status: FormzStatus.submissionFailure,
        errorMessage: e.getIntlException(),
      );
    }
  }
}
