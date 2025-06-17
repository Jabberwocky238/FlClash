import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jw_clash/common/common.dart';
import 'package:jw_clash/enum/enum.dart';
import 'package:jw_clash/models/models.dart';
import 'package:jw_clash/providers/providers.dart';
import 'package:jw_clash/providers/state.dart';
import 'package:jw_clash/state.dart';
import 'package:jw_clash/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ShowProxies extends StatefulWidget {
  const ShowProxies({super.key});

  @override
  State<ShowProxies> createState() => _ShowProxiesState();
}

class _ShowProxiesState extends State<ShowProxies> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget _currentProxyInfo(BuildContext context, String proxyName) {
    return Row(
      children: [
        Text(
          proxyName,
          style: context.textTheme.bodySmall?.toLight,
        ),
      ],
    );
  }

  Widget _buildSystemProxyInfo(BuildContext context, int proxyLength) {
    return Row(
      children: [
        Text(
          "可用节点数:",
          style: context.textTheme.bodySmall?.toLight,
        ),
        SizedBox(
          width: 8,
        ),
        Text(
          proxyLength.toString(),
          style: context.textTheme.bodySmall?.toLight,
        ),
      ],
    );
  }

  Widget _buildWarpper(BuildContext context, Widget child) {
    return Container(
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
            child: child,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
        child: Consumer(
          builder: (_, ref, child) {
            final groups = ref.watch(currentGroupsStateProvider);
            final currentGroupName = ref.watch(proxiesSelectorStateProvider
                .select((state) => state.currentGroupName));
            final authSetting = ref.watch(authSettingProvider);
            final isLogin = authSetting.isLogin;
            final isExpired = authSetting.isExpired;
            final proxyLength = !isLogin || isExpired
                ? groups.value
                    .firstWhere((e) => e.name == freeSubscriptionGroupName)
                    .all
                    .length
                : groups.value.map((e) => e.all).expand((e) => e).length;
            if (currentGroupName == null || currentGroupName.isEmpty) {
              return _buildWarpper(
                  context, _buildSystemProxyInfo(context, proxyLength));
            }
            final proxyName = ref.watch(getProxyNameProvider(currentGroupName));
            if (proxyName == null || proxyName.isEmpty) {
              return _buildWarpper(
                  context, _buildSystemProxyInfo(context, proxyLength));
            }
            commonPrint.log("[ShowProxies] proxyName: $proxyName");
            return _buildWarpper(
                context, _currentProxyInfo(context, proxyName));
          },
        ),
      ),
    );
  }
}
