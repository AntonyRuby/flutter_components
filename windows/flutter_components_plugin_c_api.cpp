#include "include/flutter_components/flutter_components_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "flutter_components_plugin.h"

void FlutterComponentsPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  flutter_components::FlutterComponentsPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
