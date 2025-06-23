import 'package:jw_clash/clash/clash.dart';
import 'package:jw_clash/common/common.dart';
import 'package:jw_clash/models/models.dart';
import 'package:jw_clash/state.dart';

double get listHeaderHeight {
  // final measure = globalState.theme;
  // return 28 + measure.titleMediumHeight + 4 + measure.bodyMediumHeight;
  final measure = globalState.theme;
  return measure.bodyLargeHeight * 2;
}

double getItemHeight() {
  final measure = globalState.theme;
  return measure.bodyLargeHeight * 2;
}

proxyDelayTest(Proxy proxy, [String? testUrl]) async {
  final appController = globalState.appController;
  final state = appController.getProxyCardState(proxy.name);
  final url = state.testUrl.getSafeValue(
    appController.getRealTestUrl(testUrl),
  );
  if (state.proxyName.isEmpty) {
    return;
  }
  appController.setDelay(
    Delay(
      url: url,
      name: state.proxyName,
      value: 0,
    ),
  );
  appController.setDelay(
    await clashCore.getDelay(
      url,
      state.proxyName,
    ),
  );
}

delayTest(List<Proxy> proxies, [String? testUrl]) async {
  final appController = globalState.appController;
  final proxyNames = proxies.map((proxy) => proxy.name).toSet().toList();

  final delayProxies = proxyNames.map<Future>((proxyName) async {
    final state = appController.getProxyCardState(proxyName);
    final url = state.testUrl.getSafeValue(
      appController.getRealTestUrl(testUrl),
    );
    final name = state.proxyName;
    if (name.isEmpty) {
      return;
    }
    appController.setDelay(
      Delay(
        url: url,
        name: name,
        value: 0,
      ),
    );
    appController.setDelay(
      await clashCore.getDelay(
        url,
        name,
      ),
    );
  }).toList();

  final batchesDelayProxies = delayProxies.batch(100);
  for (final batchDelayProxies in batchesDelayProxies) {
    await Future.wait(batchDelayProxies);
  }
  // appController.addSortNum();
}

// double getScrollToSelectedOffset({
//   required String groupName,
//   required List<Proxy> proxies,
// }) {
//   final appController = globalState.appController;
//   // final columns = appController.getProxiesColumns();
//   final proxyCardType = globalState.config.proxiesStyle.cardType;
//   final selectedProxyName = appController.getSelectedProxyName(groupName);
//   final findSelectedIndex = proxies.indexWhere(
//     (proxy) => proxy.name == selectedProxyName,
//   );
//   final selectedIndex = findSelectedIndex != -1 ? findSelectedIndex : 0;
//   // final rows = (selectedIndex / columns).floor();
//   final rows = 1;
//   return rows * getItemHeight(proxyCardType) + (rows - 1) * 8;
// }
