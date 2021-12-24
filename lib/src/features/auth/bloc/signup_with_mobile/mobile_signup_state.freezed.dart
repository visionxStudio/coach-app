// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'mobile_signup_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$MobileSignUpStateTearOff {
  const _$MobileSignUpStateTearOff();

  _MobileSignUpState call(
      {required MobileNumber mobileNumber,
      required String countryCode,
      required Otp smsCode,
      required FormzStatus status,
      String? errorMessage}) {
    return _MobileSignUpState(
      mobileNumber: mobileNumber,
      countryCode: countryCode,
      smsCode: smsCode,
      status: status,
      errorMessage: errorMessage,
    );
  }
}

/// @nodoc
const $MobileSignUpState = _$MobileSignUpStateTearOff();

/// @nodoc
mixin _$MobileSignUpState {
  /// Formz MobileNumberChecking
  MobileNumber get mobileNumber =>
      throw _privateConstructorUsedError; // countryCode
  String get countryCode => throw _privateConstructorUsedError; // smsCode
  Otp get smsCode =>
      throw _privateConstructorUsedError; // checking the status for form
  FormzStatus get status => throw _privateConstructorUsedError;

  /// Error message if form submission is failed
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MobileSignUpStateCopyWith<MobileSignUpState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MobileSignUpStateCopyWith<$Res> {
  factory $MobileSignUpStateCopyWith(
          MobileSignUpState value, $Res Function(MobileSignUpState) then) =
      _$MobileSignUpStateCopyWithImpl<$Res>;
  $Res call(
      {MobileNumber mobileNumber,
      String countryCode,
      Otp smsCode,
      FormzStatus status,
      String? errorMessage});
}

/// @nodoc
class _$MobileSignUpStateCopyWithImpl<$Res>
    implements $MobileSignUpStateCopyWith<$Res> {
  _$MobileSignUpStateCopyWithImpl(this._value, this._then);

  final MobileSignUpState _value;
  // ignore: unused_field
  final $Res Function(MobileSignUpState) _then;

  @override
  $Res call({
    Object? mobileNumber = freezed,
    Object? countryCode = freezed,
    Object? smsCode = freezed,
    Object? status = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      mobileNumber: mobileNumber == freezed
          ? _value.mobileNumber
          : mobileNumber // ignore: cast_nullable_to_non_nullable
              as MobileNumber,
      countryCode: countryCode == freezed
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String,
      smsCode: smsCode == freezed
          ? _value.smsCode
          : smsCode // ignore: cast_nullable_to_non_nullable
              as Otp,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      errorMessage: errorMessage == freezed
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$MobileSignUpStateCopyWith<$Res>
    implements $MobileSignUpStateCopyWith<$Res> {
  factory _$MobileSignUpStateCopyWith(
          _MobileSignUpState value, $Res Function(_MobileSignUpState) then) =
      __$MobileSignUpStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {MobileNumber mobileNumber,
      String countryCode,
      Otp smsCode,
      FormzStatus status,
      String? errorMessage});
}

/// @nodoc
class __$MobileSignUpStateCopyWithImpl<$Res>
    extends _$MobileSignUpStateCopyWithImpl<$Res>
    implements _$MobileSignUpStateCopyWith<$Res> {
  __$MobileSignUpStateCopyWithImpl(
      _MobileSignUpState _value, $Res Function(_MobileSignUpState) _then)
      : super(_value, (v) => _then(v as _MobileSignUpState));

  @override
  _MobileSignUpState get _value => super._value as _MobileSignUpState;

  @override
  $Res call({
    Object? mobileNumber = freezed,
    Object? countryCode = freezed,
    Object? smsCode = freezed,
    Object? status = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_MobileSignUpState(
      mobileNumber: mobileNumber == freezed
          ? _value.mobileNumber
          : mobileNumber // ignore: cast_nullable_to_non_nullable
              as MobileNumber,
      countryCode: countryCode == freezed
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String,
      smsCode: smsCode == freezed
          ? _value.smsCode
          : smsCode // ignore: cast_nullable_to_non_nullable
              as Otp,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      errorMessage: errorMessage == freezed
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_MobileSignUpState implements _MobileSignUpState {
  const _$_MobileSignUpState(
      {required this.mobileNumber,
      required this.countryCode,
      required this.smsCode,
      required this.status,
      this.errorMessage});

  @override

  /// Formz MobileNumberChecking
  final MobileNumber mobileNumber;
  @override // countryCode
  final String countryCode;
  @override // smsCode
  final Otp smsCode;
  @override // checking the status for form
  final FormzStatus status;
  @override

  /// Error message if form submission is failed
  final String? errorMessage;

  @override
  String toString() {
    return 'MobileSignUpState(mobileNumber: $mobileNumber, countryCode: $countryCode, smsCode: $smsCode, status: $status, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MobileSignUpState &&
            (identical(other.mobileNumber, mobileNumber) ||
                other.mobileNumber == mobileNumber) &&
            (identical(other.countryCode, countryCode) ||
                other.countryCode == countryCode) &&
            (identical(other.smsCode, smsCode) || other.smsCode == smsCode) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, mobileNumber, countryCode, smsCode, status, errorMessage);

  @JsonKey(ignore: true)
  @override
  _$MobileSignUpStateCopyWith<_MobileSignUpState> get copyWith =>
      __$MobileSignUpStateCopyWithImpl<_MobileSignUpState>(this, _$identity);
}

abstract class _MobileSignUpState implements MobileSignUpState {
  const factory _MobileSignUpState(
      {required MobileNumber mobileNumber,
      required String countryCode,
      required Otp smsCode,
      required FormzStatus status,
      String? errorMessage}) = _$_MobileSignUpState;

  @override

  /// Formz MobileNumberChecking
  MobileNumber get mobileNumber;
  @override // countryCode
  String get countryCode;
  @override // smsCode
  Otp get smsCode;
  @override // checking the status for form
  FormzStatus get status;
  @override

  /// Error message if form submission is failed
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$MobileSignUpStateCopyWith<_MobileSignUpState> get copyWith =>
      throw _privateConstructorUsedError;
}
