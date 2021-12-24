import 'package:digicoach/src/common/service/exceptions/network_exceptions.dart';
import 'package:digicoach/src/features/course/bloc/course_repo.dart';
import 'package:digicoach/src/features/course/bloc/course_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';

final courseControllerProvider =
    ChangeNotifierProvider<CourseController>((_) => CourseController());

class CourseController extends ChangeNotifier {
  List<int> selectedCourses = [];

  void addCourse(int index) {
    if (selectedCourses.contains(index)) {
      selectedCourses.remove(index);
    } else {
      selectedCourses.addAll([index]);
    }
    notifyListeners();
  }
}

final courseStateProvider =
    StateNotifierProvider<CourseStateNotifier, CourseState>(
  (ref) => CourseStateNotifier(
    ref.watch(courseRepoProvider),
  ),
);

class CourseStateNotifier extends StateNotifier<CourseState> {
  CourseStateNotifier(this._courseRepo) : super(CourseState.initial());

  final CourseRepository _courseRepo;

  void interestIdChanged(int value) {
    state = state.copyWith(interestId: value);
  }

  void priceChanged(String value) {
    state = state.copyWith(
      price: value,
    );
  }

  void coursePreferenceChanged({
    required int packageId,
    required String duration,
  }) {
    state = state.copyWith(
      packageId: packageId,
      duration: duration,
    );
  }

  void topicsChanged({required List<int> topicsList}) {
    state = state.copyWith(
      topics: topicsList,
      status: FormzStatus.valid,
    );
  }

  Future<void> createCourse() async {
    if (!state.status.isValidated) return;
    state = state.copyWith(status: FormzStatus.submissionInProgress);

    try {
      await _courseRepo
          .createCourse(
        interestId: state.interestId + 1,
        packageId: state.packageId + 1,
        duration: state.duration,
        price: state.price,
        topics: state.topics,
      )
          .then((String message) {
        state = state.copyWith(
            message: message, status: FormzStatus.submissionSuccess);
      });
    } on NetworkExceptions catch (e) {
      state = state.copyWith(
        status: FormzStatus.submissionFailure,
        errorMessage: e.getIntlException(),
      );
    }
  }
}
