// final authRepoProvider = Provider((ref) => AuthRepository());

import 'package:digicoach/src/common/constants/api_link.dart';
import 'package:digicoach/src/common/service/repo.dart';
import 'package:digicoach/src/features/goal/data/model/goal_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final goalRepoProvider = Provider((ref) => GoalRepositories());

abstract class IGoalRepositories {
  Future<List<GoalModel>> getGoalSetting();
  Future<void> insertGoalSetting(GoalModel goalModel);
  Future<void> updateGoalSetting(GoalModel goalModel);
}

class GoalRepositories extends Repo implements IGoalRepositories {
  @override
  Future<List<GoalModel>> getGoalSetting() async {
    final res = await client.get(ApiLink.getGoalSetting);
    final payLoad = res['payload'] as List;

    final goals = payLoad.map((e) => GoalModel.fromJson(e)).toList();

    return goals;
  }

  @override
  Future<void> insertGoalSetting(GoalModel goalModel) async {}

  @override
  Future<void> updateGoalSetting(GoalModel goalModel) async {
    await client.put(
      ApiLink.getGoalSetting,
      data: goalModel.toJson(),
    );
  }
}
