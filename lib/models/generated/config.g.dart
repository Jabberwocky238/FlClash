// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppSettingPropsImpl _$$AppSettingPropsImplFromJson(
        Map<String, dynamic> json) =>
    _$AppSettingPropsImpl(
      locale: json['locale'] as String?,
      onlyStatisticsProxy: json['onlyStatisticsProxy'] as bool? ?? false,
      autoLaunch: json['autoLaunch'] as bool? ?? false,
      silentLaunch: json['silentLaunch'] as bool? ?? false,
      autoRun: json['autoRun'] as bool? ?? false,
      closeConnections: json['closeConnections'] as bool? ?? true,
      testUrl: json['testUrl'] as String? ?? defaultTestUrl,
      isAnimateToPage: json['isAnimateToPage'] as bool? ?? true,
      autoCheckUpdate: json['autoCheckUpdate'] as bool? ?? true,
      showLabel: json['showLabel'] as bool? ?? false,
      disclaimerAccepted: json['disclaimerAccepted'] as bool? ?? false,
      minimizeOnExit: json['minimizeOnExit'] as bool? ?? true,
      hidden: json['hidden'] as bool? ?? false,
      developerMode: json['developerMode'] as bool? ?? true,
      recoveryStrategy: $enumDecodeNullable(
              _$RecoveryStrategyEnumMap, json['recoveryStrategy']) ??
          RecoveryStrategy.compatible,
    );

Map<String, dynamic> _$$AppSettingPropsImplToJson(
        _$AppSettingPropsImpl instance) =>
    <String, dynamic>{
      'locale': instance.locale,
      'onlyStatisticsProxy': instance.onlyStatisticsProxy,
      'autoLaunch': instance.autoLaunch,
      'silentLaunch': instance.silentLaunch,
      'autoRun': instance.autoRun,
      'closeConnections': instance.closeConnections,
      'testUrl': instance.testUrl,
      'isAnimateToPage': instance.isAnimateToPage,
      'autoCheckUpdate': instance.autoCheckUpdate,
      'showLabel': instance.showLabel,
      'disclaimerAccepted': instance.disclaimerAccepted,
      'minimizeOnExit': instance.minimizeOnExit,
      'hidden': instance.hidden,
      'developerMode': instance.developerMode,
      'recoveryStrategy': _$RecoveryStrategyEnumMap[instance.recoveryStrategy]!,
    };

const _$RecoveryStrategyEnumMap = {
  RecoveryStrategy.compatible: 'compatible',
  RecoveryStrategy.override: 'override',
};

