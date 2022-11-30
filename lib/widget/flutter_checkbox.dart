import 'package:flutter/material.dart';
import 'package:flutter_components/color_resource.dart';

import '../app_theme.dart';

class FlutterCheckBox extends StatefulWidget {
  FlutterCheckBox(
      {Key? key,
      required this.value,
      required this.onTap,
      this.disabled = false,
      this.checkBoxStyle = CheckboxStyleEnum.square,
      this.borderRadius,
      this.checkBoxSize = 1.3,
      this.activeColor,
      this.disabledColor,
      this.borderside})
      : super(key: key);

  final bool value;
  final ValueChanged<bool> onTap;
  final bool disabled;
  final CheckboxStyleEnum checkBoxStyle;
  final BorderRadiusGeometry? borderRadius;
  final double checkBoxSize;
  final BorderSide? borderside;
  final Color? activeColor;
  final Color? disabledColor;
  @override
  State<FlutterCheckBox> createState() => _FlutterCheckBoxState();
}

class _FlutterCheckBoxState extends State<FlutterCheckBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Transform.scale(
        scale: widget.checkBoxSize,
        child: CheckboxTheme(
          data: CheckboxThemeData(
              checkColor: Theme.of(context).checkboxTheme.checkColor),
          child: Checkbox(
              value: widget.value,
              fillColor: Theme.of(context).checkboxTheme.fillColor,
              // activeColor: widget.disabled
              //     ? widget.disabledColor ?? Color(0xFFE2E5EB)
              //     : widget.activeColor ?? Color(0xFF151515),
              side: widget.borderside ?? Theme.of(context).checkboxTheme.side,
              shape: RoundedRectangleBorder(borderRadius: getBorderRadius()),
              checkColor: AppTheme().isDarkMode
                  ? ColorResource.color151515
                  : Theme.of(context).checkboxTheme.checkColor?.resolve(
                      Set.of([MaterialState.selected, MaterialState.disabled])),
              onChanged: !widget.disabled
                  ? (val) {
                      widget.onTap(val!);
                    }
                  : null),
        ),
      ),
    );
  }

  BorderRadiusGeometry getBorderRadius() {
    BorderRadiusGeometry? radius;
    if (widget.checkBoxStyle.checkboxString ==
        CheckboxStyleEnum.square.toString()) {
      radius = widget.borderRadius ?? BorderRadius.all(Radius.circular(6.0));
    } else if (widget.checkBoxStyle.checkboxString ==
        CheckboxStyleEnum.round.toString()) {
      radius = widget.borderRadius ?? BorderRadius.all(Radius.circular(15.0));
    } else {
      radius = widget.borderRadius ?? BorderRadius.all(Radius.circular(0));
    }

    return radius;
  }
}

enum CheckboxStyleEnum { round, square }

extension CheckboxStyleExtension on CheckboxStyleEnum {
  String get checkboxString {
    switch (this) {
      case CheckboxStyleEnum.round:
        return CheckboxStyleEnum.round.toString();
      case CheckboxStyleEnum.square:
        return CheckboxStyleEnum.square.toString();
      default:
        return CheckboxStyleEnum.square.toString();
    }
  }
}
