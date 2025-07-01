import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:jw_clash/common/common.dart';
import 'package:jw_clash/models/models.dart';
import 'package:jw_clash/state.dart';
import 'package:flutter/cupertino.dart';

class Request {
  late final Dio _dio;
  late final Dio _clashDio;
  late final EnzymeRequest enzyme;
  String? userAgent;

  Request() {
    _dio = Dio(
      BaseOptions(
        headers: {
          "User-Agent": browserUa,
        },
      ),
    );
    enzyme = EnzymeRequest.of(_dio);
    _clashDio = Dio();
    _clashDio.httpClientAdapter = IOHttpClientAdapter(createHttpClient: () {
      final client = HttpClient();
      client.findProxy = (Uri uri) {
        client.userAgent = globalState.ua;
        return FlClashHttpOverrides.handleFindProxy(uri);
      };
      return client;
    });
  }

  Future<Response> getFileResponseForUrl(String url) async {
    final response = await _clashDio.get(
      url,
      options: Options(
        responseType: ResponseType.bytes,
      ),
    );
    return response;
  }

  Future<MemoryImage?> getImage(String url) async {
    if (url.isEmpty) return null;
    final response = await _dio.get<Uint8List>(
      url,
      options: Options(
        responseType: ResponseType.bytes,
      ),
    );
    final data = response.data;
    if (data == null) return null;
    return MemoryImage(data);
  }

  Future<Map<String, dynamic>?> checkForUpdate() async {
    try {
      final response = await _dio.get(
        "https://api.github.com/repos/$repository/releases/latest",
        options: Options(
          responseType: ResponseType.json,
        ),
      );
      if (response.statusCode != 200) return null;
      final data = response.data as Map<String, dynamic>;
      final remoteVersion = data['tag_name'];
      final version = globalState.packageInfo.version;
      final hasUpdate =
          utils.compareVersions(remoteVersion.replaceAll('v', ''), version) > 0;
      if (!hasUpdate) return null;
      return data;
    } catch (e) {
      commonPrint.log("[Request] checkForUpdate error");
      return null;
    }
  }

  final Map<String, IpInfo Function(Map<String, dynamic>)> _ipInfoSources = {
    "https://ipwho.is/": IpInfo.fromIpwhoIsJson,
    "https://api.ip.sb/geoip/": IpInfo.fromIpSbJson,
    "https://ipapi.co/json/": IpInfo.fromIpApiCoJson,
    "https://ipinfo.io/json/": IpInfo.fromIpInfoIoJson,
  };

  Future<IpInfo?> checkIp({CancelToken? cancelToken}) async {
    for (final source in _ipInfoSources.entries) {
      try {
        final response = await Dio()
            .get<Map<String, dynamic>>(
              source.key,
              cancelToken: cancelToken,
              options: Options(
                responseType: ResponseType.json,
              ),
            )
            .timeout(
              Duration(
                seconds: 30,
              ),
            );
        if (response.statusCode != 200 || response.data == null) {
          continue;
        }
        if (response.data == null) {
          continue;
        }
        return source.value(response.data!);
      } catch (e) {
        commonPrint.log("checkIp error ===> $e");
        if (e is DioException && e.type == DioExceptionType.cancel) {
          throw "cancelled";
        }
      }
    }
    return null;
  }

  Future<bool> pingHelper() async {
    try {
      final response = await _dio
          .get(
            "http://$localhost:$helperPort/ping",
            options: Options(
              responseType: ResponseType.plain,
            ),
          )
          .timeout(
            const Duration(
              milliseconds: 2000,
            ),
          );
      if (response.statusCode != HttpStatus.ok) {
        return false;
      }
      return (response.data as String) == globalState.coreSHA256;
    } catch (_) {
      return false;
    }
  }

  Future<bool> startCoreByHelper(String arg) async {
    try {
      final response = await _dio
          .post(
            "http://$localhost:$helperPort/start",
            data: json.encode({
              "path": appPath.corePath,
              "arg": arg,
            }),
            options: Options(
              responseType: ResponseType.plain,
            ),
          )
          .timeout(
            const Duration(
              milliseconds: 2000,
            ),
          );
      if (response.statusCode != HttpStatus.ok) {
        return false;
      }
      final data = response.data as String;
      return data.isEmpty;
    } catch (_) {
      return false;
    }
  }

