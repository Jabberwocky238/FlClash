import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jw_clash/common/common.dart';
import 'package:jw_clash/enum/enum.dart';
import 'package:jw_clash/models/models.dart';
import 'package:jw_clash/state.dart';
import 'package:jw_clash/widgets/widgets.dart';
import 'package:flutter/material.dart';

class PageLogin extends ConsumerStatefulWidget {
  const PageLogin({super.key});

  @override
  ConsumerState<PageLogin> createState() => _PageLoginState();
}

class _PageLoginState extends ConsumerState<PageLogin> with PageMixin {
  final _authStateNotifier = ValueNotifier<UserLoginProps>(
    const UserLoginProps(),
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
          await api.useLoadingPage(() async {
            final result = await globalState.authController.login(
                _authStateNotifier.value);
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
}
