import 'package:jw_clash/common/common.dart';
import 'package:jw_clash/models/models.dart';
import 'package:jw_clash/state.dart';

void printMessage(String message) {
  commonPrint.log("[Api] $message");
}

class ApiController {
  ApiController();

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

  sendCode(String email) async {
    if (email.isEmpty) {
      throw Exception("email cannot be empty");
    }
    return await request.post(
      "$baseUrl/auth/sendcode",
      {"email": email},
    );
  }

  register(String email, String password, String code) async {
    if (email.isEmpty || password.isEmpty || code.isEmpty) {
      throw Exception("email, password, code cannot be empty");
    }
    return await request.post(
      "$baseUrl/auth/register",
      {"email": email, "password": password, "code": code},
    );
  }

  Future<AuthProps?> login(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      throw Exception("email, password cannot be empty");
    }
    final response = await request.post(
      "$baseUrl/auth/token",
      {"email": email, "password": password},
    );
    commonPrint.log("[ApiController] login response: ${response.data}");
    final token = response.data['token'] as String?;
    final expiresAt = response.data['expired_at'] as String?;
    final expiresAtDate = DateTime.parse(expiresAt!);
    final usageAmount = response.data['usage_amount'] as int?;
    final totalAmount = response.data['total_amount'] as int?;
    if (token == null || token.isEmpty) {
      throw Exception("login failed");
    }
    // commonPrint.log("[ApiController] login success: $expiresAt");
    return AuthProps(
      email: email,
      password: password,
      token: token,
      expiresAt: expiresAtDate,
      usageAmount: usageAmount?.toInt(),
      totalAmount: totalAmount?.toInt(),
    );
  }

  Future<List<OrderCommonProps>> fetchOrders() async {
    final response = await request.get(
      "$baseUrl/alipay/fetch_all_orders",
      {},
    );
    if (response.data != null) {
      final orders = <OrderCommonProps>[
        ...response.data.map((e) => OrderCommonProps(
              orderType: e["order_type"],
              name: e["name"],
              price: "${e["price"]}",
            ))
      ];
      return orders;
    }
    throw Exception("fetch orders failed");
  }

  Future<Profile> fetchProfile(String? token) async {
    final url = "$baseUrl/auth/fetch_config${token == null || token.isEmpty ? "" : "?token=$token"}";
    final response = await request.getFileResponseForUrl(url);
    // final disposition = response.headers.value("content-disposition");
    final userinfo = response.headers.value('subscription-userinfo');
    return await Profile(
      label: defaultJWClashProfileLabel,
      url: url,
      id: defaultJWClashProfileId,
      autoUpdateDuration: defaultUpdateDuration,
      subscriptionInfo: SubscriptionInfo.formHString(userinfo),
    ).saveFile(response.data);
  }

  recordUsage(String token, int usage) async {
    final response = await request.post(
      "$baseUrl/auth/record_usage",
      {"token": token, "usage": usage},
    );
    return response.data;
  }
}

final api = ApiController();
