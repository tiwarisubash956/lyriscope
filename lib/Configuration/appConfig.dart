// lib/core/config/app_config.dart

import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;

class AppConfig {
  static const String developmentBaseUrl = 'https://localhost:7161/api/';
  static const String stagingBaseUrl = 'https://staging.api.example.com';
  static const String productionBaseUrl = 'https://192.168.100.11:7161/api/';

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
