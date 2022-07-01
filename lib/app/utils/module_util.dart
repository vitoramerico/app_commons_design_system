import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:io' show Platform;

class ModuleUtil {
  ModuleUtil._();

  static bool get isAndroid {
    if (kIsWeb) return false;

    return Platform.isAndroid;
  }
}
