// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'coach_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CoachModel _$CoachModelFromJson(Map<String, dynamic> json) {
  return _CoachModel.fromJson(json);
}

/// @nodoc
class _$CoachModelTearOff {
  const _$CoachModelTearOff();

  _CoachModel call(
      {required int id,
      String? name,
      required bool isCertified,
      String? image,
      required List<String> skills,
      String? address,
      required StatisticsModel statistics,
      int? lowestPrice,
      required List<String> courses}) {
    return _CoachModel(
      id: id,
      name: name,
      isCertified: isCertified,
      image: image,
      skills: skills,
      address: address,
      statistics: statistics,
      lowestPrice: lowestPrice,
      courses: courses,
    );
  }

  CoachModel fromJson(Map<String, Object?> json) {
    return CoachModel.fromJson(json);
  }
}

/// @nodoc
const $CoachModel = _$CoachModelTearOff();

/// @nodoc
mixin _$CoachModel {
  int get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  bool get isCertified => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  List<String> get skills => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  StatisticsModel get statistics => throw _privateConstructorUsedError;
  int? get lowestPrice => throw _privateConstructorUsedError;
  List<String> get courses => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CoachModelCopyWith<CoachModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CoachModelCopyWith<$Res> {
  factory $CoachModelCopyWith(
          CoachModel value, $Res Function(CoachModel) then) =
      _$CoachModelCopyWithImpl<$Res>;
  $Res call(
      {int id,
      String? name,
      bool isCertified,
      String? image,
      List<String> skills,
      String? address,
      StatisticsModel statistics,
      int? lowestPrice,
      List<String> courses});

  $StatisticsModelCopyWith<$Res> get statistics;
}

/// @nodoc
class _$CoachModelCopyWithImpl<$Res> implements $CoachModelCopyWith<$Res> {
  _$CoachModelCopyWithImpl(this._value, this._then);

  final CoachModel _value;
  // ignore: unused_field
  final $Res Function(CoachModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? isCertified = freezed,
    Object? image = freezed,
    Object? skills = freezed,
    Object? address = freezed,
    Object? statistics = freezed,
    Object? lowestPrice = freezed,
    Object? courses = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      isCertified: isCertified == freezed
          ? _value.isCertified
          : isCertified // ignore: cast_nullable_to_non_nullable
              as bool,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      skills: skills == freezed
          ? _value.skills
          : skills // ignore: cast_nullable_to_non_nullable
              as List<String>,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      statistics: statistics == freezed
          ? _value.statistics
          : statistics // ignore: cast_nullable_to_non_nullable
              as StatisticsModel,
      lowestPrice: lowestPrice == freezed
          ? _value.lowestPrice
          : lowestPrice // ignore: cast_nullable_to_non_nullable
              as int?,
      courses: courses == freezed
          ? _value.courses
          : courses // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }

  @override
  $StatisticsModelCopyWith<$Res> get statistics {
    return $StatisticsModelCopyWith<$Res>(_value.statistics, (value) {
      return _then(_value.copyWith(statistics: value));
    });
  }
}

/// @nodoc
abstract class _$CoachModelCopyWith<$Res> implements $CoachModelCopyWith<$Res> {
  factory _$CoachModelCopyWith(
          _CoachModel value, $Res Function(_CoachModel) then) =
      __$CoachModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      String? name,
      bool isCertified,
      String? image,
      List<String> skills,
      String? address,
      StatisticsModel statistics,
      int? lowestPrice,
      List<String> courses});

  @override
  $StatisticsModelCopyWith<$Res> get statistics;
}

/// @nodoc
class __$CoachModelCopyWithImpl<$Res> extends _$CoachModelCopyWithImpl<$Res>
    implements _$CoachModelCopyWith<$Res> {
  __$CoachModelCopyWithImpl(
      _CoachModel _value, $Res Function(_CoachModel) _then)
      : super(_value, (v) => _then(v as _CoachModel));

  @override
  _CoachModel get _value => super._value as _CoachModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? isCertified = freezed,
    Object? image = freezed,
    Object? skills = freezed,
    Object? address = freezed,
    Object? statistics = freezed,
    Object? lowestPrice = freezed,
    Object? courses = freezed,
  }) {
    return _then(_CoachModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      isCertified: isCertified == freezed
          ? _value.isCertified
          : isCertified // ignore: cast_nullable_to_non_nullable
              as bool,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      skills: skills == freezed
          ? _value.skills
          : skills // ignore: cast_nullable_to_non_nullable
              as List<String>,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      statistics: statistics == freezed
          ? _value.statistics
          : statistics // ignore: cast_nullable_to_non_nullable
              as StatisticsModel,
      lowestPrice: lowestPrice == freezed
          ? _value.lowestPrice
          : lowestPrice // ignore: cast_nullable_to_non_nullable
              as int?,
      courses: courses == freezed
          ? _value.courses
          : courses // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CoachModel implements _CoachModel {
  const _$_CoachModel(
      {required this.id,
      this.name,
      required this.isCertified,
      this.image,
      required this.skills,
      this.address,
      required this.statistics,
      this.lowestPrice,
      required this.courses});

  factory _$_CoachModel.fromJson(Map<String, dynamic> json) =>
      _$$_CoachModelFromJson(json);

  @override
  final int id;
  @override
  final String? name;
  @override
  final bool isCertified;
  @override
  final String? image;
  @override
  final List<String> skills;
  @override
  final String? address;
  @override
  final StatisticsModel statistics;
  @override
  final int? lowestPrice;
  @override
  final List<String> courses;

  @override
  String toString() {
    return 'CoachModel(id: $id, name: $name, isCertified: $isCertified, image: $image, skills: $skills, address: $address, statistics: $statistics, lowestPrice: $lowestPrice, courses: $courses)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CoachModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.isCertified, isCertified) ||
                other.isCertified == isCertified) &&
            (identical(other.image, image) || other.image == image) &&
            const DeepCollectionEquality().equals(other.skills, skills) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.statistics, statistics) ||
                other.statistics == statistics) &&
            (identical(other.lowestPrice, lowestPrice) ||
                other.lowestPrice == lowestPrice) &&
            const DeepCollectionEquality().equals(other.courses, courses));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      isCertified,
      image,
      const DeepCollectionEquality().hash(skills),
      address,
      statistics,
      lowestPrice,
      const DeepCollectionEquality().hash(courses));

  @JsonKey(ignore: true)
  @override
  _$CoachModelCopyWith<_CoachModel> get copyWith =>
      __$CoachModelCopyWithImpl<_CoachModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CoachModelToJson(this);
  }
}

abstract class _CoachModel implements CoachModel {
  const factory _CoachModel(
      {required int id,
      String? name,
      required bool isCertified,
      String? image,
      required List<String> skills,
      String? address,
      required StatisticsModel statistics,
      int? lowestPrice,
      required List<String> courses}) = _$_CoachModel;

  factory _CoachModel.fromJson(Map<String, dynamic> json) =
      _$_CoachModel.fromJson;

  @override
  int get id;
  @override
  String? get name;
  @override
  bool get isCertified;
  @override
  String? get image;
  @override
  List<String> get skills;
  @override
  String? get address;
  @override
  StatisticsModel get statistics;
  @override
  int? get lowestPrice;
  @override
  List<String> get courses;
  @override
  @JsonKey(ignore: true)
  _$CoachModelCopyWith<_CoachModel> get copyWith =>
      throw _privateConstructorUsedError;
}