_$AccessControlImpl _$$AccessControlImplFromJson(Map<String, dynamic> json) =>
    _$AccessControlImpl(
      enable: json['enable'] as bool? ?? false,
      mode: $enumDecodeNullable(_$AccessControlModeEnumMap, json['mode']) ??
          AccessControlMode.rejectSelected,
      acceptList: (json['acceptList'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      rejectList: (json['rejectList'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      sort: $enumDecodeNullable(_$AccessSortTypeEnumMap, json['sort']) ??
          AccessSortType.none,
      isFilterSystemApp: json['isFilterSystemApp'] as bool? ?? true,
      isFilterNonInternetApp: json['isFilterNonInternetApp'] as bool? ?? true,
    );

Map<String, dynamic> _$$AccessControlImplToJson(_$AccessControlImpl instance) =>
    <String, dynamic>{
      'enable': instance.enable,
      'mode': _$AccessControlModeEnumMap[instance.mode]!,
      'acceptList': instance.acceptList,
      'rejectList': instance.rejectList,
      'sort': _$AccessSortTypeEnumMap[instance.sort]!,
      'isFilterSystemApp': instance.isFilterSystemApp,
      'isFilterNonInternetApp': instance.isFilterNonInternetApp,
    };

const _$AccessControlModeEnumMap = {
  AccessControlMode.acceptSelected: 'acceptSelected',
  AccessControlMode.rejectSelected: 'rejectSelected',
};

const _$AccessSortTypeEnumMap = {
  AccessSortType.none: 'none',
  AccessSortType.name: 'name',
  AccessSortType.time: 'time',
};

_$WindowPropsImpl _$$WindowPropsImplFromJson(Map<String, dynamic> json) =>
    _$WindowPropsImpl(
      top: (json['top'] as num?)?.toDouble(),
      left: (json['left'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$WindowPropsImplToJson(_$WindowPropsImpl instance) =>
    <String, dynamic>{
      'top': instance.top,
      'left': instance.left,
    };

_$VpnPropsImpl _$$VpnPropsImplFromJson(Map<String, dynamic> json) =>
    _$VpnPropsImpl(
      enable: json['enable'] as bool? ?? true,
      systemProxy: json['systemProxy'] as bool? ?? true,
      ipv6: json['ipv6'] as bool? ?? false,
      allowBypass: json['allowBypass'] as bool? ?? true,
      accessControl: json['accessControl'] == null
          ? defaultAccessControl
          : AccessControl.fromJson(
              json['accessControl'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$VpnPropsImplToJson(_$VpnPropsImpl instance) =>
    <String, dynamic>{
      'enable': instance.enable,
      'systemProxy': instance.systemProxy,
      'ipv6': instance.ipv6,
      'allowBypass': instance.allowBypass,
      'accessControl': instance.accessControl,
    };

_$NetworkPropsImpl _$$NetworkPropsImplFromJson(Map<String, dynamic> json) =>
    _$NetworkPropsImpl(
      systemProxy: json['systemProxy'] as bool? ?? true,
      bypassDomain: (json['bypassDomain'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          defaultBypassDomain,
      routeMode: $enumDecodeNullable(_$RouteModeEnumMap, json['routeMode']) ??
          RouteMode.bypassPrivate,
    );

Map<String, dynamic> _$$NetworkPropsImplToJson(_$NetworkPropsImpl instance) =>
    <String, dynamic>{
      'systemProxy': instance.systemProxy,
      'bypassDomain': instance.bypassDomain,
      'routeMode': _$RouteModeEnumMap[instance.routeMode]!,
    };

const _$RouteModeEnumMap = {
  RouteMode.bypassPrivate: 'bypassPrivate',
  RouteMode.config: 'config',
};

_$ThemePropsImpl _$$ThemePropsImplFromJson(Map<String, dynamic> json) =>
    _$ThemePropsImpl(
      themeMode: $enumDecodeNullable(_$ThemeModeEnumMap, json['themeMode']) ??
          ThemeMode.dark,
    );

Map<String, dynamic> _$$ThemePropsImplToJson(_$ThemePropsImpl instance) =>
    <String, dynamic>{
      'themeMode': _$ThemeModeEnumMap[instance.themeMode]!,
    };

const _$ThemeModeEnumMap = {
  ThemeMode.system: 'system',
  ThemeMode.light: 'light',
  ThemeMode.dark: 'dark',
};

_$ConfigImpl _$$ConfigImplFromJson(Map<String, dynamic> json) => _$ConfigImpl(
      appSetting: json['appSetting'] == null
          ? defaultAppSettingProps
          : AppSettingProps.safeFromJson(
              json['appSetting'] as Map<String, Object?>?),
      profiles: (json['profiles'] as List<dynamic>?)
              ?.map((e) => Profile.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      currentProfileId: json['currentProfileId'] as String?,
      overrideDns: json['overrideDns'] as bool? ?? false,
      authProps: json['authProps'] == null
          ? defaultAuthProps
          : AuthProps.fromJson(json['authProps'] as Map<String, dynamic>),
      networkProps: json['networkProps'] == null
          ? defaultNetworkProps
          : NetworkProps.fromJson(
              json['networkProps'] as Map<String, dynamic>?),
      vpnProps: json['vpnProps'] == null
          ? defaultVpnProps
          : VpnProps.fromJson(json['vpnProps'] as Map<String, dynamic>?),
      themeProps:
          ThemeProps.safeFromJson(json['themeProps'] as Map<String, Object?>?),
      windowProps: json['windowProps'] == null
          ? defaultWindowProps
          : WindowProps.fromJson(json['windowProps'] as Map<String, dynamic>?),
      patchClashConfig: json['patchClashConfig'] == null
          ? defaultClashConfig
          : ClashConfig.fromJson(
              json['patchClashConfig'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ConfigImplToJson(_$ConfigImpl instance) =>
    <String, dynamic>{
      'appSetting': instance.appSetting,
      'profiles': instance.profiles,
      'currentProfileId': instance.currentProfileId,
      'overrideDns': instance.overrideDns,
      'authProps': instance.authProps,
      'networkProps': instance.networkProps,
      'vpnProps': instance.vpnProps,
      'themeProps': instance.themeProps,
      'windowProps': instance.windowProps,
      'patchClashConfig': instance.patchClashConfig,
    };
