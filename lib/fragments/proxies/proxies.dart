import 'package:jw_clash/common/common.dart';
import 'package:jw_clash/enum/enum.dart';
import 'package:jw_clash/models/models.dart';
import 'package:jw_clash/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jw_clash/state.dart';
import 'package:jw_clash/widgets/widgets.dart';

import 'card.dart';
import 'common.dart';

typedef GroupNameProxiesMap = Map<String, List<Proxy>>;

class ProxiesFragment extends ConsumerStatefulWidget {
  const ProxiesFragment({super.key});

  @override
  ConsumerState<ProxiesFragment> createState() => _ProxiesFragmentState();
}

class _ProxiesFragmentState extends ConsumerState<ProxiesFragment>
    with PageMixin {
  @override
  get actions => [
        ElevatedButton(
          onPressed: () {
            debouncer.call(commonDuration, () {
              delayTest(
                ref.watch(proxiesStateProvider),
                ref.watch(appSettingProvider.select((state) => state.testUrl)),
              );
            });
          },
          child: Row(
            children: [
              const Icon(Icons.speed_outlined),
              const SizedBox(width: 4),
              const Text("测速"),
            ],
          ),
        ),
      ];

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

    WidgetsBinding.instance.addPostFrameCallback((_) {
      commonPrint.log("[ProxiesFragment] initState");
      delayTest(
        ref.watch(proxiesStateProvider),
        ref.watch(appSettingProvider.select((state) => state.testUrl)),
      );
    });
  }

  @override
  void didUpdateWidget(ProxiesFragment oldWidget) {
    super.didUpdateWidget(oldWidget);
    // 找到第一个group
    final currentProfile = ref.watch(currentProfileProvider);
    final currentGroupName = currentProfile?.currentGroupName;
    if (currentGroupName == null || currentGroupName.isEmpty) {
      commonPrint.log("[ProxiesListFragment] didUpdateWidget, currentGroupName is $currentGroupName");
      final groupName = globalState.appController.getCurrentGroups().first.name;
      final currentUnfoldSet = <String>{groupName};
      _handleChange(currentUnfoldSet, groupName);
    }

    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   _adjustHeader();
    // });
  }

  double _getListItemHeight(Type type) {
    return switch (type) {
      const (SizedBox) => 8,
      const (ListHeader) => listHeaderHeight,
      Type() => getItemHeight(),
    };
  }

  @override
  void dispose() {
    // _headerStateNotifier.dispose();
    // _controller.removeListener(_adjustHeader);
    // _controller.dispose();
    super.dispose();
  }

  _handleChange(Set<String> currentUnfoldSet, String groupName) {
    final tempUnfoldSet = <String>{groupName};
    // if (tempUnfoldSet.contains(groupName)) {
    //   tempUnfoldSet.remove(groupName);
    // } else {
    //   tempUnfoldSet.add(groupName);
    // }
    globalState.appController.updateCurrentUnfoldSet(
      tempUnfoldSet,
    );
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   _adjustHeader();
    // });
  }

  List<double> _getItemHeightList(
    List<Widget> items,
    // ProxyCardType proxyCardType,
  ) {
    final itemHeightList = <double>[];
    List<double> headerOffset = [];
    double currentHeight = 0;
    for (final item in items) {
      if (item.runtimeType == ListHeader) {
        headerOffset.add(currentHeight);
      }
      final itemHeight = _getListItemHeight(item.runtimeType);
      itemHeightList.add(itemHeight);
      currentHeight = currentHeight + itemHeight;
    }
    // _headerOffset = headerOffset;
    return itemHeightList;
  }

  List<Widget> _buildItems(
    List<String> groupNames,
    Set<String> currentUnfoldSet,
  ) {
    final columns = 1;
    final items = <Widget>[];
    final GroupNameProxiesMap groupNameProxiesMap = {};
    for (final groupName in groupNames) {
      final group =
          ref.read(groupsProvider.select((state) => state.getGroup(groupName)));
      if (group == null) {
        continue;
      }
      items.addAll([
        ListHeader(
          key: Key(groupName),
          group: group,
        ),
        const SizedBox(
          height: 8,
        ),
      ]);
      // final isExpand = currentUnfoldSet.contains(groupName);
      final isExpand = true;
      if (isExpand) {
        final sortedProxies = globalState.appController.getSortProxies(
          group.all,
          group.testUrl,
        );
        groupNameProxiesMap[groupName] = sortedProxies;
        final chunks = sortedProxies.chunks(columns);
        final rows = chunks.map<Widget>((proxies) {
          final children = proxies
              .map<Widget>(
                (proxy) => Flexible(
                  child: ProxyCard(
                    testUrl: group.testUrl,
                    groupType: group.type,
                    key: ValueKey('$groupName.${proxy.name}'),
                    proxy: proxy,
                    groupName: groupName,
                  ),
                ),
              )
              .fill(
                columns,
                filler: (_) => const Flexible(
                  child: SizedBox(),
                ),
              )
              .separated(
                const SizedBox(
                  width: 8,
                ),
              );

          return Row(
            children: children.toList(),
          );
        }).separated(
          const SizedBox(
            height: 8,
          ),
        );
        items.addAll(
          [
            ...rows,
            const SizedBox(
              height: 8,
            ),
          ],
        );
      }
    }
    // _lastGroupNameProxiesMap = groupNameProxiesMap;
    return items;
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(proxiesListSelectorStateProvider);
    if (state.groupNames.isEmpty) {
      return NullStatus(
        label: appLocalizations.nullProxies,
      );
    }

    final items = _buildItems(
      state.groupNames,
      state.currentUnfoldSet,
    );
    final itemsOffset = _getItemHeightList(items);
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      // controller: _controller,
      itemExtentBuilder: (index, __) {
        // return 26;
        return itemsOffset[index];
      },
      itemCount: items.length,
      itemBuilder: (_, index) {
        return items[index];
      },
    );
  }
}

class ListHeader extends StatefulWidget {
  final Group group;

  const ListHeader({
    super.key,
    required this.group,
  });

  @override
  State<ListHeader> createState() => _ListHeaderState();
}

class _ListHeaderState extends State<ListHeader> {
  String get groupName => widget.group.name;

  String get groupType => widget.group.type.name;

  @override
  Widget build(BuildContext context) {
    return CommonCard(
      radius: 14,
      type: CommonCardType.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            groupName,
            style: context.textTheme.titleMedium,
          ),
        ],
      ),
    );
  }
}
