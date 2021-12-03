// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'auth_session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AuthSession _$AuthSessionFromJson(Map<String, dynamic> json) {
  return _AuthSession.fromJson(json);
}

/// @nodoc
class _$AuthSessionTearOff {
  const _$AuthSessionTearOff();

  _AuthSession call({required String token}) {
    return _AuthSession(
      token: token,
    );
  }

  AuthSession fromJson(Map<String, Object?> json) {
    return AuthSession.fromJson(json);
  }
}

/// @nodoc
const $AuthSession = _$AuthSessionTearOff();

/// @nodoc
mixin _$AuthSession {
  String get token => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuthSessionCopyWith<AuthSession> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthSessionCopyWith<$Res> {
  factory $AuthSessionCopyWith(
          AuthSession value, $Res Function(AuthSession) then) =
      _$AuthSessionCopyWithImpl<$Res>;
  $Res call({String token});
}

/// @nodoc
class _$AuthSessionCopyWithImpl<$Res> implements $AuthSessionCopyWith<$Res> {
  _$AuthSessionCopyWithImpl(this._value, this._then);

  final AuthSession _value;
  // ignore: unused_field
  final $Res Function(AuthSession) _then;

  @override
  $Res call({
    Object? token = freezed,
  }) {
    return _then(_value.copyWith(
      token: token == freezed
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$AuthSessionCopyWith<$Res>
    implements $AuthSessionCopyWith<$Res> {
  factory _$AuthSessionCopyWith(
          _AuthSession value, $Res Function(_AuthSession) then) =
      __$AuthSessionCopyWithImpl<$Res>;
  @override
  $Res call({String token});
}

/// @nodoc
class __$AuthSessionCopyWithImpl<$Res> extends _$AuthSessionCopyWithImpl<$Res>
    implements _$AuthSessionCopyWith<$Res> {
  __$AuthSessionCopyWithImpl(
      _AuthSession _value, $Res Function(_AuthSession) _then)
      : super(_value, (v) => _then(v as _AuthSession));

  @override
  _AuthSession get _value => super._value as _AuthSession;

  @override
  $Res call({
    Object? token = freezed,
  }) {
    return _then(_AuthSession(
      token: token == freezed
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AuthSession implements _AuthSession {
  const _$_AuthSession({required this.token});

  factory _$_AuthSession.fromJson(Map<String, dynamic> json) =>
      _$$_AuthSessionFromJson(json);

  @override
  final String token;

  @override
  String toString() {
    return 'AuthSession(token: $token)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AuthSession &&
            (identical(other.token, token) || other.token == token));
  }

  @override
  int get hashCode => Object.hash(runtimeType, token);

  @JsonKey(ignore: true)
  @override
  _$AuthSessionCopyWith<_AuthSession> get copyWith =>
      __$AuthSessionCopyWithImpl<_AuthSession>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AuthSessionToJson(this);
  }
}

abstract class _AuthSession implements AuthSession {
  const factory _AuthSession({required String token}) = _$_AuthSession;

  factory _AuthSession.fromJson(Map<String, dynamic> json) =
      _$_AuthSession.fromJson;

  @override
  String get token;
  @override
  @JsonKey(ignore: true)
  _$AuthSessionCopyWith<_AuthSession> get copyWith =>
      throw _privateConstructorUsedError;
}
