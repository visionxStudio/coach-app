import 'package:digicoach/src/features/main_dashboard_container/bloc/main_dashboard_controller.dart';
import 'package:digicoach/src/features/main_dashboard_container/data/coach_student_detail_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchControllerProvider =
    ChangeNotifierProvider<SearchController>((_) => SearchController());

class SearchController extends ChangeNotifier {
  bool isSearching = false;
  List<CoachStudentModel> coachStudent = [];

  void toggleIsSearching({required bool value}) {
    isSearching = value;
    notifyListeners();
  }

  void search({required String searchQuery}) {
    final MainDashboardProvider mainProvider = MainDashboardProvider();
    if (searchQuery.isNotEmpty) {
      isSearching = true;
      coachStudent =
          mainProvider.coachDetailList.where((CoachStudentModel element) {
        return element.name.toLowerCase().startsWith(searchQuery.toLowerCase());
      }).toList();
    } else if (searchQuery.isEmpty) {
      coachStudent = [];
      isSearching = false;
    }

    notifyListeners();
  }
}
