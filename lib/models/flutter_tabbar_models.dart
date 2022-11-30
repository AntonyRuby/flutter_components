import 'package:flutter/material.dart';

class FlutterTabbarModels {
  String? title;
  IconData? prefixIcon;
  IconData? suffixIcon;
  bool isEnable;

  FlutterTabbarModels({
    this.title,
    this.prefixIcon,
    this.suffixIcon,
    this.isEnable = true,
  });
}
