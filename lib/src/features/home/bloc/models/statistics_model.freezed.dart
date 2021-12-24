// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'statistics_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StatisticsModel _$StatisticsModelFromJson(Map<String, dynamic> json) {
  return _StatisticsModel.fromJson(json);
}

/// @nodoc
class _$StatisticsModelTearOff {
  const _$StatisticsModelTearOff();

  _StatisticsModel call(
      {required int likes, required int comments, required int rating}) {
    return _StatisticsModel(
      likes: likes,
      comments: comments,
      rating: rating,
    );
  }

  StatisticsModel fromJson(Map<String, Object?> json) {
    return StatisticsModel.fromJson(json);
  }
}

/// @nodoc
const $StatisticsModel = _$StatisticsModelTearOff();

/// @nodoc
mixin _$StatisticsModel {
  int get likes => throw _privateConstructorUsedError;
  int get comments => throw _privateConstructorUsedError;
  int get rating => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StatisticsModelCopyWith<StatisticsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatisticsModelCopyWith<$Res> {
  factory $StatisticsModelCopyWith(
          StatisticsModel value, $Res Function(StatisticsModel) then) =
      _$StatisticsModelCopyWithImpl<$Res>;
  $Res call({int likes, int comments, int rating});
}

/// @nodoc
class _$StatisticsModelCopyWithImpl<$Res>
    implements $StatisticsModelCopyWith<$Res> {
  _$StatisticsModelCopyWithImpl(this._value, this._then);

  final StatisticsModel _value;
  // ignore: unused_field
  final $Res Function(StatisticsModel) _then;

  @override
  $Res call({
    Object? likes = freezed,
    Object? comments = freezed,
    Object? rating = freezed,
  }) {
    return _then(_value.copyWith(
      likes: likes == freezed
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as int,
      comments: comments == freezed
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as int,
      rating: rating == freezed
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$StatisticsModelCopyWith<$Res>
    implements $StatisticsModelCopyWith<$Res> {
  factory _$StatisticsModelCopyWith(
          _StatisticsModel value, $Res Function(_StatisticsModel) then) =
      __$StatisticsModelCopyWithImpl<$Res>;
  @override
  $Res call({int likes, int comments, int rating});
}

/// @nodoc
class __$StatisticsModelCopyWithImpl<$Res>
    extends _$StatisticsModelCopyWithImpl<$Res>
    implements _$StatisticsModelCopyWith<$Res> {
  __$StatisticsModelCopyWithImpl(
      _StatisticsModel _value, $Res Function(_StatisticsModel) _then)
      : super(_value, (v) => _then(v as _StatisticsModel));

  @override
  _StatisticsModel get _value => super._value as _StatisticsModel;

  @override
  $Res call({
    Object? likes = freezed,
    Object? comments = freezed,
    Object? rating = freezed,
  }) {
    return _then(_StatisticsModel(
      likes: likes == freezed
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as int,
      comments: comments == freezed
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as int,
      rating: rating == freezed
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_StatisticsModel implements _StatisticsModel {
  const _$_StatisticsModel(
      {required this.likes, required this.comments, required this.rating});

  factory _$_StatisticsModel.fromJson(Map<String, dynamic> json) =>
      _$$_StatisticsModelFromJson(json);

  @override
  final int likes;
  @override
  final int comments;
  @override
  final int rating;

  @override
  String toString() {
    return 'StatisticsModel(likes: $likes, comments: $comments, rating: $rating)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _StatisticsModel &&
            (identical(other.likes, likes) || other.likes == likes) &&
            (identical(other.comments, comments) ||
                other.comments == comments) &&
            (identical(other.rating, rating) || other.rating == rating));
  }

  @override
  int get hashCode => Object.hash(runtimeType, likes, comments, rating);

  @JsonKey(ignore: true)
  @override
  _$StatisticsModelCopyWith<_StatisticsModel> get copyWith =>
      __$StatisticsModelCopyWithImpl<_StatisticsModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StatisticsModelToJson(this);
  }
}

abstract class _StatisticsModel implements StatisticsModel {
  const factory _StatisticsModel(
      {required int likes,
      required int comments,
      required int rating}) = _$_StatisticsModel;

  factory _StatisticsModel.fromJson(Map<String, dynamic> json) =
      _$_StatisticsModel.fromJson;

  @override
  int get likes;
  @override
  int get comments;
  @override
  int get rating;
  @override
  @JsonKey(ignore: true)
  _$StatisticsModelCopyWith<_StatisticsModel> get copyWith =>
      throw _privateConstructorUsedError;
}
