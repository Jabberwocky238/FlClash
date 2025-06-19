import 'package:jw_clash/enum/enum.dart';
import 'package:jw_clash/fragments/fragments.dart';
import 'package:jw_clash/models/models.dart';
import 'package:flutter/material.dart';

class Navigation {
  static Navigation? _instance;

  List<NavigationItem> getItems({
    bool hasProxies = false,
  }) {
    return [
      NavigationItem(
        icon: const Icon(Icons.space_dashboard),
        label: PageLabel.dashboard,
        builder: (context) => const DashboardFragment(),
        modes: [NavigationItemMode.invisible]
      ),
      NavigationItem(
        icon: const Icon(Icons.person),
        label: PageLabel.auth,
        builder: (context) => const AuthFragment(),
        modes: [NavigationItemMode.mobile, NavigationItemMode.desktop],
      ),
      // ###############################################
      NavigationItem(
        icon: const Icon(Icons.article),
        label: PageLabel.proxies,
        builder: (context) => const ProxiesFragment(),
        modes: hasProxies
            ? [NavigationItemMode.mobile, NavigationItemMode.desktop, NavigationItemMode.invisible]
            : [NavigationItemMode.invisible],
      ),
      NavigationItem(
        icon: const Icon(Icons.shopping_cart),
        label: PageLabel.order,
        builder: (context) => OrderFragment(),
        modes: [],
      ),
      NavigationItem(
        icon: const Icon(Icons.folder),
        label: PageLabel.profiles,
        builder: (context) => ProfilesFragment(),
        modes:[NavigationItemMode.invisible],
      ),
      NavigationItem(
        icon: const Icon(Icons.storage),
        label: PageLabel.resources,
        builder: (context) => Resources(
          key: GlobalObjectKey(
            PageLabel.resources,
          ),
        ),
        modes: [NavigationItemMode.more, NavigationItemMode.invisible],
      ),
      // NavigationItem(
      //   icon: const Icon(Icons.adb),
      //   label: PageLabel.logs,
      //   fragment: const LogsFragment(
      //     key: GlobalObjectKey(
      //       PageLabel.logs,
      //     ),
      //   ),
      //   description: "logsDesc",
      //   modes: [NavigationItemMode.desktop, NavigationItemMode.more, NavigationItemMode.invisible],
      // ),
      NavigationItem(
        icon: const Icon(Icons.construction),
        label: PageLabel.tools,
        builder: (context) => ToolsFragment(
          key: GlobalObjectKey(
            PageLabel.tools,
          ),
        ),
        modes: const [NavigationItemMode.desktop, NavigationItemMode.mobile, NavigationItemMode.invisible],
      ),
            NavigationItem(
        icon: const Icon(Icons.person),
        label: PageLabel.login,
        builder: (context) => PageLogin(
          key: GlobalObjectKey(PageLabel.login),
        ),
        modes: const [NavigationItemMode.mobile, NavigationItemMode.desktop, NavigationItemMode.invisible],
      ),
      NavigationItem(
        icon: const Icon(Icons.person),
        label: PageLabel.register,
        builder: (context) => PageRegister(
          key: GlobalObjectKey(PageLabel.register),
        ),
        modes: const [NavigationItemMode.mobile, NavigationItemMode.desktop, NavigationItemMode.invisible],
      ),
    ];
  }

  Navigation._internal();

  factory Navigation() {
    _instance ??= Navigation._internal();
    return _instance!;
  }
}

final navigation = Navigation();
final navigationItems = navigation.getItems();
