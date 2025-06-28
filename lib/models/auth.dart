import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/auth.freezed.dart';

part 'generated/auth.g.dart';

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
  }) = _AuthProps;

  factory AuthProps.anonymous() => AuthProps(
        email: '',
        password: '',
        token: null,
      );

  factory AuthProps.fromJson(Map<String, dynamic> json) =>
      _$AuthPropsFromJson(json);

  factory AuthProps.safeFromJson(Map<String, dynamic> json) {
    try {
      return AuthProps.fromJson(json);
    } catch (_) {
      return AuthProps.anonymous();
    }
  }
}

extension AuthPropsExt on AuthProps {
  bool get isLogin => token != null && token!.isNotEmpty;
}

@freezed
class UsageInfo with _$UsageInfo {
  const factory UsageInfo({
    required int used,
    required int total,
    required DateTime expireAt,
  }) = _UsageInfo;
}

extension UsageInfoExt on UsageInfo {
  bool get isExpired => expireAt.isBefore(DateTime.now());
}

@freezed
class UserRegisterProps with _$UserRegisterProps {
  const factory UserRegisterProps({
    required String email,
    required String password,
    required String code,
  }) = _UserRegisterProps;
}

@freezed
class UserLoginProps with _$UserLoginProps {
  const factory UserLoginProps({
    required String email,
    required String password,
  }) = _UserLoginProps;
}
