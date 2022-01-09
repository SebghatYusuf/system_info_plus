import Flutter
import UIKit

public class SwiftPluginExamplePlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "dev/system_info_plus", binaryMessenger: registrar.messenger())
    let instance = SwiftPluginExamplePlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    if (call.method == "getPlatformVersion"){
      result("iOS " + UIDevice.current.systemVersion)
    }
    else if (call.method == "getMemorySpace"){
      let memory: Int = getMemorySize()
      result(memory)
    }
   }
  // Returns random access memory size in megabytes 
  private func getMemorySize() -> Int{
      let device = UIDevice.current
      let memory : Int = Int(ProcessInfo.processInfo.physicalMemory)
      let constant : Int = 1_048_576
      let res = memory / constant
      return Int(res)
  }
}


