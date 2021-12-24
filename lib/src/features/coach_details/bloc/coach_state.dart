import 'package:digicoach/src/core/form_inputs/email.dart';
import 'package:digicoach/src/core/form_inputs/name.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'coach_state.freezed.dart';

@freezed
class CoachState with _$CoachState {
  const factory CoachState({
    required FormzStatus status,
    Name? name,
    Email? email,
    String? postal,
    String? errorMessage,
  }) = _CoachState;

  factory CoachState.initial() => const CoachState(
        status: FormzStatus.pure,
      );
}
