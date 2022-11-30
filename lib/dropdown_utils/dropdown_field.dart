part of 'flutter_dropdown.dart';

class _DropDownField extends StatefulWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final VoidCallback onTap;
  final Function(String)? onChanged;
  final Function(String)? validation;
  final String? hintText;
  final TextStyle? hintStyle;
  final String? lableText;
  final TextStyle? lableStyle;
  final TextStyle? style;
  final BorderRadius? borderRadius;
  final Widget? suffixIcon;
  final Color? fillColor;
  final bool isDisabled;
  final bool isEditable;
  final bool isShowStatus;
  final BorderSideEnum? borderSideEnum;
  final BorderColorEnum? borderColorEnum;
  final TextAlignVertical textAlignVertical;
  final Widget? prefixIcon;
  final String? flag;
  final String? statusText;
  final Widget? statusIcon;

  const _DropDownField({
    Key? key,
    required this.controller,
    required this.focusNode,
    required this.onTap,
    this.onChanged,
    this.validation,
    this.suffixIcon,
    this.hintText,
    this.hintStyle,
    this.lableText,
    this.lableStyle,
    this.style,
    this.borderRadius,
    this.fillColor,
    this.isDisabled = false,
    this.isEditable = false,
    this.isShowStatus = false,
    this.borderSideEnum = BorderSideEnum.fill,
    this.borderColorEnum = BorderColorEnum.Default,
    this.textAlignVertical = TextAlignVertical.top,
    this.prefixIcon,
    this.flag,
    this.statusText,
    this.statusIcon,
  }) : super(key: key);

  @override
  State<_DropDownField> createState() => _DropDownFieldState();
}

class _DropDownFieldState extends State<_DropDownField> {
  String? prevText;
  bool listenChanges = true;
  bool isShowErrorText = false;
  BorderColorEnum? borderColorEnumValue;

  @override
  void initState() {
    super.initState();
    if (widget.onChanged != null) {
      widget.controller.addListener(listenItemChanges);
    }
    setborderColorEnumValues();
  }

  void setborderColorEnumValues() {
    setState(() {
      borderColorEnumValue = widget.borderColorEnum;
    });
  }

