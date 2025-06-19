import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jw_clash/common/common.dart';
import 'package:jw_clash/enum/enum.dart';
import 'package:jw_clash/models/models.dart';
import 'package:jw_clash/providers/providers.dart';
import 'package:jw_clash/state.dart';
import 'package:intl/intl.dart';

class CustomDrawerHeader extends ConsumerStatefulWidget {
  const CustomDrawerHeader({super.key});

  @override
  ConsumerState<CustomDrawerHeader> createState() => _CustomDrawerHeaderState();
}

class _CustomDrawerHeaderState extends ConsumerState<CustomDrawerHeader> {
  Widget _buildSubscriptionInfo(
      BuildContext context, SubscriptionInfo subscriptionInfo) {
    final use = subscriptionInfo.upload + subscriptionInfo.download;
    final total = subscriptionInfo.total;
    final progress = use / total;

    final useShow = TrafficValue(value: use).show;
    final totalShow = TrafficValue(value: total).show;
    final expireDate =
        DateTime.fromMillisecondsSinceEpoch(subscriptionInfo.expire);
    final expireShow =
        expireDate.isAfter(DateTime.now()) ? expireDate.show : "免费版";
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LinearProgressIndicator(
          minHeight: 6,
          value: progress,
          backgroundColor: context.colorScheme.primary.opacity15,
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          "$useShow / $totalShow · $expireShow",
          style: context.textTheme.labelMedium?.toLight,
        ),
      ],
    );
  }

  List<Widget> _buildProfileInfo(BuildContext context) {
    // final profile = ref.watch(currentProfileProvider);
    // final subscriptionInfo = profile?.subscriptionInfo;
    final authSetting = ref.watch(authSettingProvider);
    final subscriptionInfo = authSetting.subscriptionInfo;
    // commonPrint.log("[NavigationDrawer] subscriptionInfo: $subscriptionInfo");
    return [
      const SizedBox(
        height: 8,
      ),
      // if (subscriptionInfo != null)
      _buildSubscriptionInfo(context, subscriptionInfo),
      // Text(
      //   profile?.lastUpdateDate?.lastUpdateTimeDesc ?? "",
      //   style: context.textTheme.labelMedium?.toLight,
      // ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final authSetting = ref.watch(authSettingProvider);
    // final currentProfile = ref.watch(currentProfileProvider);
    final realChildren = <Widget>[
      Text(
        authSetting.email.isEmpty ? '请先登录' : authSetting.email,
        style: context.textTheme.labelLarge?.toLight,
      ),
      ..._buildProfileInfo(context),
    ].separated(const SizedBox(height: 8)).toList();
    return SizedBox(
      width: double.infinity,
      height: 130,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
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
  // final List<NavigationItem> navigationItems;
  // final int currentIndex;

  const CommonDrawerNavigationBar({
    super.key,
    // required this.navigationItems,
    // required this.currentIndex,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenWidth = MediaQuery.of(context).size.width;
    final drawerWidth = screenWidth * 0.7 < 300 ? screenWidth * 0.7 : 300.0;
    return Drawer(
      width: drawerWidth,
      child: Column(
        children: [
          const SizedBox(
            height: kToolbarHeight / 2,
          ),
          CustomDrawerHeader(),
          Divider(
            height: 1,
            color: context.colorScheme.primary.opacity15,
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: navigationItems
                  .where((e) => !e.modes.contains(NavigationItemMode.invisible))
                  .map(
                    (e) => ListTile(
                      leading: e.icon,
                      title: Text(Intl.message("navigation_${e.label.name}")),
                      selected: ref.watch(currentPageLabelProvider) == e.label,
                      onTap: () {
                        globalState.appController.toPage(e.label);
                        // Navigator.pop(context); // 关闭抽屉
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
