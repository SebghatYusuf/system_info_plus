import 'dart:async';

import 'package:flutter/services.dart';

class SystemInfoPlus {
  static const MethodChannel _channel = MethodChannel('dev/system_info_plus');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<int?> get systemMemory async {
    final int? ramSize = await _channel.invokeMethod('getMemorySpace');
    return ramSize;
  }
}
