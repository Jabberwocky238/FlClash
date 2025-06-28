import 'package:jw_clash/common/common.dart';

void printMessage(String message) {
  commonPrint.log("[Auth] $message");
}

typedef AuthResult = ({bool success, String message});

