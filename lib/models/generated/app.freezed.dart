// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../app.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AppState {
  bool get isInit => throw _privateConstructorUsedError;
  PageLabel get pageLabel => throw _privateConstructorUsedError;
  List<Package> get packages => throw _privateConstructorUsedError;
  Map<String, Map<String, int?>> get delayMap =>
      throw _privateConstructorUsedError;
  List<Group> get groups => throw _privateConstructorUsedError;
  int get checkIpNum => throw _privateConstructorUsedError;
  String? get currentSelectedCountry => throw _privateConstructorUsedError;
  Brightness? get brightness => throw _privateConstructorUsedError;
  int? get runTime => throw _privateConstructorUsedError;
  List<ExternalProvider> get providers => throw _privateConstructorUsedError;
  OrderSelectionProps get orderSelection => throw _privateConstructorUsedError;
  NetworkDetectionState get networkDetectionState =>
      throw _privateConstructorUsedError;
  UsageInfo? get usageInfo => throw _privateConstructorUsedError;
  FixedList<Connection> get requests => throw _privateConstructorUsedError;
  int get version => throw _privateConstructorUsedError;
  String get deviceSerialNumber => throw _privateConstructorUsedError;
  FixedList<Log> get logs => throw _privateConstructorUsedError;
  FixedList<Traffic> get traffics => throw _privateConstructorUsedError;
  Traffic get totalTraffic => throw _privateConstructorUsedError;
  bool get needApply => throw _privateConstructorUsedError;

  /// Create a copy of AppState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppStateCopyWith<AppState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppStateCopyWith<$Res> {
  factory $AppStateCopyWith(AppState value, $Res Function(AppState) then) =
      _$AppStateCopyWithImpl<$Res, AppState>;
  @useResult
  $Res call(
      {bool isInit,
      PageLabel pageLabel,
      List<Package> packages,
      Map<String, Map<String, int?>> delayMap,
      List<Group> groups,
      int checkIpNum,
      String? currentSelectedCountry,
      Brightness? brightness,
      int? runTime,
      List<ExternalProvider> providers,
      OrderSelectionProps orderSelection,
      NetworkDetectionState networkDetectionState,
      UsageInfo? usageInfo,
      FixedList<Connection> requests,
      int version,
      String deviceSerialNumber,
      FixedList<Log> logs,
      FixedList<Traffic> traffics,
      Traffic totalTraffic,
      bool needApply});

  $OrderSelectionPropsCopyWith<$Res> get orderSelection;
  $NetworkDetectionStateCopyWith<$Res> get networkDetectionState;
  $UsageInfoCopyWith<$Res>? get usageInfo;
}

