import 'dart:async';

import 'package:flutter/services.dart';

/// [SystemInfoPlus] is to get the running device information.
class SystemInfoPlus {
  static const MethodChannel _channel = MethodChannel('dev/system_info_plus');

  /// Returns an [int] device physical memory in Megabytes
  static Future<int?> get physicalMemory async {
    final int? ramSize = await _channel.invokeMethod('getMemorySpace');
    return ramSize;
  }
}