  Future<bool> stopCoreByHelper() async {
    try {
      final response = await _dio
          .post(
            "http://$localhost:$helperPort/stop",
            options: Options(
              responseType: ResponseType.plain,
            ),
          )
          .timeout(
            const Duration(
              milliseconds: 2000,
            ),
          );
      if (response.statusCode != HttpStatus.ok) {
        return false;
      }
      final data = response.data as String;
      return data.isEmpty;
    } catch (_) {
      return false;
    }
  }
}

final request = Request();

class EnzymeRequest {
  late final Dio _dio;

  EnzymeRequest.of(Dio dio) {
    _dio = dio;
  }

  // 设置通用请求头
  void _setHeaders(Map<String, String> headers) {
    headers['X-Enzyme-Device-Fingerprint'] = globalState.deviceFingerprint;
    headers['X-Enzyme-Token'] = globalState.config.authProps.token ?? "";
  }

  // auth/pre_register post接收参数：无。返回token
  Future<String?> preRegister() async {
    final headers = <String, String>{};
    _setHeaders(headers);

    final response = await _dio.post(
      '$baseUrl/auth/pre_register',
      options: Options(headers: headers),
    );

    if (response.statusCode == 200 && response.data != null) {
      return response.data['token'] as String;
    }
    return null;
  }

  // auth/register post接受参数：邮箱，密码，邮箱验证码
  Future<bool> register(
      String email, String password, String verificationCode) async {
    final headers = <String, String>{};
    _setHeaders(headers);

    final response = await _dio.post(
      '$baseUrl/auth/register',
      data: {
        'email': email,
        'password': password,
        'verify_code': verificationCode,
      },
      options: Options(headers: headers),
    );

    return response.statusCode == 200;
  }

  // auth/login post接受参数：邮箱，密码
  Future<String?> login(String email, String password) async {
    final headers = <String, String>{};
    _setHeaders(headers);

    final response = await _dio.post(
      '$baseUrl/auth/login',
      data: {
        'email': email,
        'password': password,
      },
      options: Options(headers: headers),
    );

    return response.data['token'] as String?;
  }

  // auth/logout post接受参数：无
  Future<bool> logout() async {
    try {
      final headers = <String, String>{};
      _setHeaders(headers);

      final response = await _dio.post(
        '$baseUrl/auth/logout',
        options: Options(headers: headers),
      );

      return response.statusCode == 200;
    } catch (e) {
      commonPrint.log("[EnzymeRequest] logout error: $e");
      return false;
    }
  }

  // auth/send_code post接受参数：邮箱
  Future<bool> sendCode(String email) async {
    try {
      final headers = <String, String>{};
      _setHeaders(headers);

      final response = await _dio.post(
        '$baseUrl/auth/send_code',
        data: {
          'email': email,
        },
        options: Options(headers: headers),
      );

      return response.statusCode == 200;
    } catch (e) {
      commonPrint.log("[EnzymeRequest] sendCode error: $e");
      return false;
    }
  }

  // auth/heartbeat get接受参数：无
  Future<bool> heartbeat() async {
    try {
      final headers = <String, String>{};
      _setHeaders(headers);

      final response = await _dio.get(
        '$baseUrl/auth/heartbeat',
        options: Options(headers: headers),
      );

      return response.statusCode == 200;
    } catch (e) {
      commonPrint.log("[EnzymeRequest] heartbeat error: $e");
      return false;
    }
  }

  // auth/remake_pswd post接受参数：邮箱，邮箱验证码，新密码
  Future<bool> remakePassword(
      String email, String verificationCode, String newPassword) async {
    try {
      final headers = <String, String>{};
      _setHeaders(headers);

      final response = await _dio.post(
        '$baseUrl/auth/remake_pswd',
        data: {
          'email': email,
          'verification_code': verificationCode,
          'new_password': newPassword,
        },
        options: Options(headers: headers),
      );

      return response.statusCode == 200;
    } catch (e) {
      commonPrint.log("[EnzymeRequest] remakePassword error: $e");
      return false;
    }
  }

