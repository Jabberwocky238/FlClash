import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jw_clash/common/common.dart';
import 'package:jw_clash/enum/enum.dart';
import 'package:jw_clash/models/config.dart';
import 'package:jw_clash/providers/providers.dart';
import 'package:jw_clash/state.dart';
import 'package:jw_clash/widgets/widgets.dart';
import 'package:flutter/material.dart';

import 'functions.dart';

class AuthFragment extends ConsumerStatefulWidget {
  const AuthFragment({super.key});

  @override
  ConsumerState<AuthFragment> createState() => _AuthFragmentState();
}

class _AuthFragmentState extends ConsumerState<AuthFragment> with PageMixin {
  final _authStateNotifier = ValueNotifier<AuthProps>(
    const AuthProps(),
  );

  @override
  void initState() {
    super.initState();
  }

  void _initAuthState() {
    final authSetting = ref.watch(authSettingProvider);
    _authStateNotifier.value = authSetting;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _initAuthState();
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
    final oldEmail = ref.watch(authSettingProvider.select((state) => state.email));
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
                  email: value ?? oldEmail,
                );
              },
            ),
          ),
        );
      },
    );
  }

  Widget _getUserPasswordItem(BuildContext context) {
    final oldPassword = ref.watch(authSettingProvider.select((state) => state.password));
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
                  password: value ?? oldPassword,
                );
              },
            ),
          ),
        );
      },
    );
  }

  Widget _getButtonGroup(BuildContext context) {
    return ValueListenableBuilder<AuthProps>(
      valueListenable: _authStateNotifier,
      builder: (context, authState, child) {
        return CommonChipGroup(
          chips: [
            CommonChip(
              avatar: const Icon(Icons.login),
              label: appLocalizations.login,
              onPressed: () => login(authState),
            ),
            CommonChip(
              avatar: const Icon(Icons.person_add),
              label: appLocalizations.register,
              onPressed: () => register(authState),
            ),
            CommonChip(
              avatar: const Icon(Icons.logout),
              label: appLocalizations.logout,
            ),
          ],
        );
      },
    );
  }
}

