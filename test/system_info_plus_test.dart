import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:system_info_plus/system_info_plus.dart';

void main() {
  const MethodChannel channel = MethodChannel('system_info_plus');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await SystemInfoPlus.platformVersion, '42');
  });
}
