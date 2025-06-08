import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jw_clash/common/common.dart';
import 'package:jw_clash/enum/enum.dart';
import 'package:jw_clash/models/config.dart';
import 'package:jw_clash/providers/providers.dart';
import 'package:jw_clash/state.dart';
import 'package:jw_clash/widgets/widgets.dart';
import 'package:flutter/material.dart';

import 'page_login.dart';

class PageRegister extends ConsumerStatefulWidget {
  const PageRegister  ({super.key});

  @override
  ConsumerState<PageRegister> createState() => _PageRegisterState();
}

class _PageRegisterState extends ConsumerState<PageRegister> with PageMixin {
  final _authStateNotifier = ValueNotifier<AuthProps>(
    const AuthProps(email: '', password: ''),
  );

  @override
  void initState() {
    super.initState();
  }

  void _saveAuthState(AuthProps authState) {
    ref.read(authSettingProvider.notifier).updateState(
      (state) => authState,
    );
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
              _getButtonGroup(context),
            ],
          ),
        );
      },
    );
  }

  Widget _getUserEmailItem(BuildContext context) {
    return ValueListenableBuilder<AuthProps>(
      valueListenable: _authStateNotifier,
      builder: (context, authState, child) {
        return CommonCard(
          type: CommonCardType.filled,
          radius: 18,
          child: ListItem.input(
            padding: const EdgeInsets.only(
              left: 16,
              right: 16,
              top: 4,
              bottom: 4,
            ),
            title: Text(appLocalizations.userEmail),
            delegate: InputDelegate(
              title: appLocalizations.userEmail,
              value: authState.email,
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
    return ValueListenableBuilder<AuthProps>(
      valueListenable: _authStateNotifier,
      builder: (context, authState, child) {
        return CommonCard(
          type: CommonCardType.filled,
          radius: 18,
          child: ListItem.input(
            padding: const EdgeInsets.only(
              left: 16,
              right: 16,
              top: 4,
              bottom: 4,
            ),
            title: Text(appLocalizations.userPassword),
            delegate: InputDelegate(
              title: appLocalizations.userPassword,
              value: authState.password,
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
        title: Text(appLocalizations.register, textAlign: TextAlign.center,),
        onTap: () async {
          final result = await register(_authStateNotifier.value);
          if (result) {
            final token = await login(_authStateNotifier.value);
            if (token != null) {
              _saveAuthState(_authStateNotifier.value.copyWith(token: token));
            }
          }
        },
      ),
    );
  }
}


Future<bool> register(AuthProps authProps) async {
  request.post(
    "$baseUrl/register",
    {
      "email": authProps.email,
      "password": authProps.password,
    },
  );
  final value = await globalState.showCommonDialog<String>(
    child: InputDialog(
      title: appLocalizations.pleaseEnterEmailVerificationCode,
      value: "333444",
      suffixText: "",
      resetValue: "",
    ),
  );
  try {
    final response = await request.post(
      "$baseUrl/verify",
      {
        "email": authProps.email,
        "code": value,
      },
    );
    final code = response.data["code"];
    switch (code) {
      case 200:
        globalState.showMessage(
            message: TextSpan(text: appLocalizations.registerSuccess));
        return true;
      case 450:
        globalState.showMessage(
            message: TextSpan(text: appLocalizations.registerEmailExists));
        return true;
      default:
        globalState.showMessage(
            message: TextSpan(text: appLocalizations.registerFailed));
        return false;
    }
  } catch (e) {
    // commonPrint.log("e: $e");
    globalState.showMessage(
        message: TextSpan(text: appLocalizations.registerFailed));
    return false;
  }
}
