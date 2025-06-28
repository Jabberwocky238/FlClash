import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jw_clash/common/common.dart';
import 'package:jw_clash/enum/enum.dart';
import 'package:jw_clash/models/models.dart';
import 'package:jw_clash/state.dart';
import 'package:jw_clash/widgets/widgets.dart';
import 'package:flutter/material.dart';

import 'controller.dart';

class PageRegister extends ConsumerStatefulWidget {
  const PageRegister({super.key});

  @override
  ConsumerState<PageRegister> createState() => _PageRegisterState();
}

class _PageRegisterState extends ConsumerState<PageRegister> with PageMixin {
  final _authStateNotifier = ValueNotifier<UserRegisterProps>(
      UserRegisterProps(email: '', password: '', code: ''));

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
          _getVerificationCodeItem(context),
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
    return buildScaffoldView(_build(context), actions, PageLabel.register);
  }

  Widget _getUserEmailItem(BuildContext context) {
    return ValueListenableBuilder<UserRegisterProps>(
      valueListenable: _authStateNotifier,
      builder: (context, authState, child) {
        return CommonCard(
          type: CommonCardType.filled,
          radius: 18,
          child: ListItem.textField(
            title: Text("邮   箱"),
            delegate: TextFieldDelegate(
              onChanged: (value) {
                _authStateNotifier.value = UserRegisterProps(
                  email: value ?? authState.email,
                  password: authState.password,
                  code: authState.code,
                );
              },
            ),
          ),
        );
      },
    );
  }

  Widget _getUserPasswordItem(BuildContext context) {
    return ValueListenableBuilder<UserRegisterProps>(
      valueListenable: _authStateNotifier,
      builder: (context, authState, child) {
        return CommonCard(
          type: CommonCardType.filled,
          radius: 18,
          child: ListItem.textField(
            title: Text("密   码"),
            delegate: TextFieldDelegate(
              onChanged: (value) {
                _authStateNotifier.value = UserRegisterProps(
                  email: authState.email,
                  password: value ?? authState.password,
                  code: authState.code,
                );
              },
            ),
          ),
        );
      },
    );
  }

  Widget _getVerificationCodeItem(BuildContext context) {
    return ValueListenableBuilder<UserRegisterProps>(
      valueListenable: _authStateNotifier,
      builder: (context, authState, child) {
        return CommonCard(
          type: CommonCardType.filled,
          radius: 18,
          child: ListItem.textField(
            title: Text("验证码"),
            delegate: TextFieldDelegate(
              suffixWidget: ElevatedButton(
                onPressed: () async {
                  final email = _authStateNotifier.value.email;
                  final result = await request.enzyme.sendCode(email);
                  globalState.showMessage(
                    cancelable: false,
                    message: TextSpan(text: result ? "发送成功" : "发送失败"),
                  );
                },
                child: const Text("发送验证码"),
              ),
              onChanged: (value) {
                _authStateNotifier.value = _authStateNotifier.value.copyWith(
                  code: value ?? authState.code,
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
          appLocalizations.navigation_register,
          textAlign: TextAlign.center,
        ),
        onTap: () async {
          await useLoadingPage(() async {
            final result = await _register(_authStateNotifier.value);
            await globalState.showMessage(
              cancelable: false,
              message: TextSpan(text: result.message),
            );
            if (result.success) {
              globalState.appController.toPage(PageLabel.login);
            }
          });
        },
      ),
    );
  }

  Future<AuthResult> _register(UserRegisterProps authProps) async {
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
      if (authProps.code.isEmpty) {
        return (success: false, message: "验证码不能为空");
      }
      await request.enzyme
          .register(authProps.email, authProps.password, authProps.code);
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
}
