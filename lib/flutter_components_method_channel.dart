import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_components_platform_interface.dart';

/// An implementation of [FlutterComponentsPlatform] that uses method channels.
class MethodChannelFlutterComponents extends FlutterComponentsPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_components');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