/// @nodoc
class _$AppStateCopyWithImpl<$Res, $Val extends AppState>
    implements $AppStateCopyWith<$Res> {
  _$AppStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isInit = null,
    Object? pageLabel = null,
    Object? packages = null,
    Object? delayMap = null,
    Object? groups = null,
    Object? checkIpNum = null,
    Object? currentSelectedCountry = freezed,
    Object? brightness = freezed,
    Object? runTime = freezed,
    Object? providers = null,
    Object? orderSelection = null,
    Object? networkDetectionState = null,
    Object? usageInfo = freezed,
    Object? requests = null,
    Object? version = null,
    Object? deviceSerialNumber = null,
    Object? logs = null,
    Object? traffics = null,
    Object? totalTraffic = null,
    Object? needApply = null,
  }) {
    return _then(_value.copyWith(
      isInit: null == isInit
          ? _value.isInit
          : isInit // ignore: cast_nullable_to_non_nullable
              as bool,
      pageLabel: null == pageLabel
          ? _value.pageLabel
          : pageLabel // ignore: cast_nullable_to_non_nullable
              as PageLabel,
      packages: null == packages
          ? _value.packages
          : packages // ignore: cast_nullable_to_non_nullable
              as List<Package>,
      delayMap: null == delayMap
          ? _value.delayMap
          : delayMap // ignore: cast_nullable_to_non_nullable
              as Map<String, Map<String, int?>>,
      groups: null == groups
          ? _value.groups
          : groups // ignore: cast_nullable_to_non_nullable
              as List<Group>,
      checkIpNum: null == checkIpNum
          ? _value.checkIpNum
          : checkIpNum // ignore: cast_nullable_to_non_nullable
              as int,
      currentSelectedCountry: freezed == currentSelectedCountry
          ? _value.currentSelectedCountry
          : currentSelectedCountry // ignore: cast_nullable_to_non_nullable
              as String?,
      brightness: freezed == brightness
          ? _value.brightness
          : brightness // ignore: cast_nullable_to_non_nullable
              as Brightness?,
      runTime: freezed == runTime
          ? _value.runTime
          : runTime // ignore: cast_nullable_to_non_nullable
              as int?,
      providers: null == providers
          ? _value.providers
          : providers // ignore: cast_nullable_to_non_nullable
              as List<ExternalProvider>,
      orderSelection: null == orderSelection
          ? _value.orderSelection
          : orderSelection // ignore: cast_nullable_to_non_nullable
              as OrderSelectionProps,
      networkDetectionState: null == networkDetectionState
          ? _value.networkDetectionState
          : networkDetectionState // ignore: cast_nullable_to_non_nullable
              as NetworkDetectionState,
      usageInfo: freezed == usageInfo
          ? _value.usageInfo
          : usageInfo // ignore: cast_nullable_to_non_nullable
              as UsageInfo?,
      requests: null == requests
          ? _value.requests
          : requests // ignore: cast_nullable_to_non_nullable
              as FixedList<Connection>,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as int,
      deviceSerialNumber: null == deviceSerialNumber
          ? _value.deviceSerialNumber
          : deviceSerialNumber // ignore: cast_nullable_to_non_nullable
              as String,
      logs: null == logs
          ? _value.logs
          : logs // ignore: cast_nullable_to_non_nullable
              as FixedList<Log>,
      traffics: null == traffics
          ? _value.traffics
          : traffics // ignore: cast_nullable_to_non_nullable
              as FixedList<Traffic>,
      totalTraffic: null == totalTraffic
          ? _value.totalTraffic
          : totalTraffic // ignore: cast_nullable_to_non_nullable
              as Traffic,
      needApply: null == needApply
          ? _value.needApply
          : needApply // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  /// Create a copy of AppState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OrderSelectionPropsCopyWith<$Res> get orderSelection {
    return $OrderSelectionPropsCopyWith<$Res>(_value.orderSelection, (value) {
      return _then(_value.copyWith(orderSelection: value) as $Val);
    });
  }

  /// Create a copy of AppState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NetworkDetectionStateCopyWith<$Res> get networkDetectionState {
    return $NetworkDetectionStateCopyWith<$Res>(_value.networkDetectionState,
        (value) {
      return _then(_value.copyWith(networkDetectionState: value) as $Val);
    });
  }

  /// Create a copy of AppState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UsageInfoCopyWith<$Res>? get usageInfo {
    if (_value.usageInfo == null) {
      return null;
    }

    return $UsageInfoCopyWith<$Res>(_value.usageInfo!, (value) {
      return _then(_value.copyWith(usageInfo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AppStateImplCopyWith<$Res>
    implements $AppStateCopyWith<$Res> {
  factory _$$AppStateImplCopyWith(
          _$AppStateImpl value, $Res Function(_$AppStateImpl) then) =
      __$$AppStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isInit,
      PageLabel pageLabel,
      List<Package> packages,
      Map<String, Map<String, int?>> delayMap,
      List<Group> groups,
      int checkIpNum,
      String? currentSelectedCountry,
      Brightness? brightness,
      int? runTime,
      List<ExternalProvider> providers,
      OrderSelectionProps orderSelection,
      NetworkDetectionState networkDetectionState,
      UsageInfo? usageInfo,
      FixedList<Connection> requests,
      int version,
      String deviceSerialNumber,
      FixedList<Log> logs,
      FixedList<Traffic> traffics,
      Traffic totalTraffic,
      bool needApply});

  @override
  $OrderSelectionPropsCopyWith<$Res> get orderSelection;
  @override
  $NetworkDetectionStateCopyWith<$Res> get networkDetectionState;
  @override
  $UsageInfoCopyWith<$Res>? get usageInfo;
}

/// @nodoc
class __$$AppStateImplCopyWithImpl<$Res>
    extends _$AppStateCopyWithImpl<$Res, _$AppStateImpl>
    implements _$$AppStateImplCopyWith<$Res> {
  __$$AppStateImplCopyWithImpl(
      _$AppStateImpl _value, $Res Function(_$AppStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isInit = null,
    Object? pageLabel = null,
    Object? packages = null,
    Object? delayMap = null,
    Object? groups = null,
    Object? checkIpNum = null,
    Object? currentSelectedCountry = freezed,
    Object? brightness = freezed,
    Object? runTime = freezed,
    Object? providers = null,
    Object? orderSelection = null,
    Object? networkDetectionState = null,
    Object? usageInfo = freezed,
    Object? requests = null,
    Object? version = null,
    Object? deviceSerialNumber = null,
    Object? logs = null,
    Object? traffics = null,
    Object? totalTraffic = null,
    Object? needApply = null,
  }) {
    return _then(_$AppStateImpl(
      isInit: null == isInit
          ? _value.isInit
          : isInit // ignore: cast_nullable_to_non_nullable
              as bool,
      pageLabel: null == pageLabel
          ? _value.pageLabel
          : pageLabel // ignore: cast_nullable_to_non_nullable
              as PageLabel,
      packages: null == packages
          ? _value._packages
          : packages // ignore: cast_nullable_to_non_nullable
              as List<Package>,
      delayMap: null == delayMap
          ? _value._delayMap
          : delayMap // ignore: cast_nullable_to_non_nullable
              as Map<String, Map<String, int?>>,
      groups: null == groups
          ? _value._groups
          : groups // ignore: cast_nullable_to_non_nullable
              as List<Group>,
      checkIpNum: null == checkIpNum
          ? _value.checkIpNum
          : checkIpNum // ignore: cast_nullable_to_non_nullable
              as int,
      currentSelectedCountry: freezed == currentSelectedCountry
          ? _value.currentSelectedCountry
          : currentSelectedCountry // ignore: cast_nullable_to_non_nullable
              as String?,
      brightness: freezed == brightness
          ? _value.brightness
          : brightness // ignore: cast_nullable_to_non_nullable
              as Brightness?,
      runTime: freezed == runTime
          ? _value.runTime
          : runTime // ignore: cast_nullable_to_non_nullable
              as int?,
      providers: null == providers
          ? _value._providers
          : providers // ignore: cast_nullable_to_non_nullable
              as List<ExternalProvider>,
      orderSelection: null == orderSelection
          ? _value.orderSelection
          : orderSelection // ignore: cast_nullable_to_non_nullable
              as OrderSelectionProps,
      networkDetectionState: null == networkDetectionState
          ? _value.networkDetectionState
          : networkDetectionState // ignore: cast_nullable_to_non_nullable
              as NetworkDetectionState,
      usageInfo: freezed == usageInfo
          ? _value.usageInfo
          : usageInfo // ignore: cast_nullable_to_non_nullable
              as UsageInfo?,
      requests: null == requests
          ? _value.requests
          : requests // ignore: cast_nullable_to_non_nullable
              as FixedList<Connection>,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as int,
      deviceSerialNumber: null == deviceSerialNumber
          ? _value.deviceSerialNumber
          : deviceSerialNumber // ignore: cast_nullable_to_non_nullable
              as String,
      logs: null == logs
          ? _value.logs
          : logs // ignore: cast_nullable_to_non_nullable
              as FixedList<Log>,
      traffics: null == traffics
          ? _value.traffics
          : traffics // ignore: cast_nullable_to_non_nullable
              as FixedList<Traffic>,
      totalTraffic: null == totalTraffic
          ? _value.totalTraffic
          : totalTraffic // ignore: cast_nullable_to_non_nullable
              as Traffic,
      needApply: null == needApply
          ? _value.needApply
          : needApply // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$AppStateImpl implements _AppState {
  const _$AppStateImpl(
      {this.isInit = false,
      this.pageLabel = PageLabel.dashboard,
      final List<Package> packages = const [],
      final Map<String, Map<String, int?>> delayMap = const {},
      final List<Group> groups = const [],
      this.checkIpNum = 0,
      this.currentSelectedCountry,
      this.brightness,
      this.runTime,
      final List<ExternalProvider> providers = const [],
      this.orderSelection = const OrderSelectionProps(),
      this.networkDetectionState = const NetworkDetectionState(),
      this.usageInfo,
      required this.requests,
      required this.version,
      required this.deviceSerialNumber,
      required this.logs,
      required this.traffics,
      required this.totalTraffic,
      this.needApply = false})
      : _packages = packages,
        _delayMap = delayMap,
        _groups = groups,
        _providers = providers;

  @override
  @JsonKey()
  final bool isInit;
  @override
  @JsonKey()
  final PageLabel pageLabel;
  final List<Package> _packages;
  @override
  @JsonKey()
  List<Package> get packages {
    if (_packages is EqualUnmodifiableListView) return _packages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_packages);
  }

  final Map<String, Map<String, int?>> _delayMap;
  @override
  @JsonKey()
  Map<String, Map<String, int?>> get delayMap {
    if (_delayMap is EqualUnmodifiableMapView) return _delayMap;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_delayMap);
  }

  final List<Group> _groups;
  @override
  @JsonKey()
  List<Group> get groups {
    if (_groups is EqualUnmodifiableListView) return _groups;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_groups);
  }

  @override
  @JsonKey()
  final int checkIpNum;
  @override
  final String? currentSelectedCountry;
  @override
  final Brightness? brightness;
  @override
  final int? runTime;
  final List<ExternalProvider> _providers;
  @override
  @JsonKey()
  List<ExternalProvider> get providers {
    if (_providers is EqualUnmodifiableListView) return _providers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_providers);
  }

  @override
  @JsonKey()
  final OrderSelectionProps orderSelection;
  @override
  @JsonKey()
  final NetworkDetectionState networkDetectionState;
  @override
  final UsageInfo? usageInfo;
  @override
  final FixedList<Connection> requests;
  @override
  final int version;
  @override
  final String deviceSerialNumber;
  @override
  final FixedList<Log> logs;
  @override
  final FixedList<Traffic> traffics;
  @override
  final Traffic totalTraffic;
  @override
  @JsonKey()
  final bool needApply;

  @override
  String toString() {
    return 'AppState(isInit: $isInit, pageLabel: $pageLabel, packages: $packages, delayMap: $delayMap, groups: $groups, checkIpNum: $checkIpNum, currentSelectedCountry: $currentSelectedCountry, brightness: $brightness, runTime: $runTime, providers: $providers, orderSelection: $orderSelection, networkDetectionState: $networkDetectionState, usageInfo: $usageInfo, requests: $requests, version: $version, deviceSerialNumber: $deviceSerialNumber, logs: $logs, traffics: $traffics, totalTraffic: $totalTraffic, needApply: $needApply)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppStateImpl &&
            (identical(other.isInit, isInit) || other.isInit == isInit) &&
            (identical(other.pageLabel, pageLabel) ||
                other.pageLabel == pageLabel) &&
            const DeepCollectionEquality().equals(other._packages, _packages) &&
            const DeepCollectionEquality().equals(other._delayMap, _delayMap) &&
            const DeepCollectionEquality().equals(other._groups, _groups) &&
            (identical(other.checkIpNum, checkIpNum) ||
                other.checkIpNum == checkIpNum) &&
            (identical(other.currentSelectedCountry, currentSelectedCountry) ||
                other.currentSelectedCountry == currentSelectedCountry) &&
            (identical(other.brightness, brightness) ||
                other.brightness == brightness) &&
            (identical(other.runTime, runTime) || other.runTime == runTime) &&
            const DeepCollectionEquality()
                .equals(other._providers, _providers) &&
            (identical(other.orderSelection, orderSelection) ||
                other.orderSelection == orderSelection) &&
            (identical(other.networkDetectionState, networkDetectionState) ||
                other.networkDetectionState == networkDetectionState) &&
            (identical(other.usageInfo, usageInfo) ||
                other.usageInfo == usageInfo) &&
            (identical(other.requests, requests) ||
                other.requests == requests) &&
            (identical(other.version, version) || other.version == version) &&
            (identical(other.deviceSerialNumber, deviceSerialNumber) ||
                other.deviceSerialNumber == deviceSerialNumber) &&
            (identical(other.logs, logs) || other.logs == logs) &&
            (identical(other.traffics, traffics) ||
                other.traffics == traffics) &&
            (identical(other.totalTraffic, totalTraffic) ||
                other.totalTraffic == totalTraffic) &&
            (identical(other.needApply, needApply) ||
                other.needApply == needApply));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        isInit,
        pageLabel,
        const DeepCollectionEquality().hash(_packages),
        const DeepCollectionEquality().hash(_delayMap),
        const DeepCollectionEquality().hash(_groups),
        checkIpNum,
        currentSelectedCountry,
        brightness,
        runTime,
        const DeepCollectionEquality().hash(_providers),
        orderSelection,
        networkDetectionState,
        usageInfo,
        requests,
        version,
        deviceSerialNumber,
        logs,
        traffics,
        totalTraffic,
        needApply
      ]);

  /// Create a copy of AppState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppStateImplCopyWith<_$AppStateImpl> get copyWith =>
      __$$AppStateImplCopyWithImpl<_$AppStateImpl>(this, _$identity);
}

