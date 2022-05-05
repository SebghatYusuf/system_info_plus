import 'dart:io';

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
  int _deviceMemory = -1;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    int deviceMemory;

    try {
      deviceMemory = await SystemInfoPlus.physicalMemory ?? -1;
    } on PlatformException {
      deviceMemory = -1;
    }
    if (!mounted) return;

    setState(() {
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child:
                  Text('Random Access Memory: $_deviceMemory MB (Megabytes)'),
            ),
          ],
        ),
      ),
    );
  }
}
