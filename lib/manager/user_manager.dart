import 'package:jw_clash/common/common.dart';
// import 'package:jw_clash/common/proxy.dart';
import 'package:jw_clash/models/models.dart';
import 'package:jw_clash/providers/providers.dart';
// import 'package:jw_clash/providers/state.dart';
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
  final ValueNotifier<Profile?> _profile = ValueNotifier(null);

  @override
  void initState() {
    super.initState();
    // _fetchProfile();
    ref.listenManual(
      authSettingProvider,
      (prev, next) {
        if (prev != next) {
          _fetchProfile();
          _updateRemoteIp();
          globalState.appController.savePreferences();
        }
      },
      // fireImmediately: true,
    );
    ref.listenManual(
      initProvider,
      (prev, next) {
        if (prev != next && next) {
          commonPrint.log("[user_manager] initProvider: $next, fetchProfile");
          _fetchProfile();
          _updateRemoteIp();
        }
      },
      fireImmediately: true,
    );
  }

  _updateRemoteIp() async {
    final ipInfo = await request.checkIp();
    if (ipInfo != null) {
      globalState.appState = globalState.appState.copyWith(
        remoteIp: ipInfo.ip,
      );
    }
  }

  _fetchProfile() async {
    try {
      final token =
          ref.watch(authSettingProvider.select((state) => state.token));
      _profile.value = await apiController.fetchProfile(token);
      globalState.appController.setProfileAndAutoApply(_profile.value!);
      ref.read(currentProfileIdProvider.notifier).value = _profile.value!.id;
      printMessage("switch to ${_profile.value!.url}");
    } catch (e) {
      printMessage("fetch profile failed: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
