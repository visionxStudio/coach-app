import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'bio_model.freezed.dart';
part 'bio_model.g.dart';

@freezed
class BioModel with _$BioModel {
  const factory BioModel({
    required String bio,
  }) = _BioModel;

  factory BioModel.fromJson(Map<String, dynamic> json) =>
      _$BioModelFromJson(json);
}
