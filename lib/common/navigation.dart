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
      const NavigationItem(
        icon: Icon(Icons.space_dashboard),
        label: PageLabel.dashboard,
        fragment: DashboardFragment(
          key: GlobalObjectKey(PageLabel.dashboard),
        ),
      ),
      const NavigationItem(
        icon: Icon(Icons.person),
        label: PageLabel.auth,
        fragment: AuthFragment(
          key: GlobalObjectKey(PageLabel.auth),
        ),
        modes: [NavigationItemMode.mobile, NavigationItemMode.desktop],
      ),
      NavigationItem(
        icon: const Icon(Icons.article),
        label: PageLabel.proxies,
        fragment: const ProxiesFragment(
          key: GlobalObjectKey(PageLabel.proxies),
        ),
        modes: hasProxies
            ? [NavigationItemMode.mobile, NavigationItemMode.desktop]
            : [],
      ),
      // ###############################################
      const NavigationItem(
        icon: Icon(Icons.folder),
        label: PageLabel.profiles,
        fragment: ProfilesFragment(
          key: GlobalObjectKey(
            PageLabel.profiles,
          ),
        ),
        modes: [NavigationItemMode.invisible],
      ),
      const NavigationItem(
        icon: Icon(Icons.view_timeline),
        label: PageLabel.requests,
        fragment: RequestsFragment(
          key: GlobalObjectKey(
            PageLabel.requests,
          ),
        ),
        description: "requestsDesc",
        modes: [NavigationItemMode.desktop, NavigationItemMode.invisible],
      ),
      const NavigationItem(
        icon: Icon(Icons.ballot),
        label: PageLabel.connections,
        fragment: ConnectionsFragment(
          key: GlobalObjectKey(
            PageLabel.connections,
          ),
        ),
        description: "connectionsDesc",
        modes: [NavigationItemMode.desktop, NavigationItemMode.invisible],
      ),
      const NavigationItem(
        icon: Icon(Icons.storage),
        label: PageLabel.resources,
        description: "resourcesDesc",
        keep: false,
        fragment: Resources(
          key: GlobalObjectKey(
            PageLabel.resources,
          ),
        ),
        modes: [NavigationItemMode.more, NavigationItemMode.invisible],
      ),
      NavigationItem(
        icon: const Icon(Icons.adb),
        label: PageLabel.logs,
        fragment: const LogsFragment(
          key: GlobalObjectKey(
            PageLabel.logs,
          ),
        ),
        description: "logsDesc",
        modes: [NavigationItemMode.desktop, NavigationItemMode.more, NavigationItemMode.invisible],
      ),
      const NavigationItem(
        icon: Icon(Icons.construction),
        label: PageLabel.tools,
        fragment: ToolsFragment(
          key: GlobalObjectKey(
            PageLabel.tools,
          ),
        ),
        modes: [NavigationItemMode.desktop, NavigationItemMode.mobile, NavigationItemMode.invisible],
      ),
            const NavigationItem(
        icon: Icon(Icons.person),
        label: PageLabel.login,
        fragment: PageLogin(
          key: GlobalObjectKey(PageLabel.login),
        ),
        modes: [NavigationItemMode.mobile, NavigationItemMode.desktop, NavigationItemMode.invisible],
      ),
      const NavigationItem(
        icon: Icon(Icons.person),
        label: PageLabel.register,
        fragment: PageRegister(
          key: GlobalObjectKey(PageLabel.register),
        ),
        modes: [NavigationItemMode.mobile, NavigationItemMode.desktop, NavigationItemMode.invisible],
      ),
      // const NavigationItem(
      //   icon: Icon(Icons.person),
      //   label: PageLabel.webView,
      //   fragment: WebViewFragment(
      //     key: GlobalObjectKey(PageLabel.webView),
      //   ),
      //   modes: [NavigationItemMode.mobile, NavigationItemMode.desktop],
      // ),  
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
