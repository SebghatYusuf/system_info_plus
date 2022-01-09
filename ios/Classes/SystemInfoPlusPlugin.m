#import "SystemInfoPlusPlugin.h"
#if __has_include(<system_info_plus/system_info_plus-Swift.h>)
#import <system_info_plus/system_info_plus-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "system_info_plus-Swift.h"
#endif

@implementation SystemInfoPlusPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftSystemInfoPlusPlugin registerWithRegistrar:registrar];
}
@end
