import 'dart:io';

import 'package:jw_clash/plugins/app.dart';
import 'package:jw_clash/state.dart';

class Android {
  init() async {
    app?.onExit = () async {
      await globalState.appController.savePreferences();
    };
  }
}

final android = Platform.isAndroid ? Android() : null;
