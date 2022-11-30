import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_components/flutter_components.dart';
import 'package:flutter_components/flutter_components_platform_interface.dart';
import 'package:flutter_components/flutter_components_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterComponentsPlatform 
    with MockPlatformInterfaceMixin
    implements FlutterComponentsPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterComponentsPlatform initialPlatform = FlutterComponentsPlatform.instance;

  test('$MethodChannelFlutterComponents is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterComponents>());
  });

  test('getPlatformVersion', () async {
    FlutterComponents flutterComponentsPlugin = FlutterComponents();
    MockFlutterComponentsPlatform fakePlatform = MockFlutterComponentsPlatform();
    FlutterComponentsPlatform.instance = fakePlatform;
  
    expect(await flutterComponentsPlugin.getPlatformVersion(), '42');
  });
}
