import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jw_clash/common/common.dart';
import 'package:jw_clash/enum/enum.dart';
import 'package:jw_clash/models/models.dart';
import 'package:jw_clash/providers/providers.dart';
import 'package:jw_clash/state.dart';
import 'package:intl/intl.dart';

class CustomDrawerHeader extends StatelessWidget {
  final List<Widget> children;

  const CustomDrawerHeader({
    super.key,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    final realChildren = [
      Text(
        'JW Clash',
        style: Theme.of(context).textTheme.titleLarge,
      ),
      ...children,
    ].separated(const SizedBox(height: 8)).toList();
    return SizedBox(
      width: double.infinity,
      height: 150,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: realChildren,
        ),
      ),
    );
  }
}

class CommonDrawerNavigationBar extends ConsumerWidget {
  final List<NavigationItem> navigationItems;
  final int currentIndex;

  const CommonDrawerNavigationBar({
    super.key,
    required this.navigationItems,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenWidth = MediaQuery.of(context).size.width;
    final drawerWidth = screenWidth * 0.7 < 300 ? screenWidth * 0.7 : 300.0;
    final authSetting = ref.watch(authSettingProvider);
    return Drawer(
      width: drawerWidth,
      child: Column(
        children: [
          CustomDrawerHeader(
            children: [Consumer(
              builder: (context, ref, _) {
                return Text(
                  authSetting.email.isEmpty
                      ? 'Not logged in'
                      : authSetting.email,
                );
              },
            ), Consumer(
              builder: (context, ref, _) {
                return Text(
                  authSetting.expiresAt?.isEmpty ?? true
                      ? 'Free'
                      : "VIP until ${authSetting.expiresAt}",
                );
              },
            )],
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: navigationItems
                  .where((e) => !e.modes.contains(NavigationItemMode.invisible))
                  .map(
                    (e) => ListTile(
                      leading: e.icon,
                      title: Text(Intl.message(e.label.name)),
                      selected: ref.watch(currentPageLabelProvider) == e.label,
                      onTap: () {
                        globalState.appController.toPage(e.label);
                        Navigator.pop(context); // 关闭抽屉
                      },
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
