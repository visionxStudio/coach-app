// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'bio_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BioModel _$BioModelFromJson(Map<String, dynamic> json) {
  return _BioModel.fromJson(json);
}

/// @nodoc
class _$BioModelTearOff {
  const _$BioModelTearOff();

  _BioModel call({required String bio}) {
    return _BioModel(
      bio: bio,
    );
  }

  BioModel fromJson(Map<String, Object?> json) {
    return BioModel.fromJson(json);
  }
}

/// @nodoc
const $BioModel = _$BioModelTearOff();

/// @nodoc
mixin _$BioModel {
  String get bio => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BioModelCopyWith<BioModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BioModelCopyWith<$Res> {
  factory $BioModelCopyWith(BioModel value, $Res Function(BioModel) then) =
      _$BioModelCopyWithImpl<$Res>;
  $Res call({String bio});
}

/// @nodoc
class _$BioModelCopyWithImpl<$Res> implements $BioModelCopyWith<$Res> {
  _$BioModelCopyWithImpl(this._value, this._then);

  final BioModel _value;
  // ignore: unused_field
  final $Res Function(BioModel) _then;

  @override
  $Res call({
    Object? bio = freezed,
  }) {
    return _then(_value.copyWith(
      bio: bio == freezed
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$BioModelCopyWith<$Res> implements $BioModelCopyWith<$Res> {
  factory _$BioModelCopyWith(_BioModel value, $Res Function(_BioModel) then) =
      __$BioModelCopyWithImpl<$Res>;
  @override
  $Res call({String bio});
}

/// @nodoc
class __$BioModelCopyWithImpl<$Res> extends _$BioModelCopyWithImpl<$Res>
    implements _$BioModelCopyWith<$Res> {
  __$BioModelCopyWithImpl(_BioModel _value, $Res Function(_BioModel) _then)
      : super(_value, (v) => _then(v as _BioModel));

  @override
  _BioModel get _value => super._value as _BioModel;

  @override
  $Res call({
    Object? bio = freezed,
  }) {
    return _then(_BioModel(
      bio: bio == freezed
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BioModel with DiagnosticableTreeMixin implements _BioModel {
  const _$_BioModel({required this.bio});

  factory _$_BioModel.fromJson(Map<String, dynamic> json) =>
      _$$_BioModelFromJson(json);

  @override
  final String bio;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BioModel(bio: $bio)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BioModel'))
      ..add(DiagnosticsProperty('bio', bio));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BioModel &&
            (identical(other.bio, bio) || other.bio == bio));
  }

  @override
  int get hashCode => Object.hash(runtimeType, bio);

  @JsonKey(ignore: true)
  @override
  _$BioModelCopyWith<_BioModel> get copyWith =>
      __$BioModelCopyWithImpl<_BioModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BioModelToJson(this);
  }
}

abstract class _BioModel implements BioModel {
  const factory _BioModel({required String bio}) = _$_BioModel;

  factory _BioModel.fromJson(Map<String, dynamic> json) = _$_BioModel.fromJson;

  @override
  String get bio;
  @override
  @JsonKey(ignore: true)
  _$BioModelCopyWith<_BioModel> get copyWith =>
      throw _privateConstructorUsedError;
}
