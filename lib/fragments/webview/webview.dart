import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jw_clash/providers/providers.dart';

import 'mobile.dart';
import 'windows.dart';

class WebViewFragment extends ConsumerStatefulWidget {
  const WebViewFragment({super.key});

  @override
  ConsumerState<WebViewFragment> createState() => _WebViewFragmentState();
}

class _WebViewFragmentState extends ConsumerState<WebViewFragment> {

  @override
  Widget build(BuildContext context) {
    if (Platform.isWindows) {
      return WindowsWebViewAdapter();
    } else {
      return MobileWebViewAdapter();
    } 
  }
}
