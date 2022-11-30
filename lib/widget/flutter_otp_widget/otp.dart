import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_components/color_resource.dart';
import 'package:flutter_components/widget/flutter_otp_widget/pin_code.dart';
import 'package:flutter_components/widget/flutter_otp_widget/pin_theme.dart';

class FlutterOtp extends StatefulWidget {
  final TextEditingController? controller;
  int length;
  bool isObscureText;
  bool isShowCursor;
  bool enableActiveFill;
  double fieldHeight;
  double fieldWeight;
  double borderWidth;
  double cursorWidth;
  double cursorHeight;
  String obscuringCharacter;
  String? values;
  ValueChanged<String>? onCompleted;
  ValueChanged<String>? onChanged;
  FormFieldValidator<String>? validator;
  StreamController<ErrorAnimationType>? errorAnimationController;

  MainAxisAlignment mainAxisAlignment;
  Color? inactiveColor;
  Color? inactiveFillColor;
  Color? selectedFillColor;
  Color? activeColor;
  Color? selectedColor;
  Color? activeFillColor;
  Color? errorBorderColor;
  Color? cursorColor;
  Color? disabledColor;
  Color? errorColor;
  TextInputType? keyboardType;
  AnimationType? animationType;
  Duration? animationDuration;
  PinCodeFieldShape shape;
  BorderRadius? borderRadius;
  TextStyle? textStyle;
  final List<BoxShadow>? boxShadows;
  bool isOTPSuccess;

  FlutterOtp(
      {Key? key,
      this.isObscureText = true,
      this.obscuringCharacter = '*',
      this.mainAxisAlignment = MainAxisAlignment.spaceEvenly,
      this.keyboardType = TextInputType.number,
      this.fieldHeight = 48,
      this.fieldWeight = 48,
      this.borderWidth = 1,
      this.length = 4,
      this.borderRadius,
      this.inactiveColor,
      this.onChanged,
      this.onCompleted,
      this.activeColor,
      this.values,
      this.selectedColor,
      this.errorBorderColor,
      this.activeFillColor,
      this.isShowCursor = true,
      this.cursorColor,
      this.cursorHeight = 16,
      this.cursorWidth = 1,
      this.animationType = AnimationType.scale,
      this.animationDuration = const Duration(milliseconds: 300),
      this.controller,
      this.enableActiveFill = true,
      this.inactiveFillColor,
      this.selectedFillColor,
      this.shape = PinCodeFieldShape.underline,
      this.validator,
      this.boxShadows,
      this.isOTPSuccess = false,
      this.errorAnimationController,
      this.disabledColor,
      this.errorColor,
      this.textStyle})
      : super(key: key);
  @override
  _OtpState createState() => _OtpState();
}

class _OtpState extends State<FlutterOtp> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlutterPinCodeTextField(
        textStyle: widget.textStyle ??
            Theme.of(context).textTheme.subtitle2!.copyWith(
                  backgroundColor: Colors.transparent,
                  fontWeight: FontWeight.w500,
                  fontSize: 23,
                  height: 1.75,
                ),
        boxShadows: widget.boxShadows,
        appContext: context,
        controller: widget.controller,
        onChanged: widget.onChanged!,
        onCompleted: widget.onCompleted,
        obscuringCharacter: widget.obscuringCharacter,
        length: widget.length,
        cursorHeight: widget.cursorHeight,
        cursorWidth: widget.cursorWidth,
        obscureText: widget.isObscureText,
        animationType: widget.animationType!,
        animationDuration: widget.animationDuration!,
        keyboardType: widget.keyboardType!,
        mainAxisAlignment: widget.mainAxisAlignment,
        showCursor: widget.isShowCursor,
        validator: widget.validator,
        errorAnimationController: widget.errorAnimationController,
        cursorColor:
            widget.cursorColor ?? Theme.of(context).textTheme.subtitle2!.color,
        enableActiveFill: widget.enableActiveFill,
        pinTheme: FlutterPinTheme(
          inactiveFillColor: widget.inactiveFillColor ?? Colors.transparent,
          fieldOuterPadding:
              const EdgeInsets.only(left: 2, right: 2, top: 16, bottom: 16),
          activeFillColor: widget.activeFillColor ?? Colors.transparent,
          shape: widget.shape,
          disabledColor:
              widget.disabledColor ?? Theme.of(context).disabledColor,
          selectedFillColor: widget.selectedFillColor ?? Colors.transparent,
          borderRadius: widget.borderRadius ?? BorderRadius.circular(8),
          borderWidth: widget.borderWidth,
          errorColor: widget.errorColor ?? Theme.of(context).errorColor,
          errorBorderColor:
              widget.errorBorderColor ?? Theme.of(context).errorColor,
          inactiveColor: widget.inactiveColor ??
              Theme.of(context)
                  .textTheme
                  .subtitle2!
                  .copyWith(color: ColorResource.colorAFAEAF)
                  .color!,
          selectedColor: widget.selectedColor ??
              Theme.of(context).textTheme.subtitle2!.color!,
          activeColor: widget.isOTPSuccess
              ? widget.activeColor ??
                  Theme.of(context).textTheme.subtitle2!.color!
              : Theme.of(context).errorColor,
          fieldHeight: widget.fieldHeight,
          fieldWidth: widget.fieldWeight,
        ),
      ),
      alignment: Alignment.center,
    );
  }
}