abstract class _AppState implements AppState {
  const factory _AppState(
      {final bool isInit,
      final PageLabel pageLabel,
      final List<Package> packages,
      final Map<String, Map<String, int?>> delayMap,
      final List<Group> groups,
      final int checkIpNum,
      final String? currentSelectedCountry,
      final Brightness? brightness,
      final int? runTime,
      final List<ExternalProvider> providers,
      final OrderSelectionProps orderSelection,
      final NetworkDetectionState networkDetectionState,
      final UsageInfo? usageInfo,
      required final FixedList<Connection> requests,
      required final int version,
      required final String deviceSerialNumber,
      required final FixedList<Log> logs,
      required final FixedList<Traffic> traffics,
      required final Traffic totalTraffic,
      final bool needApply}) = _$AppStateImpl;

  @override
  bool get isInit;
  @override
  PageLabel get pageLabel;
  @override
  List<Package> get packages;
  @override
  Map<String, Map<String, int?>> get delayMap;
  @override
  List<Group> get groups;
  @override
  int get checkIpNum;
  @override
  String? get currentSelectedCountry;
  @override
  Brightness? get brightness;
  @override
  int? get runTime;
  @override
  List<ExternalProvider> get providers;
  @override
  OrderSelectionProps get orderSelection;
  @override
  NetworkDetectionState get networkDetectionState;
  @override
  UsageInfo? get usageInfo;
  @override
  FixedList<Connection> get requests;
  @override
  int get version;
  @override
  String get deviceSerialNumber;
  @override
  FixedList<Log> get logs;
  @override
  FixedList<Traffic> get traffics;
  @override
  Traffic get totalTraffic;
  @override
  bool get needApply;

  /// Create a copy of AppState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppStateImplCopyWith<_$AppStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