  // pay/query get接受参数：用户唯一id，获取用户订阅状态
  Future<UsageInfo?> querySubscription() async {
    try {
      final headers = <String, String>{};
      _setHeaders(headers);

      final response = await _dio.get(
        '$baseUrl/pay/query',
        options: Options(headers: headers),
      );

      if (response.statusCode == 200 && response.data != null) {
        final expiredAt = response.data['expired_at'] as String;
        return UsageInfo(
          expireAt: DateTime.parse(expiredAt),
          used: response.data['usage_amount'] as int,
          total: response.data['total_amount'] as int,
        );
      }
      return null;
    } catch (e) {
      commonPrint.log("[EnzymeRequest] querySubscription error: $e");
      return null;
    }
  }

  // pay/order/list get接受参数：无。返回订单列表
  Future<List<OrderCommonProps>?> getOrderTypes() async {
    try {
      final headers = <String, String>{};
      _setHeaders(headers);

      final response = await _dio.get(
        '$baseUrl/pay/ordertypes',
        options: Options(headers: headers),
      );

      if (response.statusCode == 200 && response.data != null) {
        final List<dynamic> data =
            response.data['order_types'] as List<dynamic>;
        commonPrint.log("[EnzymeRequest] getOrderList data: $data");
        return data
            .map((e) => OrderCommonProps(
                  orderType: e['order_type'] as String,
                  name: e['name'] as String,
                  price: (e['price'] as int).toString(),
                ))
            .toList();
      }
      return null;
    } catch (e) {
      commonPrint.log("[EnzymeRequest] getOrderList error: $e");
      return null;
    }
  }

  // pay/alipay/create post接受参数：订单唯一id，用户唯一id
  Future<String?> createAlipayOrder(String orderType) async {
    try {
      final headers = <String, String>{};
      _setHeaders(headers);

      final isMobile = Platform.isAndroid || Platform.isIOS;
      commonPrint.log("[EnzymeRequest] createAlipayOrder isMobile: $isMobile");
      final response = await _dio.post(
        '$baseUrl/pay/alipay/create',
        data: {
          'order_type': orderType,
          'is_mobile': isMobile,
        },
        options: Options(headers: headers),
      );

      if (response.statusCode == 200 && response.data != null) {
        return response.data['payment_url'] as String;
      }
      return null;
    } catch (e) {
      commonPrint.log("[EnzymeRequest] createAlipayOrder error: $e");
      return null;
    }
  }

  // config/fetch get接受参数：国家代号
  Future<Profile?> fetchProfile(String? countryCode) async {
    try {
      final headers = <String, String>{};
      _setHeaders(headers);

      final response = await _dio.get(
        '$baseUrl/config/fetch',
        queryParameters: {
          'country_code': countryCode ?? "auto",
        },
        options: Options(headers: headers),
      );
      if (response.statusCode == 200 && response.data != null) {
        final bytes = response.data as String;
        commonPrint.log("[EnzymeRequest] fetchProfile bytes: $bytes");
        return Profile(
          id: defaultJWClashProfileId,
          label: defaultJWClashProfileLabel,
          url: '',
          autoUpdate: false,
          autoUpdateDuration: defaultUpdateDuration,
        ).saveFileWithString(bytes);
      }
      return null;
    } catch (e) {
      commonPrint.log(
          "[EnzymeRequest] fetchConfig error: $e, countryCode: $countryCode");
      return null;
    }
  }

  // config/country_list get接受参数：无。返回所有可用国家
  Future<List<String>?> getCountryList() async {
    try {
      final headers = <String, String>{};
      _setHeaders(headers);

      final response = await _dio.get(
        '$baseUrl/config/country_list',
        options: Options(headers: headers),
      );

      if (response.statusCode == 200 && response.data != null) {
        final List<dynamic> data = response.data['countries'] as List<dynamic>;
        return data.cast<String>();
      }
      return null;
    } catch (e) {
      commonPrint.log("[EnzymeRequest] getCountryList error: $e");
      return null;
    }
  }
}
