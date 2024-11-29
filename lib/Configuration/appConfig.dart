// lib/core/config/app_config.dart

import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;

class AppConfig {
  static const String developmentBaseUrl = '';
  static const String stagingBaseUrl = '';
  static const String productionBaseUrl = '';

  static String get baseUrl {
    if (kIsWeb) {
      // Web platform
      return productionBaseUrl;
    } else if (Platform.isAndroid || Platform.isIOS) {
      // Mobile platforms
      return productionBaseUrl;
    } else if (Platform.isWindows || Platform.isMacOS || Platform.isLinux) {
      // Desktop platforms
      return developmentBaseUrl;
    } else {
      // Fallback URL for other platforms
      return productionBaseUrl;
    }
  }
}
