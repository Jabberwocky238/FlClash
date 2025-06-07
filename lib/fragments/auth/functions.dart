import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jw_clash/common/common.dart';
import 'package:jw_clash/enum/enum.dart';
import 'package:jw_clash/models/config.dart';
import 'package:jw_clash/providers/providers.dart';
import 'package:jw_clash/state.dart';
import 'package:jw_clash/widgets/widgets.dart';
import 'package:flutter/material.dart';

Future<void> login(AuthProps authProps) async {
  final response = await request.post(
    "$baseUrl/token",
    {
      "email": authProps.email,
      "password": authProps.password,
    },
  );

  if (response.statusCode == 200) {
    globalState.showNotifier("登录成功");
  }
  else {
    globalState.showNotifier("登录失败");
  }
}

Future<void> register(AuthProps authProps) async {
  request.post(
    "$baseUrl/register",
    {
      "email": authProps.email,
      "password": authProps.password,
    },
  );
  final value = await globalState.showCommonDialog<String>(
    child: InputDialog(
      title: appLocalizations.pleaseEnterEmailVerificationCode,
      value: "333444",
      suffixText: "",
      resetValue: "",
    ),
  );
  try {
    final response = await request.post(
      "$baseUrl/verify",
      {
        "email": authProps.email,
        "code": value,
      },
    );
    final code = response.data["code"];
    switch (code) {
      case 200:
        globalState.showNotifier(appLocalizations.registerSuccess);
        break;
      case 450:
        globalState.showNotifier(appLocalizations.registerEmailExists);
        break;
      default:
        globalState.showNotifier(appLocalizations.registerFailed);
        break;
    }
  } catch (e) {
    // commonPrint.log("e: $e");
    globalState.showNotifier(appLocalizations.registerFailed);
  } 
}