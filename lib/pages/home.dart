import 'dart:io';
import 'package:jw_clash/common/common.dart';
// import 'package:jw_clash/enum/enum.dart';
import 'package:jw_clash/fragments/dashboard/dashboard.dart';
import 'package:jw_clash/fragments/dashboard/widgets/start_button.dart';
// import 'package:jw_clash/models/models.dart';
// import 'package:jw_clash/providers/providers.dart';
import 'package:jw_clash/state.dart';
import 'package:jw_clash/widgets/navigation_drawer.dart';
import 'package:jw_clash/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return HomePage(key: globalState.homePageKey);
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  // late PageController _pageController;
  final ValueNotifier<bool> _loading = ValueNotifier(false);
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // _pageController = PageController(
    //   initialPage: _pageIndex,
    //   keepPage: true,
    // );
    // ref.listenManual(currentPageLabelProvider, (prev, next) {
    //   if (prev != next) {
    //     _toPage(next);
    //   }
    // });
    // ref.listenManual(currentNavigationsStateProvider, (prev, next) {
    //   if (prev?.value.length != next.value.length) {
    //     _updatePageController();
    //   }
    // });
  }

  // int get _pageIndex {
  //   return navigationItems.lastIndexWhere(
  //     (item) => item.label == globalState.appState.pageLabel,
  //   );
  // }

  openDrawer() {
    _scaffoldKey.currentState?.openDrawer();
  }

  closeDrawer() {
    _scaffoldKey.currentState?.closeDrawer();
  }

  Future<T?> loadingRun<T>(
    Future<T> Function() futureFunction, {
    String? title,
  }) async {
    _loading.value = true;
    try {
      final res = await futureFunction();
      _loading.value = false;
      return res;
    } catch (e) {
      globalState.showMessage(
        title: title ?? appLocalizations.tip,
        message: TextSpan(
          text: e.toString(),
        ),
      );
      _loading.value = false;
      return null;
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final state = ref.watch(homeStateProvider);
    // // final viewMode = state.viewMode;
    // // final navigationItems = state.navigationItems;
    // final pageLabel = state.pageLabel;
    // final index = navigationItems.lastIndexWhere(
    //   (element) => element.label == pageLabel,
    // );
    // final currentIndex = index == -1 ? 0 : index;
    // final navigationBar = CommonNavigationBar(
    //   // viewMode: viewMode,
    //   navigationItems: navigationItems,
    //   currentIndex: currentIndex,
    // );
    final navigationBar = CommonDrawerNavigationBar();
    return Consumer(
      builder: (context, ref, child) {
        return Scaffold(
          key: _scaffoldKey,
          drawer: navigationBar,
          appBar: AppBar(
            title: Text("Enzyme VPN"),
            leading: IconButton(
              onPressed: () {
                openDrawer();
              },
              icon: Icon(Icons.menu),
            ),
          ),
          body: child!,
          floatingActionButton: const StartButton(),
        );
      },
      child: PageView.builder(
        itemBuilder: (context, index) {
          return DashboardFragment();
        },
      ),
    );
    // return CommonScaffold(
    //   key: globalState.homeScaffoldKey,
    //   title: pageLabel == PageLabel.dashboard ? "Enzyme" : pageLabel.localName,
    //   navigationBar: navigationBar,
    //   body: child!,
    // );
  }
}

// class CommonNavigationBar extends ConsumerWidget {
//   // final ViewMode viewMode;
//   final List<NavigationItem> navigationItems;
//   final int currentIndex;

//   const CommonNavigationBar({
//     super.key,
//     // required this.viewMode,
//     required this.navigationItems,
//     required this.currentIndex,
//   });

//   @override
//   Widget build(BuildContext context, ref) {
//     return Material(
//       color: context.colorScheme.surfaceContainer,
//       child: SizedBox(
//         width: 200,
//         child: Column(
//           children: [
//             Expanded(
//               child: ScrollConfiguration(
//                 behavior: HiddenBarScrollBehavior(),
//               child: SingleChildScrollView(
//                 child: IntrinsicHeight(
//                   child: NavigationRail(
//                     backgroundColor: context.colorScheme.surfaceContainer,
//                     selectedIconTheme: IconThemeData(
//                       color: context.colorScheme.onSurfaceVariant,
//                     ),
//                     unselectedIconTheme: IconThemeData(
//                       color: context.colorScheme.onSurfaceVariant,
//                     ),
//                     selectedLabelTextStyle:
//                         context.textTheme.labelLarge!.copyWith(
//                       color: context.colorScheme.onSurface,
//                     ),
//                     unselectedLabelTextStyle:
//                         context.textTheme.labelLarge!.copyWith(
//                       color: context.colorScheme.onSurface,
//                     ),
//                     destinations: navigationItems
//                         .where((e) => !e.modes.contains(NavigationItemMode.invisible))
//                         .map(
//                           (e) => NavigationRailDestination(
//                             icon: e.icon,
//                             label: Text(
//                               e.label.navigationName,
//                             ),
//                           ),
//                         )
//                         .toList(),
//                     onDestinationSelected: (index) {
//                       globalState.appController
//                           .toPage(navigationItems[index].label);
//                     },
//                     extended: true,
//                     // extended: false,
//                     selectedIndex: currentIndex,
//                     labelType: NavigationRailLabelType.none
//                     // labelType: showLabel
//                     //     ? NavigationRailLabelType.all
//                     //     : NavigationRailLabelType.none,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           // const SizedBox(
//           //   height: 16,
//           // ),
//           // IconButton(
//           //   onPressed: () {
//           //     ref.read(appSettingProvider.notifier).updateState(
//           //           (state) => state.copyWith(
//           //             showLabel: !state.showLabel,
//           //           ),
//           //         );
//           //   },
//           //   icon: const Icon(Icons.menu),
//           // ),
//           // const SizedBox(
//           //   height: 16,
//           // ),
//         ],
//       ),
//       ),
//     );
//   }
// }

class HomeBackScope extends StatelessWidget {
  final Widget child;

  const HomeBackScope({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      return CommonPopScope(
        onPop: () async {
          final canPop = Navigator.canPop(context);
          if (canPop) {
            Navigator.pop(context);
          } else {
            await globalState.appController.handleBackOrExit();
          }
          return false;
        },
        child: child,
      );
    }
    return child;
  }
}
