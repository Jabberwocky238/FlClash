import 'package:collection/collection.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jw_clash/common/common.dart';
import 'package:jw_clash/models/models.dart';
import 'package:jw_clash/providers/providers.dart';
import 'package:jw_clash/state.dart';
import 'package:flutter/material.dart';

void printMessage(String message) {
  commonPrint.log("[AuthController] $message");
}

typedef AuthResult = ({bool success, String message});

class AuthController {
  final BuildContext context;
  final WidgetRef _ref;

  AuthController(this.context, WidgetRef ref) : _ref = ref;

  Future<AuthResult> register(UserRegisterProps authProps) async {
    try {
      if (authProps.email == null || authProps.email!.isEmpty) {
        return (success: false, message: "邮箱不能为空");
      }
      if (!authProps.email!.isEmail) {
        return (success: false, message: "邮箱格式不正确");
      }
      if (authProps.password == null || authProps.password!.isEmpty) {
        return (success: false, message: "密码不能为空");
      }
      if (authProps.code == null || authProps.code!.isEmpty) {
        return (success: false, message: "验证码不能为空");
      }
      await _register(authProps.email!, authProps.password!, authProps.code!);
      return (success: true, message: "注册成功");
    } on DioException catch (err, _) {
      if (err.response?.statusCode == 450) {
        return (success: false, message: "邮箱 ${authProps.email} 已存在");
      } else if (err.response?.statusCode == 441) {
        return (success: false, message: "验证码错误");
      } else {
        return (success: false, message: "注册失败");
      }
    }
  }

  Future<AuthResult> login(UserLoginProps authProps) async {
    try {
      if (authProps.email == null || authProps.email!.isEmpty) {
        return (success: false, message: "邮箱不能为空");
      }
      if (!authProps.email!.isEmail) {
        return (success: false, message: "邮箱格式不正确");
      }
      if (authProps.password == null || authProps.password!.isEmpty) {
        return (success: false, message: "密码不能为空");
      }
      final (token, expiresAt) = await _login(authProps.email!, authProps.password!);
      if (token != null) {
        commonPrint.log("[AuthController] login success: $token, $expiresAt");
        await _saveAuthState(AuthProps(
          email: authProps.email!,
          password: authProps.password!,
          token: token,
          expiresAt: expiresAt,
        ));
        await _switchToVVPPNNProfile(token);
        // await globalState.appController.autoUpdateProfiles();
        return (success: true, message: "登录成功 token: $token");
      } else {
        return (success: false, message: "登录失败");
      }
    } on DioException catch (err, _) {
      if (err.response?.statusCode == 404) {
        return (success: false, message: "邮箱 ${authProps.email} 未注册");
      } else if (err.response?.statusCode == 401) {
        return (success: false, message: "密码错误");
      } else {
        return (success: false, message: "登录失败");
      }
    }
  }

  Future<AuthResult> logout() async {
    try {
      await _saveAuthState(const AuthProps(email: '', password: '', token: '', expiresAt: ''));
      await _switchToVVPPNNProfile(null);
      // await globalState.appController.autoUpdateProfiles();
      return (success: true, message: "退出成功");
    } on DioException catch (err, _) {
      return (success: false, message: "退出失败");
    }
  }

  Future<AuthResult> sendCode(String? email) async {
    try {
      if (email == null || email.isEmpty) {
        return (success: false, message: "邮箱不能为空");
      }
      if (!email.isEmail) {
        return (success: false, message: "邮箱格式不正确");
      }
      await _sendCode(email);
      return (success: true, message: "验证码已发送");
    } on DioException catch (err, _) {
      return (success: false, message: "邮箱 $email 发送验证码失败");
    }
  }

  Future<void> _saveAuthState(AuthProps authState) async {
    _ref.read(authSettingProvider.notifier).updateState(
      (state) => authState,
    );
  }

  Future<void> _switchToVVPPNNProfile(String? token) async {
    final config = await preferences.getConfig();
    if (config == null) {
      return;
    }
    final url = "$baseUrl/fetch_config${token == null || token.isEmpty ? "" : "?token=$token"}";
    var profile = config.profiles
        .firstWhereOrNull((profile) => profile.id == defaultJWClashProfileId);
    if (profile == null) {
      profile = await Profile.fromJWCLash(url: url).update();
    } else {
      profile = await profile.copyWith(url: url).update();
    }
    // printMessage("profile: $profile");
    await globalState.appController.setProfileAndAutoApply(profile);
    _ref.read(currentProfileIdProvider.notifier).value = profile.id;
    //  设置组
    final firstGroup = _ref.read(currentGroupsStateProvider.select((state) => state.value)).first;
    globalState.appController.updateCurrentUnfoldSet(
      {firstGroup.name},
    );
    printMessage("switch to ${profile.url}");
  }
}

Future<Response<dynamic>> _sendCode(String email) async {
  if (email.isEmpty) {
    throw Exception("email cannot be empty");
  }
  return await request.post(
    "$baseUrl/auth/sendcode",
    {"email": email},
  );
}

Future<Response<dynamic>> _register(
    String email, String password, String code) async {
  if (email.isEmpty || password.isEmpty || code.isEmpty) {
    throw Exception("email, password, code cannot be empty");
  }
  return await request.post(
    "$baseUrl/auth/register",
    {"email": email, "password": password, "code": code},
  );
}

Future<(String?, String?)> _login(String email, String password) async {
  if (email.isEmpty || password.isEmpty) {
    throw Exception("email, password cannot be empty");
  }
  final response = await request.post(
    "$baseUrl/auth/token",
    {"email": email, "password": password},
  );
  return (response.data['token'] as String?, response.data['vip_expired_at'] as String?);
}
