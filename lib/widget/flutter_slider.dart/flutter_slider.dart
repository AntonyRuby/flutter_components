import 'package:flutter/material.dart';
import 'package:flutter_components/color_resource.dart';

// ignore: must_be_immutable
class FlutterSlider extends StatefulWidget {
  double? value;
  double? min;
  double? max;
  int? divisions;
  bool? autofocus;
  FocusNode? focusNode;
  ValueChanged<double>? onChanged;
  ValueChanged<double>? onChangeEnd;
  double? trackHeight;
  Color? activeTrackColor;
  Color? inactiveTrackColor;
  Color? disabledActiveTrackColor;
  Color? disabledInactiveTrackColor;
  Color? activeTickMarkColor;
  Color? inactiveTickMarkColor;
  Color? disabledActiveTickMarkColor;
  Color? disabledInactiveTickMarkColor;
  Color? thumbColor;
  Color? overlappingShapeStrokeColor;
  Color? disabledThumbColor;
  Color? overlayColor;
  Color? valueIndicatorColor;
  SliderComponentShape? overlayShape;
  SliderTickMarkShape? tickMarkShape;
  SliderComponentShape? thumbShape;
  SliderTrackShape? trackShape;
  SliderComponentShape? valueIndicatorShape;
  RangeSliderTickMarkShape? rangeTickMarkShape;
  RangeSliderThumbShape? rangeThumbShape;
  RangeSliderTrackShape? rangeTrackShape;
  RangeSliderValueIndicatorShape? rangeValueIndicatorShape;
  ShowValueIndicator? showValueIndicator;
  TextStyle? valueIndicatorTextStyle;
  double? minThumbSeparation;
  RangeThumbSelector? thumbSelector;
  MaterialStateProperty<MouseCursor?>? mouseCursor;
  IconData? icon;
  IconData? icon1;
  bool iconView;

  FlutterSlider(
      {Key? key,
      this.value,
      @required this.min,
      @required this.max,
      this.divisions,
      this.autofocus,
      this.focusNode,
      this.trackHeight,
      this.activeTrackColor,
      this.inactiveTrackColor,
      this.disabledActiveTrackColor,
      this.disabledInactiveTrackColor,
      this.activeTickMarkColor,
      this.inactiveTickMarkColor,
      this.disabledActiveTickMarkColor,
      this.disabledInactiveTickMarkColor,
      this.thumbColor,
      this.overlappingShapeStrokeColor,
      this.disabledThumbColor,
      this.overlayColor,
      this.valueIndicatorColor,
      this.overlayShape,
      this.tickMarkShape,
      this.thumbShape,
      this.trackShape,
      this.valueIndicatorShape,
      this.rangeTickMarkShape,
      this.rangeThumbShape,
      this.rangeTrackShape,
      this.rangeValueIndicatorShape,
      this.showValueIndicator,
      this.valueIndicatorTextStyle,
      this.minThumbSeparation,
      this.thumbSelector,
      this.mouseCursor,
      this.onChanged,
      this.onChangeEnd,
      this.icon,
      this.icon1,
      this.iconView = false})
      : assert(min != null),
        assert(max != null),
        assert(min! <= max!),
        assert(value != null ? (value >= min! && value <= max!) : true);

  @override
  State<FlutterSlider> createState() => _FlutterSliderState();
}

class _FlutterSliderState extends State<FlutterSlider> {
  late double selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.value ?? widget.min!;
  }

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
        data: SliderThemeData(
          trackHeight: widget.trackHeight ?? 8,
          inactiveTickMarkColor: widget.inactiveTickMarkColor ??
              Theme.of(context).sliderTheme.inactiveTickMarkColor,
          activeTickMarkColor: widget.activeTickMarkColor ??
              Theme.of(context).sliderTheme.activeTrackColor,
          valueIndicatorColor: widget.valueIndicatorColor ??
              Theme.of(context).sliderTheme.valueIndicatorColor,
          valueIndicatorTextStyle: widget.valueIndicatorTextStyle ??
              TextStyle(
                color: Theme.of(context)
                    .textTheme
                    .subtitle1!
                    .copyWith(color: ColorResource.color151515)
                    .color,
                fontWeight: FontWeight.w500,
              ),
          disabledActiveTickMarkColor:
              widget.disabledActiveTickMarkColor ?? Colors.blue,
          showValueIndicator:
              widget.showValueIndicator ?? ShowValueIndicator.always,
          activeTrackColor: widget.activeTrackColor ??
              Theme.of(context).sliderTheme.activeTrackColor,
          inactiveTrackColor: widget.inactiveTrackColor ??
              Theme.of(context).sliderTheme.inactiveTrackColor,
          thumbColor: widget.thumbColor ??
              Theme.of(context)
                  .textTheme
                  .subtitle1!
                  .copyWith(color: ColorResource.colorFFFFFF)
                  .color,
          overlayColor:
              widget.overlayColor ?? Theme.of(context).sliderTheme.overlayColor,
        ),
        child: Column(
          children: [
            Slider(
              value: selectedValue,
              min: widget.min!,
              label: selectedValue.round().toString(),
              max: widget.max!,
              onChanged: (val) {
                setState(() {
                  selectedValue = val;
                });
                if (widget.onChanged != null) {
                  widget.onChanged!(selectedValue);
                }
              },
              onChangeEnd: ((value) {
                setState(() {
                  selectedValue = value;
                });
                if (widget.onChangeEnd != null) {
                  widget.onChangeEnd!(selectedValue);
                }
              }),
              autofocus: widget.autofocus ?? false,
              focusNode: widget.focusNode,
              divisions: widget.divisions,
            ),
            widget.iconView
                ? Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      children: [
                        Icon(
                          widget.icon ?? Icons.volume_down_outlined,
                          color: Theme.of(context).textTheme.subtitle2!.color,
                        ),
                        Spacer(),
                        Icon(widget.icon1 ?? Icons.volume_up_outlined,
                            color: Theme.of(context).textTheme.subtitle2!.color)
                      ],
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      children: [
                        Text(
                          '${widget.min!.round()}',
                          style: TextStyle(
                            color: Theme.of(context).textTheme.subtitle1!.color,
                          ),
                        ),
                        Spacer(),
                        Text(
                          '${widget.max!.round()}',
                          style: TextStyle(
                            color: Theme.of(context).textTheme.subtitle1!.color,
                          ),
                        )
                      ],
                    ),
                  )
          ],
        ));
  }
}
