import 'package:digicoach/src/features/goal/data/goal_repositories.dart';
import 'package:digicoach/src/features/goal/data/model/goal_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final goalProvider = ChangeNotifierProvider.autoDispose(
    (ref) => GoalProvider(ref.watch(goalRepoProvider)));

class GoalProvider extends ChangeNotifier {
  GoalProvider(this._goalRepo) {
    _fetchGoal();
  }

  final GoalRepositories _goalRepo;

  bool isSubmissionInProgress = false;

  AsyncValue<List<GoalModel>> asyncGoals = const AsyncLoading();

  _fetchGoal() async {
    final goals = await _goalRepo.getGoalSetting();
    asyncGoals = AsyncData(goals);
    notifyListeners();
  }

  update(GoalModel goalModel) {
    isSubmissionInProgress = true;
    notifyListeners();
    isSubmissionInProgress = false;
    notifyListeners();
    _fetchGoal();
  }

  delete() {}
}
