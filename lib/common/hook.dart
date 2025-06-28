import 'package:jw_clash/state.dart';

useLoadingPage<T>(
  Future<T> Function() func,
) async {
  final commonScaffoldState = globalState.homePageKey.currentState;
  if (commonScaffoldState == null) {
    throw Exception("commonScaffoldState is null");
  }
  return await commonScaffoldState.loadingRun<T>(() async {
    return await func();
  });
}
