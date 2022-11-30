import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_components_method_channel.dart';

abstract class FlutterComponentsPlatform extends PlatformInterface {
  /// Constructs a FlutterComponentsPlatform.
  FlutterComponentsPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterComponentsPlatform _instance = MethodChannelFlutterComponents();

  /// The default instance of [FlutterComponentsPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterComponents].
  static FlutterComponentsPlatform get instance => _instance;
  
  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterComponentsPlatform] when
  /// they register themselves.
  static set instance(FlutterComponentsPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
