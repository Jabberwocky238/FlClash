import 'dart:async';

import 'package:dio/dio.dart';
import 'package:jw_clash/common/common.dart';
import 'package:jw_clash/enum/enum.dart';
import 'package:jw_clash/models/models.dart';
import 'package:jw_clash/providers/app.dart';
import 'package:jw_clash/state.dart';
import 'package:jw_clash/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final _networkDetectionState = ValueNotifier<NetworkDetectionState>(
  const NetworkDetectionState(
    isTesting: false,
    isLoading: true,
    ipInfo: null,
  ),
);

class JwDashboard extends ConsumerStatefulWidget {
  const JwDashboard({super.key});

  @override
  ConsumerState<JwDashboard> createState() => _JwDashboardState();
}

class _JwDashboardState extends ConsumerState<JwDashboard> {
  List<Point> initPoints = const [Point(0, 0), Point(1, 0)];
  bool? _preIsStart;
  Timer? _setTimeoutTimer;
  CancelToken? cancelToken;

  @override
  void initState() {
    ref.listenManual(checkIpNumProvider, (prev, next) {
      if (prev != next) {
        _startCheck();
      }
    });
    if (!_networkDetectionState.value.isTesting &&
        _networkDetectionState.value.isLoading) {
      _startCheck();
    }
    super.initState();
  }

  _startCheck() async {
    if (cancelToken != null) {
      cancelToken!.cancel();
      cancelToken = null;
    }
    debouncer.call(
      DebounceTag.checkIp,
      _checkIp,
    );
  }

  _checkIp() async {
    final appState = globalState.appState;
    final isInit = appState.isInit;
    if (!isInit) return;
    final isStart = appState.runTime != null;
    if (_preIsStart == false &&
        _preIsStart == isStart &&
        _networkDetectionState.value.ipInfo != null) {
      return;
    }
    _clearSetTimeoutTimer();
    _networkDetectionState.value = _networkDetectionState.value.copyWith(
      isLoading: true,
      ipInfo: null,
    );
    _preIsStart = isStart;
    if (cancelToken != null) {
      cancelToken!.cancel();
      cancelToken = null;
    }
    cancelToken = CancelToken();
    try {
      _networkDetectionState.value = _networkDetectionState.value.copyWith(
        isTesting: true,
      );
      final ipInfo = await request.checkIp(cancelToken: cancelToken);
      _networkDetectionState.value = _networkDetectionState.value.copyWith(
        isTesting: false,
      );
      if (ipInfo != null) {
        _networkDetectionState.value = _networkDetectionState.value.copyWith(
          isLoading: false,
          ipInfo: ipInfo,
        );
        return;
      }
      _clearSetTimeoutTimer();
      _setTimeoutTimer = Timer(const Duration(milliseconds: 300), () {
        _networkDetectionState.value = _networkDetectionState.value.copyWith(
          isLoading: false,
          ipInfo: null,
        );
      });
    } catch (e) {
      if (e.toString() == "cancelled") {
        _networkDetectionState.value = _networkDetectionState.value.copyWith(
          isLoading: true,
          ipInfo: null,
        );
      }
    }
  }

  @override
  void dispose() {
    _clearSetTimeoutTimer();
    super.dispose();
  }

  _clearSetTimeoutTimer() {
    if (_setTimeoutTimer != null) {
      _setTimeoutTimer?.cancel();
      _setTimeoutTimer = null;
    }
  }

  _countryCodeToEmoji(String countryCode) {
    final String code = countryCode.toUpperCase();
    if (code.length != 2) {
      return countryCode;
    }
    final int firstLetter = code.codeUnitAt(0) - 0x41 + 0x1F1E6;
    final int secondLetter = code.codeUnitAt(1) - 0x41 + 0x1F1E6;
    return String.fromCharCode(firstLetter) + String.fromCharCode(secondLetter);
  }

  Traffic _getLastTraffic(List<Traffic> traffics) {
    if (traffics.isEmpty) return Traffic();
    return traffics.last;
  }

  Widget _buildTrafficInfo(BuildContext context) {
    final traffics = ref.watch(trafficsProvider).list;
    final color = context.colorScheme.onSurfaceVariant.opacity80;
    return Text(
      "${_getLastTraffic(traffics).up}↑   ${_getLastTraffic(traffics).down}↓",
      style: context.textTheme.bodySmall?.copyWith(
        color: color,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getWidgetHeight(2),
      child: ValueListenableBuilder<NetworkDetectionState>(
        valueListenable: _networkDetectionState,
        builder: (_, state, __) {
          return CommonCard(
            info: Info(
              label: appLocalizations.networkSpeed,
              iconData: Icons.speed_sharp,
            ),
            onPressed: () {},
            suffix: _buildTrafficInfo(context),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 1,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildIPInfo(context, state),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  _buildIPInfo(BuildContext context, NetworkDetectionState state) {
    final ipInfo = state.ipInfo;
    final isLoading = state.isLoading;
    final textStyle = context.textTheme.bodyLarge?.toLight.adjustSize(16);
    return Container(
      padding: baseInfoEdgeInsets.copyWith(
        left: 12,
      ),
      child: Center(
        child: ipInfo != null
            ? Row(
                children: [
                  Text(
                    _countryCodeToEmoji(
                      ipInfo.countryCode,
                    ),
                    style: textStyle?.copyWith(
                      fontFamily: FontFamily.twEmoji.value,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    ipInfo.ip,
                    style: textStyle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              )
            : FadeThroughBox(
                child: isLoading == false && ipInfo == null
                    ? Text(
                        "timeout",
                        style: context.textTheme.bodyMedium
                            ?.copyWith(color: Colors.red)
                            .adjustSize(1),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      )
                    : Container(
                        padding: const EdgeInsets.all(2),
                        child: const AspectRatio(
                          aspectRatio: 1,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                          ),
                        ),
                      ),
              ),
      ),
    );
  }
}
