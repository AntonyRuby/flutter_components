
import 'flutter_components_platform_interface.dart';

class FlutterComponents {
  Future<String?> getPlatformVersion() {
    return FlutterComponentsPlatform.instance.getPlatformVersion();
  }
}
