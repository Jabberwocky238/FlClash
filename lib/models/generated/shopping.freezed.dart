// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../shopping.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

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
