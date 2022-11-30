import 'package:flutter/material.dart';
import 'package:flutter_components/color_resource.dart';
import '../app_theme.dart';

// ignore: must_be_immutable
class FlutterStepper extends StatefulWidget {
  double? value;
  double? minValue;
  double? maxValue;
  final ValueChanged<int>? onChanged;
  final StepperStyleEnum? stepperStyle;
  final int? initialCount;
  final BorderRadius? borderRadius;
  final BorderRadius? selectedBoxRadius;
  final TextStyle? textStyle;
  final double? height;
  final double? width;
  final Color? borderColor;
  final Color? selectedBoxColor;
  final Color? backgroundColor;
  final Color? iconColor;
  FlutterStepper(
      {Key? key,
      required this.stepperStyle,
      this.value,
      required this.minValue,
      required this.maxValue,
      this.onChanged,
      this.initialCount = 0,
      this.borderRadius,
      this.textStyle,
      this.height,
      this.width,
      this.borderColor,
      this.selectedBoxColor,
      this.backgroundColor,
      this.iconColor,
      this.selectedBoxRadius})
      : assert(minValue != null),
        assert(maxValue != null),
        assert(minValue! <= maxValue!),
        assert(
            value != null ? (value >= minValue! && value <= maxValue!) : true);

  @override
  State<FlutterStepper> createState() => _FlutterStepperState();
}

