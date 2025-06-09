import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jw_clash/common/common.dart';
import 'package:jw_clash/enum/enum.dart';
import 'package:jw_clash/models/config.dart';
import 'package:jw_clash/providers/providers.dart';
import 'package:jw_clash/state.dart';
import 'package:jw_clash/widgets/widgets.dart';
import 'package:flutter/material.dart';

class PageLogin extends ConsumerStatefulWidget {
  const PageLogin({super.key});

  @override
  ConsumerState<PageLogin> createState() => _PageLoginState();
}

class _PageLoginState extends ConsumerState<PageLogin> with PageMixin {
  final _authStateNotifier = ValueNotifier<AuthProps>(
    const AuthProps(email: '', password: ''),
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
        title: Text(appLocalizations.login, textAlign: TextAlign.center,),
        onTap: () async {
          await globalState.homeScaffoldKey.currentState?.loadingRun(() async {
            await globalState.authController.login(_authStateNotifier.value);
          });
        },
      ),
    );
  }
}

