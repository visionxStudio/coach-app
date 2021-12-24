import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'course_state.freezed.dart';

@freezed
class CourseState with _$CourseState {
  const factory CourseState({
    required int interestId,
    required int packageId,
    required String duration,
    required String price,
    required List<int> topics,
    required FormzStatus status,
    String? message,
    String? errorMessage,
  }) = _CourseState;

  factory CourseState.initial() => const CourseState(
        interestId: -1,
        packageId: -1,
        duration: "",
        price: "",
        topics: [],
        status: FormzStatus.pure,
      );
}
