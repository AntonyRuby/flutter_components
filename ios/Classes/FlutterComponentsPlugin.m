#import "FlutterComponentsPlugin.h"
#if __has_include(<flutter_components/flutter_components-Swift.h>)
#import <flutter_components/flutter_components-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "flutter_components-Swift.h"
#endif

@implementation FlutterComponentsPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterComponentsPlugin registerWithRegistrar:registrar];
}
@end