class _FlutterStepperState extends State<FlutterStepper> {
  bool? switchAction = false;
  bool isShowBoxColor = false;
  Color? setBorderColor;
  int counter = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    setBorderColor = AppTheme().isDarkMode
        ? ColorResource.color282829
        : ColorResource.colorF0F2F5;
    return SizedBox(
      child: Container(
        padding: getBoxDecoration().containerPadding,
        height: widget.height ?? 25,
        width: widget.width ?? 65,
        decoration: BoxDecoration(
          color: AppTheme().isDarkMode
              ? widget.backgroundColor ?? ColorResource.color282829
              : widget.backgroundColor ?? ColorResource.colorF0F2F5,
          border: Border.all(
              color: widget.borderColor ?? getBoxDecoration().borderColor!),
          borderRadius: getBoxDecoration().borderRadius,
        ),
        child: Row(
          children: [
            Expanded(
                child: InkWell(
              onTap: () {
                showBoxColor();
                setState(() {
                  if (counter > widget.minValue!) {
                    counter--;
                  }
                  widget.onChanged!(counter);
                });
              },
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: !switchAction! && isShowBoxColor
                        ? getBoxDecoration().boxColor
                        : Colors.transparent,
                    borderRadius: getBoxDecoration().iconBoxBorderRadius),
                child: Icon(Icons.remove,
                    size: 16, color: getBoxDecoration().defaultIconColor),
              ),
            )),
            SizedBox(child: getWidget()),
            Expanded(
                child: InkWell(
              onTap: () {
                // widget.onTap!('add');
                showBoxColor();
                // setState(() {

                setState(() {
                  if (counter < widget.maxValue!) {
                    counter++;
                  }
                  widget.onChanged!(counter);
                });
              },
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: switchAction! && isShowBoxColor
                      ? getBoxDecoration().boxColor
                      : Colors.transparent,
                  borderRadius: getBoxDecoration().iconBoxBorderRadius,
                ),
                child: Icon(Icons.add_rounded,
                    size: 16, color: getBoxDecoration().defaultIconColor),
              ),
            )),
          ],
        ),
      ),
    );
  }

  void showBoxColor() {
    setState(() {
      if (!isShowBoxColor) {
        isShowBoxColor = !isShowBoxColor;
      }
    });
  }

  Widget? getWidget() {
    var brightness = MediaQuery.of(context).platformBrightness;
    Widget? returnWidget;
    if (widget.stepperStyle!.stepperString ==
        StepperStyleEnum.Default.toString()) {
      returnWidget = !isShowBoxColor
          ? Container(
              margin: EdgeInsets.all(2.0),
              width: 1.0,
              color: Colors.grey,
            )
          : SizedBox();
    } else if (widget.stepperStyle!.stepperString ==
        StepperStyleEnum.custom.toString()) {
      returnWidget = Container(
        alignment: Alignment.center,
        width: counter.toString().length == 1 || counter.toString().length == 2
            ? 21
            : null,
        // height: 20,
        decoration: BoxDecoration(
            color: brightness.toString() == Brightness.dark.toString()
                ? ColorResource.color404040
                : ColorResource.colorFFFFFF,
            borderRadius: BorderRadius.all(Radius.circular(4))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 1),
          child: Text(
            '$counter'.toString().padLeft(2, '0'),
            style: widget.textStyle ?? Theme.of(context).textTheme.caption,
          ),
        ),
      );
    } else if (widget.stepperStyle!.stepperString ==
        StepperStyleEnum.old.toString()) {
      returnWidget = MediaQuery.removePadding(
        context: context,
        child: Container(
          width: 1.0,
          color: widget.borderColor ?? ColorResource.color0071EB,
        ),
      );
    } else {
      returnWidget = null;
    }

    return returnWidget;
  }

  StepperModel getBoxDecoration() {
    StepperModel? decorations;
    if (widget.stepperStyle!.stepperString ==
        StepperStyleEnum.Default.toString()) {
      decorations = StepperModel(
          borderRadius:
              widget.borderRadius ?? BorderRadius.all(Radius.circular(8)),
          iconBoxBorderRadius:
              widget.selectedBoxRadius ?? BorderRadius.all(Radius.circular(8)),
          containerPadding: EdgeInsets.all(2),
          boxColor: widget.selectedBoxColor ?? Color(0xFFFFFFFF),
          defaultIconColor:
              widget.iconColor ?? Theme.of(context).textTheme.subtitle2!.color!,
          borderColor: widget.borderColor ?? setBorderColor);
    } else if (widget.stepperStyle!.stepperString ==
        StepperStyleEnum.custom.toString()) {
      decorations = StepperModel(
          borderRadius:
              widget.borderRadius ?? BorderRadius.all(Radius.circular(8)),
          iconBoxBorderRadius:
              widget.selectedBoxRadius ?? BorderRadius.all(Radius.circular(8)),
          containerPadding: EdgeInsets.all(2),
          boxColor: widget.selectedBoxColor ?? Colors.transparent,
          defaultIconColor:
              widget.iconColor ?? Theme.of(context).textTheme.subtitle2!.color!,
          borderColor: widget.borderColor ?? setBorderColor);
    } else if (widget.stepperStyle!.stepperString ==
        StepperStyleEnum.old.toString()) {
      decorations = StepperModel(
          borderRadius:
              widget.borderRadius ?? BorderRadius.all(Radius.circular(8)),
          iconBoxBorderRadius: widget.selectedBoxRadius != null
              ? widget.selectedBoxRadius
              : switchAction!
                  ? BorderRadius.only(
                      topRight: Radius.circular(7.5),
                      bottomRight: Radius.circular(7.5))
                  : BorderRadius.only(
                      topLeft: Radius.circular(7.5),
                      bottomLeft: Radius.circular(7.5)),
          containerPadding: EdgeInsets.all(0),
          boxColor: widget.selectedBoxColor ?? ColorResource.color0071EB,
          defaultIconColor: widget.iconColor ?? ColorResource.color0071EB,
          borderColor: widget.borderColor ?? ColorResource.color0071EB);
    } else {
      decorations = StepperModel();
    }
    return decorations;
  }
}

enum StepperStyleEnum { Default, custom, old }

extension StepperStyleExtension on StepperStyleEnum {
  String get stepperString {
    switch (this) {
      case StepperStyleEnum.Default:
        return StepperStyleEnum.Default.toString();
      case StepperStyleEnum.custom:
        return StepperStyleEnum.custom.toString();
      case StepperStyleEnum.old:
        return StepperStyleEnum.old.toString();
      default:
        return StepperStyleEnum.Default.toString();
    }
  }
}

class StepperModel {
  StepperModel({
    this.containerPadding = const EdgeInsets.all(2),
    this.borderRadius = const BorderRadius.all(Radius.circular(8)),
    this.iconBoxBorderRadius = const BorderRadius.all(Radius.circular(8)),
    this.boxColor = Colors.transparent,
    this.selectedIconColor = const Color(0xFFAFAEAF),
    this.defaultIconColor = const Color(0xFFAFAEAF),
    this.borderColor = const Color(0xFFF0F2F5),
  });

  EdgeInsetsGeometry? containerPadding;
  BorderRadiusGeometry? borderRadius;
  BorderRadiusGeometry? iconBoxBorderRadius;
  Color? boxColor;
  Color? selectedIconColor;
  Color? defaultIconColor;
  Color? borderColor;
}