  @override
  void dispose() {
    widget.controller.removeListener(listenItemChanges);
    widget.focusNode.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant _DropDownField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.onChanged != null) {
      widget.controller.addListener(listenItemChanges);
    } else {
      listenChanges = false;
    }
    setborderColorEnumValues();
  }

  void listenItemChanges() {
    if (listenChanges) {
      final text = widget.controller.text;
      if (prevText != null && prevText != text && text.isNotEmpty) {
        widget.onChanged!(text);
      }
      if (text.isNotEmpty) {
        setState(() {
          borderColorEnumValue = BorderColorEnum.filled;
        });
      }
      prevText = text;
    }
  }

  @override
  Widget build(BuildContext context) {
    final _textFieldIcon = Icon(
      Icons.keyboard_arrow_down_rounded,
      color: widget.isDisabled ||
              (borderColorEnumValue.toString() ==
                  BorderColorEnum.Default.toString())
          ? Color(0xFFAFAEAF)
          : Color(0xFF808080),
      size: 26,
    );
    final _contentPadding = EdgeInsets.only(
        left: (widget.borderSideEnum!.borderString ==
                BorderSideEnum.fill.toString())
            ? 8
            : 0);
    // final _borderRadius = getBorderRadius();
    // final _borderRadius =
    //     (widget.borderSideEnum!.borderString == BorderSideEnum.fill.toString())
    //         ? widget.borderRadius ?? BorderRadius.all(Radius.circular(8))
    //         : null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: widget.lableText != null ? 56 : 44,
          padding: EdgeInsets.only(top: 6, bottom: 2),
          // decoration: BoxDecoration(
          //     color: widget.isDisabled
          //         ? AppTheme().isDarkMode
          //             ? Color(0xFF333333)
          //             : Color(0xFFE2E5EB)
          //         : Colors.transparent,
          //     border: borderSide(context),
          //     borderRadius: _borderRadius),
          child: TextFormField(
            controller: widget.controller,
            focusNode: widget.focusNode,

            validator: (val) {
              widget.validation!(val!);
              if (val.isEmpty) {
                setState(() {
                  borderColorEnumValue = BorderColorEnum.error;
                });
              }
              return null;
            },
            readOnly: !widget.isEditable,
            enabled: !widget.isDisabled,
            onTap: widget.onTap,
            onChanged: widget.onChanged,
            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                  fontSize: 16,
                  height: widget.lableText != null ? 1.3 : 1.0,
                  backgroundColor: Colors.transparent,
                ),

            // TextStyle(
            //     color: Color(0xFF151515),
            //     fontSize: 17,
            //     height: widget.lableText != null ? 1.3 : 1.0),
            textAlignVertical: widget.textAlignVertical,
            decoration: InputDecoration(
              isDense: false,
              contentPadding: _contentPadding,
              suffixIcon: widget.suffixIcon ?? _textFieldIcon,
              prefixIcon: widget.flag != null
                  ? widget.prefixIcon ?? Icon(Icons.flag_outlined)
                  : null,
              labelText: widget.lableText,
              labelStyle: widget.lableStyle ??
                  Theme.of(context).textTheme.subtitle1!.copyWith(
                      fontWeight: FontWeight.w400,
                      backgroundColor: Colors.transparent,
                      color: Color(0xff898A8B)),

              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                    width: 1,
                    color: AppTheme().isDarkMode
                        ? Color(0xFFE2E5EB)
                        : Color(0xFF333333)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                    width: 1,
                    color: AppTheme().isDarkMode
                        ? Color(0xFFE2E5EB)
                        : Color(0xFF333333)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                    width: 1,
                    color: AppTheme().isDarkMode
                        ? Color(0xFFE2E5EB)
                        : Color(0xFF333333)),
              ),

              // border: OutlineInputBorder(),
              // floatingLabelBehavior: FloatingLabelBehavior.always,
              hintText: widget.hintText ?? widget.lableText,
              hintStyle: widget.hintStyle ??
                  Theme.of(context).textTheme.subtitle1!.copyWith(
                      fontWeight: FontWeight.w400,
                      backgroundColor: Colors.transparent,
                      color: Color(0xFF898A8B)),
              // fillColor: Colors.amber,
              // filled: true,
              // border: InputBorder.none,
            ),
          ),
        ),
        if (widget.isShowStatus)
          SizedBox(
            child: statusWidget(context),
          ),
      ],
    );
  }

  Widget? statusWidget(BuildContext context) {
    Widget? statusView;
    if (borderColorEnumValue!.borderColorString !=
        BorderColorEnum.empty.toString()) {
      // statusView = borderColorEnumValue!.statusValue;
      if (borderColorEnumValue!.borderColorString ==
          BorderColorEnum.success.toString()) {
        statusView = statusIcon(
            text: widget.statusText ?? 'Success',
            statusIcon: widget.statusIcon ??
                Icon(
                  Icons.check_circle_outline,
                  size: 19,
                  color: ColorResource.color32A64D,
                ),
            textColor: ColorResource.color32A64D);
      } else if (borderColorEnumValue!.borderColorString ==
          BorderColorEnum.warning.toString()) {
        statusView = statusIcon(
            text: widget.statusText ?? 'Warning',
            statusIcon: widget.statusIcon ??
                Icon(
                  Icons.info_outline_rounded,
                  size: 19,
                  color: ColorResource.colorF37B21,
                ),
            textColor: ColorResource.colorF37B21);
      } else if (borderColorEnumValue!.borderColorString ==
          BorderColorEnum.error.toString()) {
        statusView = statusIcon(
            text: widget.statusText ?? ' This field is required',
            textColor: ColorResource.colorF37B21,
            statusIcon: widget.statusIcon ?? null);
      }
    }
    return statusView;
  }

  //       // Icons.check_circle_outline,
  //       return statusIcon(
  //           text: 'Success',
  //           icon: Icons.check_circle_outline,
  //           iconColor: Colors.red);

  //     case BorderColorEnum.warning:
  //       return statusIcon(
  //           text: 'Helper Text',
  //           icon: Icons.info_outline_rounded,
  //           iconColor: Colors.red);
  //     case BorderColorEnum.error:
  //       return statusIcon(
  //           text: ' This field is required', iconColor: Colors.red);

  //     case BorderColorEnum.empty:
  //       return SizedBox();
  //     default:
  //       return SizedBox();
  //   }
  // }

  Widget statusIcon({String? text, Widget? statusIcon, Color? textColor}) {
    return Padding(
      padding: EdgeInsets.only(top: 5),
      child: Row(
        children: [
          statusIcon != null
              ? Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: statusIcon,
                )
              : SizedBox(),
          Text(
            text!,
            style: TextStyle(color: textColor, fontSize: 10),
          ),
        ],
      ),
    );
  }

  BoxBorder? borderSide(BuildContext context) {
    BoxBorder? boxBorderView;
    if (widget.borderSideEnum.toString() == BorderSideEnum.fill.toString()) {
      boxBorderView = Border.all(color: getBorderColor());
    } else if (widget.borderSideEnum.toString() ==
        BorderSideEnum.underline.toString()) {
      boxBorderView = Border(bottom: BorderSide(color: getBorderColor()));
    } else if (widget.borderSideEnum.toString() ==
        BorderSideEnum.top.toString()) {
      boxBorderView = Border(top: BorderSide(color: getBorderColor()));
    } else if (widget.borderSideEnum.toString() ==
        BorderSideEnum.horizontal.toString()) {
      boxBorderView = Border(
          left: BorderSide(color: getBorderColor()),
          right: BorderSide(color: getBorderColor()));
    } else if (widget.borderSideEnum.toString() ==
        BorderSideEnum.vertical.toString()) {
      boxBorderView = Border(
          top: BorderSide(color: getBorderColor()),
          bottom: BorderSide(color: getBorderColor()));
    } else if (widget.borderSideEnum.toString() ==
        BorderSideEnum.none.toString()) {
      boxBorderView = Border();
    } else {
      boxBorderView = Border();
    }
    // // if (widget.borderSideEnum!.borderString != StatusEnum.empty.toString()) {
    // boxBorderView = widget.borderSideEnum!.borderSide;
    // // }
    return boxBorderView;
  }

  Color getBorderColor() {
    Color? borderColor;
    borderColor = borderColorEnumValue!.borderColor;
    return borderColor;
  }

  BorderRadiusGeometry? getBorderRadius() {
    BorderRadiusGeometry? radius;
    if (widget.borderSideEnum!.borderString == BorderSideEnum.fill.toString()) {
      radius = widget.borderRadius ?? BorderRadius.all(Radius.circular(8));
    } else if (widget.borderSideEnum!.borderString ==
        BorderSideEnum.none.toString()) {
      radius = widget.borderRadius ?? BorderRadius.all(Radius.circular(8));
    } else {
      print('-----zero');
      radius = null;
    }

    return radius;
  }
}

