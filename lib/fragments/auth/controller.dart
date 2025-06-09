import 'package:collection/collection.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jw_clash/common/common.dart';
import 'package:jw_clash/enum/enum.dart';
import 'package:jw_clash/models/config.dart';
import 'package:jw_clash/models/profile.dart';
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

  Future<bool> register(AuthProps authProps) async {
    try {
      request.post(
        "$baseUrl/register",
        {
          "email": authProps.email,
          "password": authProps.password,
        },
      );
    } on DioException catch (err, _) {
      if (err.response?.statusCode == 450) {
        sayMessage("邮箱已存在");
      } else {
        sayMessage("注册失败");
      }
      return false;
    }
    final value = await globalState.showCommonDialog<String>(
      child: InputDialog(
        title: appLocalizations.pleaseEnterEmailVerificationCode,
        value: "333444",
        suffixText: "",
        resetValue: "",
      ),
    );
    try {
      await request.post(
        "$baseUrl/verify",
        {
          "email": authProps.email,
          "code": value,
        },
      );
      sayMessage("注册成功");
      printMessage("toPage PageLabel.auth");
      globalState.appController.toPage(PageLabel.auth);
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

  void _saveAuthState(AuthProps authState) {
    _ref.read(authSettingProvider.notifier).updateState(
          (state) => authState,
        );
  }

  Future<String?> login(AuthProps authProps) async {
    try {
      final response = await request.post(
        "$baseUrl/token",
        {
          "email": authProps.email,
          "password": authProps.password,
        },
      );
      if (response.statusCode == 200) {
        sayMessage("登录成功");
        final token = response.data["token"];
        _saveAuthState(authProps.copyWith(token: token));
        await _switchToVVPPNNProfile(token);
        printMessage("toPage PageLabel.auth");
        globalState.appController.toPage(PageLabel.auth);
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

  Future<void> _switchToVVPPNNProfile(String token) async {
    final config = await preferences.getConfig();
    if (config == null) {
      return;
    }
    final url = "$baseUrl/fetch?token=$token";
    var profile = config.profiles
      .firstWhereOrNull((profile) => profile.id == defaultJWClashProfileId);
    if (profile == null) {
      profile = await Profile.fromJWCLash(
        url: url,
      ).update();
    } else {
      await globalState.appController.deleteProfile(defaultJWClashProfileId);
    }
    await globalState.appController.addProfile(profile);
    _ref.read(currentProfileIdProvider.notifier).value = profile.id;
  }
}
