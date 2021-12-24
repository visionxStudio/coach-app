import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final coachDetailControllerProvider =
    ChangeNotifierProvider.autoDispose<CoachDetailController>(
  (_) => CoachDetailController(),
);

class CoachDetailController extends ChangeNotifier {
  int index = 0;
  int pageViewIndex = 0;

  bool isTextExpanded = false;

  // course selected index in buttonsheet
  int selectedCourseIndex = 4;

  // for changing selected course index
  void changeSelectedCourseIndex({required int value}) {
    selectedCourseIndex = value;
    notifyListeners();
  }

  // for custom tabbar in coach detail
  void changeCoachDetailIndex({required int value}) {
    index = value;
    notifyListeners();
  }

  // for expandable lines in coach Details page
  void toggleMaxLines() {
    isTextExpanded = !isTextExpanded;
    notifyListeners();
  }

  // To change index of pageview and build circle indicator
  void changePageViewIndex({required int value}) {
    pageViewIndex = value;
    notifyListeners();
  }
}
