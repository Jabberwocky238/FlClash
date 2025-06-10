import 'package:collection/collection.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jw_clash/common/common.dart';
import 'package:jw_clash/enum/enum.dart';
import 'package:jw_clash/models/models.dart';
import 'package:jw_clash/providers/providers.dart';
import 'package:jw_clash/state.dart';
import 'package:jw_clash/widgets/widgets.dart';
import 'package:flutter/material.dart';

void sayMessage(String message) {
  globalState.showMessage(cancelable: false, message: TextSpan(text: message));
}

void printMessage(String message) {
  commonPrint.log("[AuthController] $message");
}

class AuthController {
  final BuildContext context;
  final WidgetRef _ref;

  AuthController(this.context, WidgetRef ref) : _ref = ref;

  Future<bool> register(UserRegisterProps authProps) async {
    try {
      if (authProps.email == null || authProps.email!.isEmpty) {
        sayMessage("邮箱不能为空");
        return false;
      }
      if (!authProps.email!.isEmail) {
        sayMessage("邮箱格式不正确");
        return false;
      }
      if (authProps.password == null || authProps.password!.isEmpty) {
        sayMessage("密码不能为空");
        return false;
      }
      if (authProps.code == null || authProps.code!.isEmpty) {
        sayMessage("验证码不能为空");
        return false;
      }
      await _register(authProps.email!, authProps.password!, authProps.code!);
      sayMessage("注册成功");
      return true;
    } on DioException catch (err, _) {
      if (err.response?.statusCode == 441) {
        sayMessage("验证码错误");
      } else {
        sayMessage("注册失败");
      }
      return false;
    }
  }

  Future<String?> login(UserLoginProps authProps) async {
    try {
      if (authProps.email == null || authProps.email!.isEmpty) {
        sayMessage("邮箱不能为空");
        return null;
      }
      if (!authProps.email!.isEmail) {
        sayMessage("邮箱格式不正确");
        return null;
      }
      if (authProps.password == null || authProps.password!.isEmpty) {
        sayMessage("密码不能为空");
        return null;
      }
      final response = await _login(authProps.email!, authProps.password!);
      if (response.statusCode == 200) {
        sayMessage("登录成功");
        final token = response.data["token"];
        printMessage("token: $token");
        _saveAuthState(AuthProps(
          email: authProps.email!,
          password: authProps.password!,
          token: token,
        ));
        await _switchToVVPPNNProfile(token);
        return token;
      } else {
        sayMessage("登录失败");
        return null;
      }
    } on DioException catch (err, _) {
      if (err.response?.statusCode == 401) {
        sayMessage("邮箱或密码错误");
      } else {
        sayMessage("登录失败");
      }
      return null;
    }
  }

  void _saveAuthState(AuthProps authState) {
    _ref.read(authSettingProvider.notifier).updateState(
          (state) => authState,
        );
  }

  Future<void> _switchToVVPPNNProfile(String token) async {
    final config = await preferences.getConfig();
    if (config == null) {
      return;
    }
    final url = "$baseUrl/fetch?token=$token";
    var profile = config.profiles
        .firstWhereOrNull((profile) => profile.id == defaultJWClashProfileId);
    if (profile == null) {
      profile = await Profile.fromJWCLash(url: url).update();
    } else {
      profile = profile.copyWith(url: url);
    }
    // printMessage("profile: $profile");
    await globalState.appController.setProfileAndAutoApply(profile);
    _ref.read(currentProfileIdProvider.notifier).value = profile.id;
  }

  sendCode(String email) async {
    try {
      if (email.isEmpty) {
        sayMessage("邮箱不能为空");
        return null;
      }
      if (!email.isEmail) {
        sayMessage("邮箱格式不正确");
        return null;
      }
      await _sendCode(email);
      sayMessage("验证码已发送");
    } on DioException catch (err, _) {
      sayMessage("邮箱 $email 发送验证码失败");
      rethrow;
    }
  }

  Future<Response<dynamic>> _sendCode(String email) async {
    try {
      return await request.post(
        "$baseUrl/sendcode",
        {"email": email},
      );
    } on DioException catch (err, _) {
      // sayMessage("邮箱 $email 发送验证码失败");
      rethrow;
    }
  }

  Future<Response<dynamic>> _register(String email, String password, String code) async {
    try {
      return await request.post(
        "$baseUrl/register",
        {"email": email, "password": password, "code": code},
      );
    } on DioException catch (err, _) {
      if (err.response?.statusCode == 450) {
        sayMessage("邮箱 $email 已存在");
      } else if (err.response?.statusCode == 441) {
        sayMessage("验证码错误");
      } else {
        sayMessage("$email 注册失败");
      }
      rethrow;
    }
  }

  Future<Response<dynamic>> _login(String email, String password) async {
    try {
      return await request.post(
        "$baseUrl/token",
        {"email": email, "password": password},
      );
    } on DioException catch (err, _) {
      if (err.response?.statusCode == 404) {
        sayMessage("邮箱 $email 未注册");
      } else if (err.response?.statusCode == 401) {
        sayMessage("密码错误");
      } else {
        sayMessage("登录失败");
      }
      rethrow;
    }
  }
}
