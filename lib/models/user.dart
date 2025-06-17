import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jw_clash/models/config.dart';

import 'profile.dart';

part 'generated/user.freezed.dart';

part 'generated/user.g.dart';

String? _checkEmail(String? email) {
  if (email == null || email.isEmpty) {
    return null;
  }
  // regex
  final regex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
  if (!regex.hasMatch(email)) {
    return null;
  }
  return email;
}

extension StringExt on String {
  bool get isEmail => _checkEmail(this) != null;
}

@freezed
class AuthProps with _$AuthProps {
  const factory AuthProps({
    @Default('') String email,
    @Default('') String password,
    String? token,
    DateTime? expiresAt,
    int? usageAmount,
    int? totalAmount,
  }) = _AuthProps;

  factory AuthProps.anonymous() => const AuthProps(
    email: '',
    password: '',
    token: null,
    expiresAt: null,
    usageAmount: null,
    totalAmount: null,
  );

  factory AuthProps.fromJson(Map<String, dynamic> json) =>
      _$AuthPropsFromJson(json);

  factory AuthProps.safeFromJson(Map<String, dynamic> json) {
    try {
      return AuthProps.fromJson(json);
    } catch (_) {
      return defaultAuthProps;
    }
  }
}

extension AuthPropsExt on AuthProps {
  bool get isExpired => expiresAt == null ? false : expiresAt!.isBefore(DateTime.now());

  bool get isLogin => email.isNotEmpty && password.isNotEmpty && token != null && token!.isNotEmpty;

  SubscriptionInfo get subscriptionInfo {
    return SubscriptionInfo(
      download: usageAmount?.toInt() ?? 0,
      upload: usageAmount?.toInt() ?? 0,
      total: totalAmount?.toInt() ?? 1000 * 1024 * 1024,
      expire: expiresAt?.millisecondsSinceEpoch ?? 0,
    );
  }
}

@freezed
class UserRegisterProps with _$UserRegisterProps {
  const factory UserRegisterProps({
    String? email,
    String? password,
    String? code,
  }) = _UserRegisterProps;
}

@freezed
class UserLoginProps with _$UserLoginProps {
  const factory UserLoginProps({
    String? email,
    String? password,
  }) = _UserLoginProps;
}

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


