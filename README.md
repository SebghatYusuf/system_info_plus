# system_info_plus

A Flutter plugin to get device Random Access Memory (RAM) size.

## Getting Started

This project is a starting point for a Flutter
[plug-in package](https://flutter.dev/developing-packages/),
a specialized package that includes platform-specific implementation code for
Android and/or iOS.

## How to use?

**Basic example:**

Step 1:

```dart
import 'package:system_info_plus/system_info_plus.dart';
```

Step 2:

```dart
void getDeviceMemory() async {
    int? deviceMemory = await SystemInfoPlus.physicalMemory; // returns in MB
}
```
