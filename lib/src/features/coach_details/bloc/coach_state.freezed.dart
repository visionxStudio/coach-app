// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'coach_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$CoachStateTearOff {
  const _$CoachStateTearOff();

  _CoachState call(
      {required FormzStatus status,
      Name? name,
      Email? email,
      String? postal,
      String? errorMessage}) {
    return _CoachState(
      status: status,
      name: name,
      email: email,
      postal: postal,
      errorMessage: errorMessage,
    );
  }
}

/// @nodoc
const $CoachState = _$CoachStateTearOff();

/// @nodoc
mixin _$CoachState {
  FormzStatus get status => throw _privateConstructorUsedError;
  Name? get name => throw _privateConstructorUsedError;
  Email? get email => throw _privateConstructorUsedError;
  String? get postal => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CoachStateCopyWith<CoachState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CoachStateCopyWith<$Res> {
  factory $CoachStateCopyWith(
          CoachState value, $Res Function(CoachState) then) =
      _$CoachStateCopyWithImpl<$Res>;
  $Res call(
      {FormzStatus status,
      Name? name,
      Email? email,
      String? postal,
      String? errorMessage});
}

/// @nodoc
class _$CoachStateCopyWithImpl<$Res> implements $CoachStateCopyWith<$Res> {
  _$CoachStateCopyWithImpl(this._value, this._then);

  final CoachState _value;
  // ignore: unused_field
  final $Res Function(CoachState) _then;

  @override
  $Res call({
    Object? status = freezed,
    Object? name = freezed,
    Object? email = freezed,
    Object? postal = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as Name?,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as Email?,
      postal: postal == freezed
          ? _value.postal
          : postal // ignore: cast_nullable_to_non_nullable
              as String?,
      errorMessage: errorMessage == freezed
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$CoachStateCopyWith<$Res> implements $CoachStateCopyWith<$Res> {
  factory _$CoachStateCopyWith(
          _CoachState value, $Res Function(_CoachState) then) =
      __$CoachStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {FormzStatus status,
      Name? name,
      Email? email,
      String? postal,
      String? errorMessage});
}

/// @nodoc
class __$CoachStateCopyWithImpl<$Res> extends _$CoachStateCopyWithImpl<$Res>
    implements _$CoachStateCopyWith<$Res> {
  __$CoachStateCopyWithImpl(
      _CoachState _value, $Res Function(_CoachState) _then)
      : super(_value, (v) => _then(v as _CoachState));

  @override
  _CoachState get _value => super._value as _CoachState;

  @override
  $Res call({
    Object? status = freezed,
    Object? name = freezed,
    Object? email = freezed,
    Object? postal = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_CoachState(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as Name?,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as Email?,
      postal: postal == freezed
          ? _value.postal
          : postal // ignore: cast_nullable_to_non_nullable
              as String?,
      errorMessage: errorMessage == freezed
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_CoachState implements _CoachState {
  const _$_CoachState(
      {required this.status,
      this.name,
      this.email,
      this.postal,
      this.errorMessage});

  @override
  final FormzStatus status;
  @override
  final Name? name;
  @override
  final Email? email;
  @override
  final String? postal;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'CoachState(status: $status, name: $name, email: $email, postal: $postal, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CoachState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.postal, postal) || other.postal == postal) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, status, name, email, postal, errorMessage);

  @JsonKey(ignore: true)
  @override
  _$CoachStateCopyWith<_CoachState> get copyWith =>
      __$CoachStateCopyWithImpl<_CoachState>(this, _$identity);
}

abstract class _CoachState implements CoachState {
  const factory _CoachState(
      {required FormzStatus status,
      Name? name,
      Email? email,
      String? postal,
      String? errorMessage}) = _$_CoachState;

  @override
  FormzStatus get status;
  @override
  Name? get name;
  @override
  Email? get email;
  @override
  String? get postal;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$CoachStateCopyWith<_CoachState> get copyWith =>
      throw _privateConstructorUsedError;
}
