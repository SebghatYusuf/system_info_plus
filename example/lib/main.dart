import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:system_info_plus/system_info_plus.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  int _deviceMemory = -1;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    int deviceMemory;

    try {
      platformVersion =
          await SystemInfoPlus.platformVersion ?? 'Unknown platform version';
      deviceMemory = await SystemInfoPlus.physicalMemory ?? -1;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
      deviceMemory = -1;
    }
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
      _deviceMemory = deviceMemory;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('System info plugin example'),
        ),
        body: Column(
          children: [
            Center(
              child: Text('Running on: $_platformVersion\n'),
            ),
            Center(
              child: Text('Random Access Memory (MB): $_deviceMemory'),
            ),
          ],
        ),
      ),
    );
  }
}