enum BorderSideEnum { fill, underline, top, vertical, horizontal, none }

enum BorderColorEnum { Active, Default, filled, success, warning, error, empty }

extension BorderSideExtension on BorderSideEnum {
  // BoxBorder get borderSide {
  //   switch (this) {
  //     case BorderSideEnum.fill:
  //       return Border.all(color: Colors.amber);
  //     case BorderSideEnum.underline:
  //       return Border(bottom: BorderSide(color: Colors.blue));
  //     case BorderSideEnum.top:
  //       return Border(top: BorderSide(color: Colors.blue));
  //     case BorderSideEnum.horizontal:
  //       return Border(
  //           left: BorderSide(color: Colors.blue),
  //           right: BorderSide(color: Colors.blue));
  //     case BorderSideEnum.vertical:
  //       return Border(
  //           top: BorderSide(color: Colors.blue),
  //           bottom: BorderSide(color: Colors.blue));
  //     case BorderSideEnum.none:
  //       return Border();
  //     default:
  //       return Border.all(color: Colors.amber);
  //   }
  // }

  String get borderString {
    switch (this) {
      case BorderSideEnum.fill:
        return BorderSideEnum.fill.toString();
      case BorderSideEnum.underline:
        return BorderSideEnum.underline.toString();
      case BorderSideEnum.top:
        return BorderSideEnum.top.toString();
      case BorderSideEnum.vertical:
        return BorderSideEnum.vertical.toString();
      case BorderSideEnum.horizontal:
        return BorderSideEnum.horizontal.toString();
      case BorderSideEnum.none:
        return BorderSideEnum.none.toString();
      default:
        return BorderSideEnum.fill.toString();
    }
  }
}

extension BorderColorExtension on BorderColorEnum {
  Color get borderColor {
    switch (this) {
      case BorderColorEnum.Active:
        return Color(0xFF151515);
      case BorderColorEnum.Default:
        return Color(0xFFAFAEAF);
      case BorderColorEnum.filled:
        return Color(0xFFAFAEAF);
      case BorderColorEnum.success:
        return Color(0xFF32A64D);
      case BorderColorEnum.warning:
        return Color(0xFFF37B21);
      case BorderColorEnum.error:
        return Color(0xFFF37B21);
      case BorderColorEnum.empty:
        return Color(0xFFAFAEAF);
      default:
        return Color(0xFFD2D2D3);
    }
  }

  String get borderColorString {
    switch (this) {
      case BorderColorEnum.Default:
        return BorderColorEnum.Default.toString();
      case BorderColorEnum.Active:
        return BorderColorEnum.Active.toString();
      case BorderColorEnum.filled:
        return BorderColorEnum.filled.toString();
      case BorderColorEnum.success:
        return BorderColorEnum.success.toString();
      case BorderColorEnum.warning:
        return BorderColorEnum.warning.toString();
      case BorderColorEnum.error:
        return BorderColorEnum.error.toString();
      case BorderColorEnum.empty:
        return BorderColorEnum.empty.toString();
      default:
        return BorderColorEnum.empty.toString();
    }
  }

  // Widget get statusValue {
  //   switch (this) {
  //     case BorderColorEnum.success:
  //       // Icons.check_circle_outline,
  //       return statusIcon(
  //           text: 'Success',
  //           icon: Icons.check_circle_outline,
  //           iconColor: Colors.red);
  //     case BorderColorEnum.warning:
  //       return statusIcon(
  //           text: 'Helper Text',
  //           icon: Icons.info_outline_rounded,
  //           iconColor: Colors.red);
  //     case BorderColorEnum.error:
  //       return statusIcon(
  //           text: ' This field is required', iconColor: Colors.red);
  //     case BorderColorEnum.empty:
  //       return SizedBox();
  //     default:
  //       return SizedBox();
  //   }
  // }

  Widget statusIcon({String? text, IconData? icon, Color? iconColor}) {
    return Padding(
      padding: EdgeInsets.only(top: 5),
      child: Row(
        children: [
          icon != null
              ? Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: Icon(
                    icon,
                    size: 19,
                    color: iconColor,
                  ),
                )
              : SizedBox(),
          Text(
            text!,
            style: TextStyle(color: iconColor, fontSize: 10),
          ),
        ],
      ),
    );
  }
}
