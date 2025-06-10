import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jw_clash/enum/enum.dart';
import 'package:jw_clash/models/models.dart';
import 'package:jw_clash/providers/providers.dart';
import 'package:jw_clash/state.dart';
import 'package:intl/intl.dart';

class CustomDrawerHeader extends StatelessWidget {
  final Widget child;

  const CustomDrawerHeader({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'JW Clash',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
            ),
            const SizedBox(height: 8),
            child,
          ],
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
    final drawerWidth = screenWidth * 0.5 < 250 ? screenWidth * 0.5 : 250.0;
    final authSetting = ref.watch(authSettingProvider);
    return Drawer(
      width: drawerWidth,
      child: Column(
        children: [
          CustomDrawerHeader(
            child: Consumer(
              builder: (context, ref, _) {
                return Text(
                  authSetting.email.isEmpty
                      ? 'Not logged in'
                      : authSetting.email,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                );
              },
            ),
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
