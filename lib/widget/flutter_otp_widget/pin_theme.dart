import 'package:flutter/material.dart';
import 'package:flutter_components/widget/flutter_otp_widget/pin_code.dart';

class FlutterPinTheme extends StatefulWidget {
  /// Colors of the input fields which have inputs. Default is [Colors.green]
  final Color? activeColor;

  /// Color of the input field which is currently selected. Default is [Colors.blue]
  final Color? selectedColor;

  /// Colors of the input fields which don't have inputs. Default is [Colors.red]
  final Color? inactiveColor;

  /// Colors of the input fields if the [PinCodeTextField] is disabled. Default is [Colors.grey]
  final Color? disabledColor;

  /// Colors of the input fields which have inputs. Default is [Colors.green]
  final Color? activeFillColor;

  /// Color of the input field which is currently selected. Default is [Colors.blue]
  final Color? selectedFillColor;

  /// Colors of the input fields which don't have inputs. Default is [Colors.red]
  final Color? inactiveFillColor;

  /// Color of the input field when in error mode. Default is [Colors.redAccent]
  final Color? errorBorderColor;
  final Color? errorColor;

  /// Border radius of each pin code field
  final BorderRadius borderRadius;

  /// [height] for the pin code field. default is [50.0]
  final double fieldHeight;

  /// [width] for the pin code field. default is [40.0]
  final double fieldWidth;

  /// Border width for the each input fields. Default is [2.0]
  final double borderWidth;

  /// this defines the shape of the input fields. Default is underlined
  final PinCodeFieldShape shape;

  /// this defines the padding of each enclosing container of an input field. Default is [0.0]
  final EdgeInsetsGeometry fieldOuterPadding;

  const FlutterPinTheme(
      {this.borderRadius = BorderRadius.zero,
      this.fieldHeight = 48,
      this.fieldWidth = 48,
      this.borderWidth = 1,
      this.fieldOuterPadding = EdgeInsets.zero,
      this.shape = PinCodeFieldShape.underline,
      this.activeColor,
      this.selectedColor,
      this.inactiveColor,
      this.disabledColor,
      this.activeFillColor,
      this.selectedFillColor,
      this.inactiveFillColor,
      this.errorBorderColor,
      this.errorColor});

  @override
  _FlutterPinThemeState createState() => _FlutterPinThemeState();
}

class _FlutterPinThemeState extends State<FlutterPinTheme> {
  @override
  Widget build(BuildContext context) {
    return FlutterPinTheme(
      activeColor:
          widget.activeColor ?? Theme.of(context).textTheme.subtitle2!.color!,
      activeFillColor:
          widget.activeFillColor ?? Theme.of(context).backgroundColor,
      borderRadius: widget.borderRadius,
      borderWidth: widget.borderWidth,
      disabledColor: widget.disabledColor ?? Theme.of(context).disabledColor,
      fieldHeight: widget.fieldHeight,
      fieldWidth: widget.fieldWidth,
      inactiveColor:
          widget.inactiveColor ?? Theme.of(context).textTheme.subtitle2!.color!,
      inactiveFillColor:
          widget.inactiveFillColor ?? Theme.of(context).backgroundColor,
      errorBorderColor: widget.errorBorderColor ?? Theme.of(context).errorColor,
      errorColor: widget.errorColor ?? Theme.of(context).errorColor,
      selectedColor:
          widget.selectedColor ?? Theme.of(context).textTheme.subtitle2!.color!,
      selectedFillColor:
          widget.selectedFillColor ?? Theme.of(context).backgroundColor,
      shape: widget.shape,
      fieldOuterPadding: widget.fieldOuterPadding,
    );
  }
}
