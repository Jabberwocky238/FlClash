// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../auth.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AuthProps _$AuthPropsFromJson(Map<String, dynamic> json) {
  return _AuthProps.fromJson(json);
}

/// @nodoc
mixin _$AuthProps {
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String? get token => throw _privateConstructorUsedError;

  /// Serializes this AuthProps to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AuthProps
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AuthPropsCopyWith<AuthProps> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthPropsCopyWith<$Res> {
  factory $AuthPropsCopyWith(AuthProps value, $Res Function(AuthProps) then) =
      _$AuthPropsCopyWithImpl<$Res, AuthProps>;
  @useResult
  $Res call({String email, String password, String? token});
}

/// @nodoc
class _$AuthPropsCopyWithImpl<$Res, $Val extends AuthProps>
    implements $AuthPropsCopyWith<$Res> {
  _$AuthPropsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthProps
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? token = freezed,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AuthPropsImplCopyWith<$Res>
    implements $AuthPropsCopyWith<$Res> {
  factory _$$AuthPropsImplCopyWith(
          _$AuthPropsImpl value, $Res Function(_$AuthPropsImpl) then) =
      __$$AuthPropsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email, String password, String? token});
}

/// @nodoc
class __$$AuthPropsImplCopyWithImpl<$Res>
    extends _$AuthPropsCopyWithImpl<$Res, _$AuthPropsImpl>
    implements _$$AuthPropsImplCopyWith<$Res> {
  __$$AuthPropsImplCopyWithImpl(
      _$AuthPropsImpl _value, $Res Function(_$AuthPropsImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthProps
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? token = freezed,
  }) {
    return _then(_$AuthPropsImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AuthPropsImpl implements _AuthProps {
  const _$AuthPropsImpl({this.email = '', this.password = '', this.token});

  factory _$AuthPropsImpl.fromJson(Map<String, dynamic> json) =>
      _$$AuthPropsImplFromJson(json);

  @override
  @JsonKey()
  final String email;
  @override
  @JsonKey()
  final String password;
  @override
  final String? token;

  @override
  String toString() {
    return 'AuthProps(email: $email, password: $password, token: $token)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthPropsImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.token, token) || other.token == token));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, email, password, token);

  /// Create a copy of AuthProps
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthPropsImplCopyWith<_$AuthPropsImpl> get copyWith =>
      __$$AuthPropsImplCopyWithImpl<_$AuthPropsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AuthPropsImplToJson(
      this,
    );
  }
}

abstract class _AuthProps implements AuthProps {
  const factory _AuthProps(
      {final String email,
      final String password,
      final String? token}) = _$AuthPropsImpl;

  factory _AuthProps.fromJson(Map<String, dynamic> json) =
      _$AuthPropsImpl.fromJson;

  @override
  String get email;
  @override
  String get password;
  @override
  String? get token;

  /// Create a copy of AuthProps
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthPropsImplCopyWith<_$AuthPropsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$UsageInfo {
  int get used => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;
  DateTime get expireAt => throw _privateConstructorUsedError;

  /// Create a copy of UsageInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UsageInfoCopyWith<UsageInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UsageInfoCopyWith<$Res> {
  factory $UsageInfoCopyWith(UsageInfo value, $Res Function(UsageInfo) then) =
      _$UsageInfoCopyWithImpl<$Res, UsageInfo>;
  @useResult
  $Res call({int used, int total, DateTime expireAt});
}

/// @nodoc
class _$UsageInfoCopyWithImpl<$Res, $Val extends UsageInfo>
    implements $UsageInfoCopyWith<$Res> {
  _$UsageInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UsageInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? used = null,
    Object? total = null,
    Object? expireAt = null,
  }) {
    return _then(_value.copyWith(
      used: null == used
          ? _value.used
          : used // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      expireAt: null == expireAt
          ? _value.expireAt
          : expireAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UsageInfoImplCopyWith<$Res>
    implements $UsageInfoCopyWith<$Res> {
  factory _$$UsageInfoImplCopyWith(
          _$UsageInfoImpl value, $Res Function(_$UsageInfoImpl) then) =
      __$$UsageInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int used, int total, DateTime expireAt});
}

/// @nodoc
class __$$UsageInfoImplCopyWithImpl<$Res>
    extends _$UsageInfoCopyWithImpl<$Res, _$UsageInfoImpl>
    implements _$$UsageInfoImplCopyWith<$Res> {
  __$$UsageInfoImplCopyWithImpl(
      _$UsageInfoImpl _value, $Res Function(_$UsageInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of UsageInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? used = null,
    Object? total = null,
    Object? expireAt = null,
  }) {
    return _then(_$UsageInfoImpl(
      used: null == used
          ? _value.used
          : used // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      expireAt: null == expireAt
          ? _value.expireAt
          : expireAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$UsageInfoImpl implements _UsageInfo {
  const _$UsageInfoImpl(
      {required this.used, required this.total, required this.expireAt});

  @override
  final int used;
  @override
  final int total;
  @override
  final DateTime expireAt;

  @override
  String toString() {
    return 'UsageInfo(used: $used, total: $total, expireAt: $expireAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UsageInfoImpl &&
            (identical(other.used, used) || other.used == used) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.expireAt, expireAt) ||
                other.expireAt == expireAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, used, total, expireAt);

  /// Create a copy of UsageInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UsageInfoImplCopyWith<_$UsageInfoImpl> get copyWith =>
      __$$UsageInfoImplCopyWithImpl<_$UsageInfoImpl>(this, _$identity);
}

abstract class _UsageInfo implements UsageInfo {
  const factory _UsageInfo(
      {required final int used,
      required final int total,
      required final DateTime expireAt}) = _$UsageInfoImpl;

  @override
  int get used;
  @override
  int get total;
  @override
  DateTime get expireAt;

  /// Create a copy of UsageInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UsageInfoImplCopyWith<_$UsageInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$UserRegisterProps {
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;

  /// Create a copy of UserRegisterProps
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserRegisterPropsCopyWith<UserRegisterProps> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserRegisterPropsCopyWith<$Res> {
  factory $UserRegisterPropsCopyWith(
          UserRegisterProps value, $Res Function(UserRegisterProps) then) =
      _$UserRegisterPropsCopyWithImpl<$Res, UserRegisterProps>;
  @useResult
  $Res call({String email, String password, String code});
}

/// @nodoc
class _$UserRegisterPropsCopyWithImpl<$Res, $Val extends UserRegisterProps>
    implements $UserRegisterPropsCopyWith<$Res> {
  _$UserRegisterPropsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserRegisterProps
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? code = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserRegisterPropsImplCopyWith<$Res>
    implements $UserRegisterPropsCopyWith<$Res> {
  factory _$$UserRegisterPropsImplCopyWith(_$UserRegisterPropsImpl value,
          $Res Function(_$UserRegisterPropsImpl) then) =
      __$$UserRegisterPropsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email, String password, String code});
}

/// @nodoc
class __$$UserRegisterPropsImplCopyWithImpl<$Res>
    extends _$UserRegisterPropsCopyWithImpl<$Res, _$UserRegisterPropsImpl>
    implements _$$UserRegisterPropsImplCopyWith<$Res> {
  __$$UserRegisterPropsImplCopyWithImpl(_$UserRegisterPropsImpl _value,
      $Res Function(_$UserRegisterPropsImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserRegisterProps
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? code = null,
  }) {
    return _then(_$UserRegisterPropsImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UserRegisterPropsImpl implements _UserRegisterProps {
  const _$UserRegisterPropsImpl(
      {required this.email, required this.password, required this.code});

  @override
  final String email;
  @override
  final String password;
  @override
  final String code;

  @override
  String toString() {
    return 'UserRegisterProps(email: $email, password: $password, code: $code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserRegisterPropsImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.code, code) || other.code == code));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, password, code);

  /// Create a copy of UserRegisterProps
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserRegisterPropsImplCopyWith<_$UserRegisterPropsImpl> get copyWith =>
      __$$UserRegisterPropsImplCopyWithImpl<_$UserRegisterPropsImpl>(
          this, _$identity);
}

abstract class _UserRegisterProps implements UserRegisterProps {
  const factory _UserRegisterProps(
      {required final String email,
      required final String password,
      required final String code}) = _$UserRegisterPropsImpl;

  @override
  String get email;
  @override
  String get password;
  @override
  String get code;

  /// Create a copy of UserRegisterProps
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserRegisterPropsImplCopyWith<_$UserRegisterPropsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$UserLoginProps {
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  /// Create a copy of UserLoginProps
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserLoginPropsCopyWith<UserLoginProps> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserLoginPropsCopyWith<$Res> {
  factory $UserLoginPropsCopyWith(
          UserLoginProps value, $Res Function(UserLoginProps) then) =
      _$UserLoginPropsCopyWithImpl<$Res, UserLoginProps>;
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class _$UserLoginPropsCopyWithImpl<$Res, $Val extends UserLoginProps>
    implements $UserLoginPropsCopyWith<$Res> {
  _$UserLoginPropsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserLoginProps
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserLoginPropsImplCopyWith<$Res>
    implements $UserLoginPropsCopyWith<$Res> {
  factory _$$UserLoginPropsImplCopyWith(_$UserLoginPropsImpl value,
          $Res Function(_$UserLoginPropsImpl) then) =
      __$$UserLoginPropsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class __$$UserLoginPropsImplCopyWithImpl<$Res>
    extends _$UserLoginPropsCopyWithImpl<$Res, _$UserLoginPropsImpl>
    implements _$$UserLoginPropsImplCopyWith<$Res> {
  __$$UserLoginPropsImplCopyWithImpl(
      _$UserLoginPropsImpl _value, $Res Function(_$UserLoginPropsImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserLoginProps
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_$UserLoginPropsImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UserLoginPropsImpl implements _UserLoginProps {
  const _$UserLoginPropsImpl({required this.email, required this.password});

  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'UserLoginProps(email: $email, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserLoginPropsImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, password);

  /// Create a copy of UserLoginProps
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserLoginPropsImplCopyWith<_$UserLoginPropsImpl> get copyWith =>
      __$$UserLoginPropsImplCopyWithImpl<_$UserLoginPropsImpl>(
          this, _$identity);
}

abstract class _UserLoginProps implements UserLoginProps {
  const factory _UserLoginProps(
      {required final String email,
      required final String password}) = _$UserLoginPropsImpl;

  @override
  String get email;
  @override
  String get password;

  /// Create a copy of UserLoginProps
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserLoginPropsImplCopyWith<_$UserLoginPropsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
