//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <fast_rsa/fast_rsa_plugin.h>
#include <flutter_components/flutter_components_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) fast_rsa_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "FastRsaPlugin");
  fast_rsa_plugin_register_with_registrar(fast_rsa_registrar);
  g_autoptr(FlPluginRegistrar) flutter_components_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "FlutterComponentsPlugin");
  flutter_components_plugin_register_with_registrar(flutter_components_registrar);
}
