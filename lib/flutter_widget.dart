import 'package:flutter/material.dart';
import 'package:flutter_components/widget/flutter_loading.dart';

// ignore: must_be_immutable
class FlutterWidgetState extends StatelessWidget {
  FlutterWidgetState({Key? key, required this.child, required this.isLoading});

  Widget child;
  bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if (isLoading) FlutterLoading(backgroundColor: Colors.black54)
      ],
    );
  }
}
