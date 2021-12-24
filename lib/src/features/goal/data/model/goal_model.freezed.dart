// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'goal_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GoalModel _$GoalModelFromJson(Map<String, dynamic> json) {
  return _GoalModel.fromJson(json);
}

/// @nodoc
class _$GoalModelTearOff {
  const _$GoalModelTearOff();

  _GoalModel call({required int id, String? key, required bool value}) {
    return _GoalModel(
      id: id,
      key: key,
      value: value,
    );
  }

  GoalModel fromJson(Map<String, Object?> json) {
    return GoalModel.fromJson(json);
  }
}

/// @nodoc
const $GoalModel = _$GoalModelTearOff();

/// @nodoc
mixin _$GoalModel {
  int get id => throw _privateConstructorUsedError;
  String? get key => throw _privateConstructorUsedError;
  bool get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GoalModelCopyWith<GoalModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GoalModelCopyWith<$Res> {
  factory $GoalModelCopyWith(GoalModel value, $Res Function(GoalModel) then) =
      _$GoalModelCopyWithImpl<$Res>;
  $Res call({int id, String? key, bool value});
}

/// @nodoc
class _$GoalModelCopyWithImpl<$Res> implements $GoalModelCopyWith<$Res> {
  _$GoalModelCopyWithImpl(this._value, this._then);

  final GoalModel _value;
  // ignore: unused_field
  final $Res Function(GoalModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? key = freezed,
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      key: key == freezed
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String?,
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$GoalModelCopyWith<$Res> implements $GoalModelCopyWith<$Res> {
  factory _$GoalModelCopyWith(
          _GoalModel value, $Res Function(_GoalModel) then) =
      __$GoalModelCopyWithImpl<$Res>;
  @override
  $Res call({int id, String? key, bool value});
}

/// @nodoc
class __$GoalModelCopyWithImpl<$Res> extends _$GoalModelCopyWithImpl<$Res>
    implements _$GoalModelCopyWith<$Res> {
  __$GoalModelCopyWithImpl(_GoalModel _value, $Res Function(_GoalModel) _then)
      : super(_value, (v) => _then(v as _GoalModel));

  @override
  _GoalModel get _value => super._value as _GoalModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? key = freezed,
    Object? value = freezed,
  }) {
    return _then(_GoalModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      key: key == freezed
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String?,
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GoalModel implements _GoalModel {
  const _$_GoalModel({required this.id, this.key, required this.value});

  factory _$_GoalModel.fromJson(Map<String, dynamic> json) =>
      _$$_GoalModelFromJson(json);

  @override
  final int id;
  @override
  final String? key;
  @override
  final bool value;

  @override
  String toString() {
    return 'GoalModel(id: $id, key: $key, value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GoalModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, key, value);

  @JsonKey(ignore: true)
  @override
  _$GoalModelCopyWith<_GoalModel> get copyWith =>
      __$GoalModelCopyWithImpl<_GoalModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GoalModelToJson(this);
  }
}

abstract class _GoalModel implements GoalModel {
  const factory _GoalModel(
      {required int id, String? key, required bool value}) = _$_GoalModel;

  factory _GoalModel.fromJson(Map<String, dynamic> json) =
      _$_GoalModel.fromJson;

  @override
  int get id;
  @override
  String? get key;
  @override
  bool get value;
  @override
  @JsonKey(ignore: true)
  _$GoalModelCopyWith<_GoalModel> get copyWith =>
      throw _privateConstructorUsedError;
}
