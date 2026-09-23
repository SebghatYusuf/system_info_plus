import Flutter
import UIKit

public class SystemInfoPlusPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "dev/system_info_plus", binaryMessenger: registrar.messenger())
    let instance = SystemInfoPlusPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    if call.method == "getPlatformVersion" {
      result("iOS " + UIDevice.current.systemVersion)
    } else if call.method == "getMemorySpace" {
      let memory: Int = getMemorySize()
      result(memory)
    }
  }

  // Returns random access memory size in megabytes
  private func getMemorySize() -> Int {
    let memory = Int(ProcessInfo.processInfo.physicalMemory)
    let constant = 1_048_576
    let res = memory / constant
    return Int(res)
  }
}
