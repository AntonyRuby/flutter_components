import 'package:flutter/material.dart';
import 'package:flutter_components/widget/flutter_api_loading/ball_pulse.dart';
import 'package:flutter_components/widget/flutter_api_loading/circular_indicator.dart';
import 'package:flutter_components/widget/flutter_api_loading/decorate.dart';
import 'package:flutter_components/widget/flutter_api_loading/dotted_indicator.dart';
import 'package:flutter_components/widget/flutter_api_loading/linear_indicator.dart';

enum Indicator {
  ballPulse,
  linearIndicator,
  circularIndicator,
  dottedIndicator,
}

class LoadingIndicator extends StatelessWidget {
  /// Indicate which type.
  final Indicator indicatorType;
  final double? progressValue;

  /// The color you draw on the shape.
  final List<Color>? colors;
  final Color? backgroundColor;

  /// The stroke width of line.
  final double? strokeWidth;

  /// Applicable to which has cut edge of the shape
  final Color? pathBackgroundColor;

  /// Animation status, true will pause the animation, default is false
  final bool pause;

  const LoadingIndicator({
    Key? key,
    required this.indicatorType,
    this.colors,
    this.backgroundColor,
    this.strokeWidth,
    this.progressValue,
    this.pathBackgroundColor,
    this.pause = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Color> safeColors = colors == null || colors!.isEmpty
        ? [Theme.of(context).primaryColor]
        : colors!;
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: DecorateContext(
        decorateData: DecorateData(
          indicator: indicatorType,
          colors: safeColors,
          strokeWidth: strokeWidth,
          pathBackgroundColor: pathBackgroundColor,
          pause: pause,
        ),
        child: Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  spreadRadius: 0.12,
                  blurRadius: 12,
                  offset: Offset(0, 4),
                  color: Color.fromRGBO(112, 114, 176, 0.12),
                )
              ]),
          child: _buildIndicator(),
        ),
      ),
    );
  }

  /// return the animation indicator.
  _buildIndicator() {
    switch (indicatorType) {
      case Indicator.ballPulse:
        return const BallPulse();
      case Indicator.circularIndicator:
        return const CircularIndicator();
      case Indicator.linearIndicator:
        return LinearIndicator(
          progressValue: progressValue,
        );
      case Indicator.dottedIndicator:
        return const DottedIndicator();
      default:
        throw Exception("no related indicator type:$indicatorType found");
    }
  }
}
