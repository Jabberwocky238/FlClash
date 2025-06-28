import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jw_clash/common/common.dart';
import 'package:jw_clash/enum/enum.dart';
import 'package:jw_clash/models/models.dart';
import 'package:jw_clash/providers/providers.dart';
import 'package:jw_clash/state.dart';
import 'package:jw_clash/widgets/widgets.dart';
import 'package:flutter/material.dart';

import 'controller.dart';

class PageLogin extends ConsumerStatefulWidget {
  const PageLogin({super.key});

  @override
  ConsumerState<PageLogin> createState() => _PageLoginState();
}

class _PageLoginState extends ConsumerState<PageLogin> with PageMixin {
  final _authStateNotifier = ValueNotifier<UserLoginProps>(
    const UserLoginProps(email: '', password: ''),
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _authStateNotifier.dispose();
    super.dispose();
  }

  Widget _build(BuildContext context) {
    return SingleChildScrollView(
      padding: baseInfoEdgeInsets,
      child: Column(
        children: [
          _getUserEmailItem(context),
          const SizedBox(
            height: 16,
          ),
          _getUserPasswordItem(context),
          const SizedBox(
            height: 16,
          ),
          _getButtonGroup(context),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return buildScaffoldView(_build(context), actions, PageLabel.login);
  }

  Widget _getUserEmailItem(BuildContext context) {
    return ValueListenableBuilder<UserLoginProps>(
      valueListenable: _authStateNotifier,
      builder: (context, authState, child) {
        return CommonCard(
          type: CommonCardType.filled,
          radius: 18,
          child: ListItem.textField(
            title: Text("邮箱"),
            delegate: TextFieldDelegate(
              onChanged: (value) {
                _authStateNotifier.value = _authStateNotifier.value.copyWith(
                  email: value ?? authState.email,
                );
              },
            ),
          ),
        );
      },
    );
  }

  Widget _getUserPasswordItem(BuildContext context) {
    return ValueListenableBuilder<UserLoginProps>(
      valueListenable: _authStateNotifier,
      builder: (context, authState, child) {
        return CommonCard(
          type: CommonCardType.filled,
          radius: 18,
          child: ListItem.textField(
            title: Text("密码"),
            delegate: TextFieldDelegate(
              onChanged: (value) {
                _authStateNotifier.value = _authStateNotifier.value.copyWith(
                  password: value ?? authState.password,
                );
              },
            ),
          ),
        );
      },
    );
  }

  Widget _getButtonGroup(BuildContext context) {
    return CommonCard(
      type: CommonCardType.filled,
      radius: 18,
      child: ListItem(
        title: Text(
          appLocalizations.navigation_login,
          textAlign: TextAlign.center,
        ),
        onTap: () async {
          await useLoadingPage(() async {
            final result = await _login(_authStateNotifier.value);
            await globalState.showMessage(
              cancelable: false,
              message: TextSpan(text: result.message),
            );
            if (result.success) {
              globalState.appController.toPage(PageLabel.auth);
            }
          });
        },
      ),
    );
  }

  Future<AuthResult> _login(UserLoginProps authProps) async {
    try {
      if (authProps.email.isEmpty) {
        return (success: false, message: "邮箱不能为空");
      }
      if (!authProps.email.isEmail) {
        return (success: false, message: "邮箱格式不正确");
      }
      if (authProps.password.isEmpty) {
        return (success: false, message: "密码不能为空");
      }
      final token =
          await request.enzyme.login(authProps.email, authProps.password);
      if (token != null) {
        commonPrint.log("[AuthController] login success: $token");
        final authSetting = AuthProps(
            email: authProps.email, password: authProps.password, token: token);
        ref.read(authSettingProvider.notifier).value = authSetting;
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
}
