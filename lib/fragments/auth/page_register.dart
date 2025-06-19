import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jw_clash/common/common.dart';
import 'package:jw_clash/enum/enum.dart';
import 'package:jw_clash/models/models.dart';
import 'package:jw_clash/providers/providers.dart';
import 'package:jw_clash/state.dart';
import 'package:jw_clash/widgets/widgets.dart';
import 'package:flutter/material.dart';

class PageRegister extends ConsumerStatefulWidget {
  const PageRegister({super.key});

  @override
  ConsumerState<PageRegister> createState() => _PageRegisterState();
}

class _PageRegisterState extends ConsumerState<PageRegister> with PageMixin {
  final _authStateNotifier =
      ValueNotifier<UserRegisterProps>(const UserRegisterProps());

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
                  final result =
                      await globalState.authController.sendCode(email);
                  globalState.showMessage(
                    cancelable: false,
                    message: TextSpan(text: result.message),
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
          await apiController.useLoadingPage(() async {
            final result = await globalState.authController
                .register(_authStateNotifier.value);
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
}
