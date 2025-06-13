import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jw_clash/common/common.dart';
import 'package:jw_clash/enum/enum.dart';
import 'package:jw_clash/providers/state.dart';
import 'package:jw_clash/state.dart';
import 'package:jw_clash/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ShowProxies extends ConsumerStatefulWidget {
  const ShowProxies({super.key});

  @override
  ConsumerState<ShowProxies> createState() => _ShowProxiesState();
}

class _ShowProxiesState extends ConsumerState<ShowProxies> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final proxies = ref.watch(proxiesStateProvider);
    return SizedBox(
      height: getWidgetHeight(1),
      child: CommonCard(
        info: Info(
          iconData: Icons.settings,
          label: "选择节点",
        ),
        onPressed: () {
          globalState.appController.toPage(PageLabel.proxies);
        },
        child: Container(
          padding: baseInfoEdgeInsets.copyWith(
            top: 0,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: globalState.theme.bodyMediumHeight + 2,
                child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "当前可用节点数:",
                          style: context.textTheme.bodyMedium?.toLight
                              .adjustSize(1),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          proxies.length.toString(),
                          style: context.textTheme.bodyMedium?.toLight
                              .adjustSize(1),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
