import 'dart:io';
import 'package:jw_clash/common/common.dart';
import 'package:jw_clash/enum/enum.dart';
import 'package:jw_clash/models/models.dart';
import 'package:jw_clash/providers/providers.dart';
import 'package:jw_clash/state.dart';
// import 'package:jw_clash/widgets/scaffold.dart';
import 'package:jw_clash/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

typedef OnSelected = void Function(int index);

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeBackScope(
      child: Consumer(
        builder: (_, ref, child) {
          final state = ref.watch(homeStateProvider);
          // final viewMode = state.viewMode;
          // final navigationItems = state.navigationItems;
          final pageLabel = state.pageLabel;
          final index = navigationItems.lastIndexWhere(
            (element) => element.label == pageLabel,
          );
          final currentIndex = index == -1 ? 0 : index;
          final navigationBar = CommonNavigationBar(
            // viewMode: viewMode, 
            navigationItems: navigationItems,
            currentIndex: currentIndex,
          );
          // final bottomNavigationBar =
          //     viewMode == ViewMode.mobile ? navigationBar : null;
          // final sideNavigationBar =
          //     viewMode != ViewMode.mobile ? navigationBar : null;
          return CommonScaffold(
            key: globalState.homeScaffoldKey,
            title: Intl.message(
              pageLabel.name,
            ),
            navigationBar: navigationBar,
            body: child!,
          );
          // return CommonScaffold(
          //   key: globalState.homeScaffoldKey,
          //   title: Intl.message(
          //     pageLabel.name,
          //   ),
          //   sideNavigationBar: sideNavigationBar,
          //   body: child!,
          //   bottomNavigationBar: bottomNavigationBar,
          // );
        },
        child: _HomePageView(),
      ),
    );
  }
}

class _HomePageView extends ConsumerStatefulWidget {
  const _HomePageView();

  @override
  ConsumerState createState() => _HomePageViewState();
}

class _HomePageViewState extends ConsumerState<_HomePageView> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: _pageIndex,
      keepPage: true,
    );
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

  int get _pageIndex {
    return navigationItems.lastIndexWhere(
      (item) => item.label == globalState.appState.pageLabel,
    );
  }

  _toPage(PageLabel pageLabel, [bool ignoreAnimateTo = false]) async {
    if (!mounted) {
      return;
    }
    final navigationItems = ref.read(currentNavigationsStateProvider).value;
    final index = navigationItems.indexWhere((item) => item.label == pageLabel);
    if (index == -1) {
      return;
    }
    final isAnimateToPage = ref.read(appSettingProvider).isAnimateToPage;
    // final isMobile = ref.read(isMobileViewProvider);
    globalState.homeScaffoldKey.currentState?.closeDrawer();
    if (isAnimateToPage && true && !ignoreAnimateTo) {
      await _pageController.animateToPage(
        index,
        duration: kTabScrollDuration,
        curve: Curves.easeOut,
      );
    } else {
      _pageController.jumpToPage(index);
    }
  }

  // _updatePageController() {
  //   final pageLabel = globalState.appState.pageLabel;
  //   _toPage(pageLabel, false);
  // }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final navigationItems = ref.watch(currentNavigationsStateProvider).value;
    return PageView.builder(
      controller: _pageController,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: navigationItems.length,
      onPageChanged: (index) {
        debouncer.call(DebounceTag.pageChange, () {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (_pageIndex != index) {
              final pageLabel = navigationItems[index].label;
              _toPage(pageLabel, false);
            }
          });
        });
      },
      itemBuilder: (_, index) {
        final navigationItem = navigationItems[index];
        return KeepScope(
          keep: navigationItem.keep,
          key: Key(navigationItem.label.name),
          child: navigationItem.fragment,
        );
      },
    );
  }
}

class CommonNavigationBar extends ConsumerWidget {
  // final ViewMode viewMode;
  final List<NavigationItem> navigationItems;
  final int currentIndex;

  const CommonNavigationBar({
    super.key,
    // required this.viewMode,
    required this.navigationItems,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context, ref) {
    // if (viewMode == ViewMode.mobile) {
    //   return NavigationBarTheme(
    //     data: _NavigationBarDefaultsM3(context),
    //     child: NavigationBar(
    //       destinations: navigationItems
    //           .map(
    //             (e) => NavigationDestination(
    //               icon: e.icon,
    //               label: Intl.message(e.label.name),
    //             ),
    //           )
    //           .toList(),
    //       onDestinationSelected: (index) {
    //         globalState.appController.toPage(navigationItems[index].label);
    //       },
    //       selectedIndex: currentIndex,
    //     ),
    //   );
    // }
    // final showLabel = ref.watch(appSettingProvider).showLabel;
    return Material(
      color: context.colorScheme.surfaceContainer,
      child: SizedBox(
        width: 200,
        child: Column(
          children: [
            Expanded(
              child: ScrollConfiguration(
                behavior: HiddenBarScrollBehavior(),
              child: SingleChildScrollView(
                child: IntrinsicHeight(
                  child: NavigationRail(
                    backgroundColor: context.colorScheme.surfaceContainer,
                    selectedIconTheme: IconThemeData(
                      color: context.colorScheme.onSurfaceVariant,
                    ),
                    unselectedIconTheme: IconThemeData(
                      color: context.colorScheme.onSurfaceVariant,
                    ),
                    selectedLabelTextStyle:
                        context.textTheme.labelLarge!.copyWith(
                      color: context.colorScheme.onSurface,
                    ),
                    unselectedLabelTextStyle:
                        context.textTheme.labelLarge!.copyWith(
                      color: context.colorScheme.onSurface,
                    ),
                    destinations: navigationItems
                        .map(
                          (e) => NavigationRailDestination(
                            icon: e.icon,
                            label: Text(
                              Intl.message(e.label.name),
                            ),
                          ),
                        )
                        .toList(),
                    onDestinationSelected: (index) {
                      globalState.appController
                          .toPage(navigationItems[index].label);
                    },
                    extended: true,
                    // extended: false,
                    selectedIndex: currentIndex,
                    labelType: NavigationRailLabelType.none
                    // labelType: showLabel
                    //     ? NavigationRailLabelType.all
                    //     : NavigationRailLabelType.none,
                  ),
                ),
              ),
            ),
          ),
          // const SizedBox(
          //   height: 16,
          // ),
          // IconButton(
          //   onPressed: () {
          //     ref.read(appSettingProvider.notifier).updateState(
          //           (state) => state.copyWith(
          //             showLabel: !state.showLabel,
          //           ),
          //         );
          //   },
          //   icon: const Icon(Icons.menu),
          // ),
          // const SizedBox(
          //   height: 16,
          // ),
        ],
      ),
      ),
    );
  }
}

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
