import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/shopping.freezed.dart';

// part 'generated/shopping.g.dart';

@freezed
class OrderCommonProps with _$OrderCommonProps {
  const factory OrderCommonProps({
    required String orderType,
    required String name,
    required String price,
  }) = _OrderCommonProps;
}

@freezed
class OrderSelectionProps with _$OrderSelectionProps {
  const factory OrderSelectionProps({
    OrderCommonProps? selectedOrder,
    @Default([]) List<OrderCommonProps> orders,
  }) = _OrderSelectionProps;
}

@freezed
class OrderSelectionPageState with _$OrderSelectionPageState {
  const factory OrderSelectionPageState({
    @Default(true) bool loading,
    @Default(false) bool error,
  }) = _OrderSelectionPageState;
}
