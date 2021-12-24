import 'package:digicoach/src/features/home/bloc/models/statistics_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'coach_model.freezed.dart';
part 'coach_model.g.dart';

@freezed
class CoachModel with _$CoachModel {
  const factory CoachModel({
    required int id,
    String? name,
    required bool isCertified,
    String? image,
    required List<String> skills,
    String? address,
    required StatisticsModel statistics,
    int? lowestPrice,
    required List<String> courses,
  }) = _CoachModel;

  factory CoachModel.fromJson(Map<String, dynamic> json) =>
      _$CoachModelFromJson(json);
}
