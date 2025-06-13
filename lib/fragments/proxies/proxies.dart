import 'package:jw_clash/common/common.dart';
import 'package:jw_clash/enum/enum.dart';
import 'package:jw_clash/fragments/proxies/list.dart';
import 'package:jw_clash/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'common.dart';

class ProxiesFragment extends ConsumerStatefulWidget {
  const ProxiesFragment({super.key});

  @override
  ConsumerState<ProxiesFragment> createState() => _ProxiesFragmentState();
}

class _ProxiesFragmentState extends ConsumerState<ProxiesFragment>
    with PageMixin {

  @override
  get actions => [
        IconButton(
          onPressed: () async {
            await delayTest(
              ref.watch(proxiesStateProvider),
              ref.watch(appSettingProvider.select((state) => state.testUrl)),
            );
          },
          icon: const Icon(
            Icons.speed_outlined,
          ),
        ),
        // IconButton(
        //   onPressed: () {
        //     showExtend(
        //       context,
        //       builder: (_, type) {
        //         return AdaptiveSheetScaffold(
        //           type: type,
        //           body: const _IconConfigView(),
        //           title: appLocalizations.iconConfiguration,
        //         );
        //       },
        //     );
        //   },
        //   icon: const Icon(
        //     Icons.style_outlined,
        //   ),
        // ),
        //   IconButton(
        //     onPressed: () {
        //       showSheet(
        //         context: context,
        //         props: SheetProps(
        //           isScrollControlled: true,
        //         ),
        //         builder: (_, type) {
        //           return AdaptiveSheetScaffold(
        //             type: type,
        //             body: const ProxiesSetting(),
        //             title: appLocalizations.settings,
        //           );
        //         },
        //       );
        //     },
        //     icon: const Icon(
        //       Icons.tune,
        //     ),
        //   )
      ];

  // @override
  // get floatingActionButton => DelayTestButton(
  //   onClick: () async {
  //     await delayTest(
  //       currentTabProxies,
  //       currentTabTestUrl,
  //     );
  //   },
  // );
  @override
  get floatingActionButton => null;

  @override
  void initState() {
    ref.listenManual(
      proxiesActionsStateProvider,
      fireImmediately: true,
      (prev, next) {
        if (prev == next) {
          return;
        }
        if (next.pageLabel == PageLabel.proxies) {
          initPageState();
          return;
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // ref.watch(themeSettingProvider.select((state) => state.textScale));
    return const ProxiesListFragment();
  }
}
