import 'package:jw_clash/common/common.dart';
import 'package:jw_clash/enum/enum.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'auth.dart';
import 'common.dart';
import 'core.dart';
import 'selector.dart';
import 'shopping.dart';

part 'generated/app.freezed.dart';

typedef DelayMap = Map<String, Map<String, int?>>;

@freezed
class AppState with _$AppState {
  const factory AppState({
    @Default(false) bool isInit,
    @Default(PageLabel.dashboard) PageLabel pageLabel,
    @Default([]) List<Package> packages,
    @Default({}) DelayMap delayMap,
    @Default([]) List<Group> groups,
    @Default(0) int checkIpNum,
    String? currentSelectedCountry,
    Brightness? brightness,
    int? runTime,
    @Default([]) List<ExternalProvider> providers,
    @Default(OrderSelectionProps()) OrderSelectionProps orderSelection,
    @Default(NetworkDetectionState())
    NetworkDetectionState networkDetectionState,
    UsageInfo? usageInfo,
    required FixedList<Connection> requests,
    required int version,
    required String deviceSerialNumber,
    required FixedList<Log> logs,
    required FixedList<Traffic> traffics,
    required Traffic totalTraffic,
    @Default(false) bool needApply,
  }) = _AppState;
}

extension AppStateExt on AppState {
  // ViewMode get viewMode => utils.getViewMode(viewSize.width);

  bool get isStart => runTime != null;
}
