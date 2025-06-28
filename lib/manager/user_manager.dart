import 'package:jw_clash/common/common.dart';
import 'package:jw_clash/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jw_clash/state.dart';

class UserManager extends ConsumerStatefulWidget {
  final Widget child;

  const UserManager({super.key, required this.child});

  @override
  ConsumerState createState() => _UserManagerState();
}

class _UserManagerState extends ConsumerState<UserManager> {
  @override
  void initState() {
    super.initState();
    // _fetchProfile();
    ref.listenManual(
      authSettingProvider,
      (prev, next) {
        commonPrint.log("[UserManager] authSettingProvider: $next");
        guaranteeTokenExist();
        updateUsageInfo();
        globalState.appController.savePreferences();
      },
      // fireImmediately: true,
    );
    ref.listenManual(
      initProvider,
      (prev, next) {
        if (prev != next && next) {
          commonPrint.log("[UserManager] initProvider: $next, fetchProfile");
          guaranteeTokenExist();
          updateUsageInfo();
        }
      },
      fireImmediately: true,
    );
  }

  guaranteeTokenExist() async {
    final authSetting = ref.watch(authSettingProvider);
    if (authSetting.token != null && authSetting.token!.isNotEmpty) {
      return;
    }
    if (authSetting.email.isEmpty || authSetting.password.isEmpty) {
      final resp = await request.enzyme.preRegister();
      if (resp != null) {
        ref.read(authSettingProvider.notifier).updateState(
              (state) => state.copyWith(token: resp),
            );
      }
      return;
    }
    final resp =
        await request.enzyme.login(authSetting.email, authSetting.password);
    if (resp != null) {
      ref.read(authSettingProvider.notifier).updateState(
            (state) => state.copyWith(token: resp),
          );
    }
  }

  updateUsageInfo() async {
    final resp = await request.enzyme.querySubscription();
    if (resp != null) {
      ref.read(usageInfoModelProvider.notifier).value = resp;
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
