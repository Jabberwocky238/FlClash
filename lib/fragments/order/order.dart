import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jw_clash/common/common.dart';
import 'package:jw_clash/enum/enum.dart';
import 'package:jw_clash/models/models.dart';
import 'package:jw_clash/providers/providers.dart';
import 'package:jw_clash/state.dart';
import 'package:jw_clash/widgets/widgets.dart';
import 'package:flutter/material.dart';

Future<void> fetchOrders() async {
  final url = "$baseUrl/fetch_all_orders";
  if (profile == null) {
    profile = await Profile.fromJWCLash(url: url).update();
  } else {
    profile = await profile.copyWith(url: url).update();
  }
  // printMessage("profile: $profile");
  await globalState.appController.setProfileAndAutoApply(profile);
  _ref.read(currentProfileIdProvider.notifier).value = profile.id;
  printMessage("switch to ${profile.url}");
}
