import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jw_clash/common/common.dart';
import 'package:jw_clash/enum/enum.dart';
import 'package:jw_clash/models/models.dart';
import 'package:jw_clash/providers/providers.dart';
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
    const UserRegisterProps()
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

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (_, ref, __) {
        ref.listenManual(
          isCurrentPageProvider(
            PageLabel.auth,
            handler: (pageLabel) => pageLabel == PageLabel.auth,
          ),
          (prev, next) {
            if (prev != next && next == true) {
              initPageState();
            }
          },
          fireImmediately: true,
        );
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
      },
    );
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
                onPressed: () {
                  final email = _authStateNotifier.value.email;
                  if (email == null || email.isEmpty) {
                    sayMessage("邮箱不能为空");
                  } else if (!email.isEmail) {
                    sayMessage("邮箱格式不正确");
                  } else {
                    globalState.authController.sendCode(email);
                  }
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
          appLocalizations.register,
          textAlign: TextAlign.center,
        ),
        onTap: () async {
          await globalState.authController.register(_authStateNotifier.value);
        },
      ),
    );
  }
}
