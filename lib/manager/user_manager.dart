import 'package:jw_clash/common/proxy.dart';
import 'package:jw_clash/models/models.dart';
import 'package:jw_clash/providers/providers.dart';
import 'package:jw_clash/providers/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
    ref.listenManual(
      authSettingProvider,
      (prev, next) {
        if (prev != next) {
          // _updateProxy(next);
        }
      },
      fireImmediately: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
