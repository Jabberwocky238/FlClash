// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../user.dart';

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
  DateTime? get expiresAt => throw _privateConstructorUsedError;
  int? get usageAmount => throw _privateConstructorUsedError;
  int? get totalAmount => throw _privateConstructorUsedError;

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
  $Res call(
      {String email,
      String password,
      String? token,
      DateTime? expiresAt,
      int? usageAmount,
      int? totalAmount});
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
    Object? expiresAt = freezed,
    Object? usageAmount = freezed,
    Object? totalAmount = freezed,
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
      expiresAt: freezed == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      usageAmount: freezed == usageAmount
          ? _value.usageAmount
          : usageAmount // ignore: cast_nullable_to_non_nullable
              as int?,
      totalAmount: freezed == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as int?,
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
  $Res call(
      {String email,
      String password,
      String? token,
      DateTime? expiresAt,
      int? usageAmount,
      int? totalAmount});
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
    Object? expiresAt = freezed,
    Object? usageAmount = freezed,
    Object? totalAmount = freezed,
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
      expiresAt: freezed == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      usageAmount: freezed == usageAmount
          ? _value.usageAmount
          : usageAmount // ignore: cast_nullable_to_non_nullable
              as int?,
      totalAmount: freezed == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AuthPropsImpl implements _AuthProps {
  const _$AuthPropsImpl(
      {this.email = '',
      this.password = '',
      this.token,
      this.expiresAt,
      this.usageAmount,
      this.totalAmount});

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
  final DateTime? expiresAt;
  @override
  final int? usageAmount;
  @override
  final int? totalAmount;

  @override
  String toString() {
    return 'AuthProps(email: $email, password: $password, token: $token, expiresAt: $expiresAt, usageAmount: $usageAmount, totalAmount: $totalAmount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthPropsImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt) &&
            (identical(other.usageAmount, usageAmount) ||
                other.usageAmount == usageAmount) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, email, password, token, expiresAt, usageAmount, totalAmount);

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
      final String? token,
      final DateTime? expiresAt,
      final int? usageAmount,
      final int? totalAmount}) = _$AuthPropsImpl;

  factory _AuthProps.fromJson(Map<String, dynamic> json) =
      _$AuthPropsImpl.fromJson;

  @override
  String get email;
  @override
  String get password;
  @override
  String? get token;
  @override
  DateTime? get expiresAt;
  @override
  int? get usageAmount;
  @override
  int? get totalAmount;

  /// Create a copy of AuthProps
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthPropsImplCopyWith<_$AuthPropsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$UserRegisterProps {
  String? get email => throw _privateConstructorUsedError;
  String? get password => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;

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
  $Res call({String? email, String? password, String? code});
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
    Object? email = freezed,
    Object? password = freezed,
    Object? code = freezed,
  }) {
    return _then(_value.copyWith(
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
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
  $Res call({String? email, String? password, String? code});
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
    Object? email = freezed,
    Object? password = freezed,
    Object? code = freezed,
  }) {
    return _then(_$UserRegisterPropsImpl(
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$UserRegisterPropsImpl implements _UserRegisterProps {
  const _$UserRegisterPropsImpl({this.email, this.password, this.code});

  @override
  final String? email;
  @override
  final String? password;
  @override
  final String? code;

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
      {final String? email,
      final String? password,
      final String? code}) = _$UserRegisterPropsImpl;

  @override
  String? get email;
  @override
  String? get password;
  @override
  String? get code;

  /// Create a copy of UserRegisterProps
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserRegisterPropsImplCopyWith<_$UserRegisterPropsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$UserLoginProps {
  String? get email => throw _privateConstructorUsedError;
  String? get password => throw _privateConstructorUsedError;
  String? get ip => throw _privateConstructorUsedError;

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
  $Res call({String? email, String? password, String? ip});
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
    Object? email = freezed,
    Object? password = freezed,
    Object? ip = freezed,
  }) {
    return _then(_value.copyWith(
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      ip: freezed == ip
          ? _value.ip
          : ip // ignore: cast_nullable_to_non_nullable
              as String?,
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
  $Res call({String? email, String? password, String? ip});
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
    Object? email = freezed,
    Object? password = freezed,
    Object? ip = freezed,
  }) {
    return _then(_$UserLoginPropsImpl(
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      ip: freezed == ip
          ? _value.ip
          : ip // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$UserLoginPropsImpl implements _UserLoginProps {
  const _$UserLoginPropsImpl({this.email, this.password, this.ip});

  @override
  final String? email;
  @override
  final String? password;
  @override
  final String? ip;

  @override
  String toString() {
    return 'UserLoginProps(email: $email, password: $password, ip: $ip)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserLoginPropsImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.ip, ip) || other.ip == ip));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, password, ip);

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
      {final String? email,
      final String? password,
      final String? ip}) = _$UserLoginPropsImpl;

  @override
  String? get email;
  @override
  String? get password;
  @override
  String? get ip;

  /// Create a copy of UserLoginProps
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserLoginPropsImplCopyWith<_$UserLoginPropsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$OrderCommonProps {
  String get orderType => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get price => throw _privateConstructorUsedError;

  /// Create a copy of OrderCommonProps
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderCommonPropsCopyWith<OrderCommonProps> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderCommonPropsCopyWith<$Res> {
  factory $OrderCommonPropsCopyWith(
          OrderCommonProps value, $Res Function(OrderCommonProps) then) =
      _$OrderCommonPropsCopyWithImpl<$Res, OrderCommonProps>;
  @useResult
  $Res call({String orderType, String name, String price});
}

/// @nodoc
class _$OrderCommonPropsCopyWithImpl<$Res, $Val extends OrderCommonProps>
    implements $OrderCommonPropsCopyWith<$Res> {
  _$OrderCommonPropsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderCommonProps
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderType = null,
    Object? name = null,
    Object? price = null,
  }) {
    return _then(_value.copyWith(
      orderType: null == orderType
          ? _value.orderType
          : orderType // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderCommonPropsImplCopyWith<$Res>
    implements $OrderCommonPropsCopyWith<$Res> {
  factory _$$OrderCommonPropsImplCopyWith(_$OrderCommonPropsImpl value,
          $Res Function(_$OrderCommonPropsImpl) then) =
      __$$OrderCommonPropsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String orderType, String name, String price});
}

/// @nodoc
class __$$OrderCommonPropsImplCopyWithImpl<$Res>
    extends _$OrderCommonPropsCopyWithImpl<$Res, _$OrderCommonPropsImpl>
    implements _$$OrderCommonPropsImplCopyWith<$Res> {
  __$$OrderCommonPropsImplCopyWithImpl(_$OrderCommonPropsImpl _value,
      $Res Function(_$OrderCommonPropsImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrderCommonProps
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderType = null,
    Object? name = null,
    Object? price = null,
  }) {
    return _then(_$OrderCommonPropsImpl(
      orderType: null == orderType
          ? _value.orderType
          : orderType // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$OrderCommonPropsImpl implements _OrderCommonProps {
  const _$OrderCommonPropsImpl(
      {required this.orderType, required this.name, required this.price});

  @override
  final String orderType;
  @override
  final String name;
  @override
  final String price;

  @override
  String toString() {
    return 'OrderCommonProps(orderType: $orderType, name: $name, price: $price)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderCommonPropsImpl &&
            (identical(other.orderType, orderType) ||
                other.orderType == orderType) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.price, price) || other.price == price));
  }

  @override
  int get hashCode => Object.hash(runtimeType, orderType, name, price);

  /// Create a copy of OrderCommonProps
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderCommonPropsImplCopyWith<_$OrderCommonPropsImpl> get copyWith =>
      __$$OrderCommonPropsImplCopyWithImpl<_$OrderCommonPropsImpl>(
          this, _$identity);
}

abstract class _OrderCommonProps implements OrderCommonProps {
  const factory _OrderCommonProps(
      {required final String orderType,
      required final String name,
      required final String price}) = _$OrderCommonPropsImpl;

  @override
  String get orderType;
  @override
  String get name;
  @override
  String get price;

  /// Create a copy of OrderCommonProps
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderCommonPropsImplCopyWith<_$OrderCommonPropsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$OrderSelectionProps {
  OrderCommonProps? get selectedOrder => throw _privateConstructorUsedError;
  List<OrderCommonProps> get orders => throw _privateConstructorUsedError;

  /// Create a copy of OrderSelectionProps
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderSelectionPropsCopyWith<OrderSelectionProps> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderSelectionPropsCopyWith<$Res> {
  factory $OrderSelectionPropsCopyWith(
          OrderSelectionProps value, $Res Function(OrderSelectionProps) then) =
      _$OrderSelectionPropsCopyWithImpl<$Res, OrderSelectionProps>;
  @useResult
  $Res call({OrderCommonProps? selectedOrder, List<OrderCommonProps> orders});

  $OrderCommonPropsCopyWith<$Res>? get selectedOrder;
}

/// @nodoc
class _$OrderSelectionPropsCopyWithImpl<$Res, $Val extends OrderSelectionProps>
    implements $OrderSelectionPropsCopyWith<$Res> {
  _$OrderSelectionPropsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderSelectionProps
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedOrder = freezed,
    Object? orders = null,
  }) {
    return _then(_value.copyWith(
      selectedOrder: freezed == selectedOrder
          ? _value.selectedOrder
          : selectedOrder // ignore: cast_nullable_to_non_nullable
              as OrderCommonProps?,
      orders: null == orders
          ? _value.orders
          : orders // ignore: cast_nullable_to_non_nullable
              as List<OrderCommonProps>,
    ) as $Val);
  }

  /// Create a copy of OrderSelectionProps
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OrderCommonPropsCopyWith<$Res>? get selectedOrder {
    if (_value.selectedOrder == null) {
      return null;
    }

    return $OrderCommonPropsCopyWith<$Res>(_value.selectedOrder!, (value) {
      return _then(_value.copyWith(selectedOrder: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OrderSelectionPropsImplCopyWith<$Res>
    implements $OrderSelectionPropsCopyWith<$Res> {
  factory _$$OrderSelectionPropsImplCopyWith(_$OrderSelectionPropsImpl value,
          $Res Function(_$OrderSelectionPropsImpl) then) =
      __$$OrderSelectionPropsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({OrderCommonProps? selectedOrder, List<OrderCommonProps> orders});

  @override
  $OrderCommonPropsCopyWith<$Res>? get selectedOrder;
}

/// @nodoc
class __$$OrderSelectionPropsImplCopyWithImpl<$Res>
    extends _$OrderSelectionPropsCopyWithImpl<$Res, _$OrderSelectionPropsImpl>
    implements _$$OrderSelectionPropsImplCopyWith<$Res> {
  __$$OrderSelectionPropsImplCopyWithImpl(_$OrderSelectionPropsImpl _value,
      $Res Function(_$OrderSelectionPropsImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrderSelectionProps
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedOrder = freezed,
    Object? orders = null,
  }) {
    return _then(_$OrderSelectionPropsImpl(
      selectedOrder: freezed == selectedOrder
          ? _value.selectedOrder
          : selectedOrder // ignore: cast_nullable_to_non_nullable
              as OrderCommonProps?,
      orders: null == orders
          ? _value._orders
          : orders // ignore: cast_nullable_to_non_nullable
              as List<OrderCommonProps>,
    ));
  }
}

/// @nodoc

class _$OrderSelectionPropsImpl implements _OrderSelectionProps {
  const _$OrderSelectionPropsImpl(
      {this.selectedOrder, final List<OrderCommonProps> orders = const []})
      : _orders = orders;

  @override
  final OrderCommonProps? selectedOrder;
  final List<OrderCommonProps> _orders;
  @override
  @JsonKey()
  List<OrderCommonProps> get orders {
    if (_orders is EqualUnmodifiableListView) return _orders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_orders);
  }

  @override
  String toString() {
    return 'OrderSelectionProps(selectedOrder: $selectedOrder, orders: $orders)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderSelectionPropsImpl &&
            (identical(other.selectedOrder, selectedOrder) ||
                other.selectedOrder == selectedOrder) &&
            const DeepCollectionEquality().equals(other._orders, _orders));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, selectedOrder, const DeepCollectionEquality().hash(_orders));

  /// Create a copy of OrderSelectionProps
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderSelectionPropsImplCopyWith<_$OrderSelectionPropsImpl> get copyWith =>
      __$$OrderSelectionPropsImplCopyWithImpl<_$OrderSelectionPropsImpl>(
          this, _$identity);
}

abstract class _OrderSelectionProps implements OrderSelectionProps {
  const factory _OrderSelectionProps(
      {final OrderCommonProps? selectedOrder,
      final List<OrderCommonProps> orders}) = _$OrderSelectionPropsImpl;

  @override
  OrderCommonProps? get selectedOrder;
  @override
  List<OrderCommonProps> get orders;

  /// Create a copy of OrderSelectionProps
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderSelectionPropsImplCopyWith<_$OrderSelectionPropsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$OrderSelectionPageState {
  bool get loading => throw _privateConstructorUsedError;
  bool get error => throw _privateConstructorUsedError;

  /// Create a copy of OrderSelectionPageState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderSelectionPageStateCopyWith<OrderSelectionPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderSelectionPageStateCopyWith<$Res> {
  factory $OrderSelectionPageStateCopyWith(OrderSelectionPageState value,
          $Res Function(OrderSelectionPageState) then) =
      _$OrderSelectionPageStateCopyWithImpl<$Res, OrderSelectionPageState>;
  @useResult
  $Res call({bool loading, bool error});
}

/// @nodoc
class _$OrderSelectionPageStateCopyWithImpl<$Res,
        $Val extends OrderSelectionPageState>
    implements $OrderSelectionPageStateCopyWith<$Res> {
  _$OrderSelectionPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderSelectionPageState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? error = null,
  }) {
    return _then(_value.copyWith(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderSelectionPageStateImplCopyWith<$Res>
    implements $OrderSelectionPageStateCopyWith<$Res> {
  factory _$$OrderSelectionPageStateImplCopyWith(
          _$OrderSelectionPageStateImpl value,
          $Res Function(_$OrderSelectionPageStateImpl) then) =
      __$$OrderSelectionPageStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool loading, bool error});
}

/// @nodoc
class __$$OrderSelectionPageStateImplCopyWithImpl<$Res>
    extends _$OrderSelectionPageStateCopyWithImpl<$Res,
        _$OrderSelectionPageStateImpl>
    implements _$$OrderSelectionPageStateImplCopyWith<$Res> {
  __$$OrderSelectionPageStateImplCopyWithImpl(
      _$OrderSelectionPageStateImpl _value,
      $Res Function(_$OrderSelectionPageStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrderSelectionPageState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? error = null,
  }) {
    return _then(_$OrderSelectionPageStateImpl(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$OrderSelectionPageStateImpl implements _OrderSelectionPageState {
  const _$OrderSelectionPageStateImpl(
      {this.loading = true, this.error = false});

  @override
  @JsonKey()
  final bool loading;
  @override
  @JsonKey()
  final bool error;

  @override
  String toString() {
    return 'OrderSelectionPageState(loading: $loading, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderSelectionPageStateImpl &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, loading, error);

  /// Create a copy of OrderSelectionPageState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderSelectionPageStateImplCopyWith<_$OrderSelectionPageStateImpl>
      get copyWith => __$$OrderSelectionPageStateImplCopyWithImpl<
          _$OrderSelectionPageStateImpl>(this, _$identity);
}

abstract class _OrderSelectionPageState implements OrderSelectionPageState {
  const factory _OrderSelectionPageState(
      {final bool loading, final bool error}) = _$OrderSelectionPageStateImpl;

  @override
  bool get loading;
  @override
  bool get error;

  /// Create a copy of OrderSelectionPageState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderSelectionPageStateImplCopyWith<_$OrderSelectionPageStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
