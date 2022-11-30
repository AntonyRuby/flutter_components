import 'package:flutter/material.dart';
import 'package:flutter_components/app_theme.dart';
import 'package:flutter_components/color_resource.dart';
import 'package:flutter_components/widget/flutter_input_fields/validator.dart';

// ignore: must_be_immutable
class FlutterInputFields extends StatefulWidget {
  final String hintText;
  // final String? labelText;
  final String? counterText;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  // final TextStyle? lableStyle;
  TextEditingController? textEditingController = TextEditingController();
  final TextInputType keyBoardType;
  final Color focusedBorder;
  final BorderType? borderType;
  SuffixIconEnumType suffixIcon;
  final ValidationBorderType validationBorderType;
  final FocusNode? focusNode;
  final Color? focusTextColor;
  final Color? cursorColor;
  bool obscureText;
  List<String> validationRules = [];
  String? Function(String?)? validatorFunction;
  final Function(bool)? validatorCallBack;
  final String? helperText;
  Function? oncomplete;
  final Function? onEditing;
  AutovalidateMode? autovalidateMode;
  final Function? onTapped;
  final bool isReadOnly;
  final Widget? prefixIcon;
  final bool isDisable;
  final TextInputAction? textInputAction;

  FlutterInputFields(
    // ignore: invalid_required_positional_param
    @required this.hintText,
    // ignore: invalid_required_positional_param
    @required this.textEditingController, {
    this.borderType = BorderType.underline,
    this.keyBoardType = TextInputType.name,
    this.focusedBorder = const Color(0xFF151515),
    // this.labelText,
    this.textStyle,
    this.suffixIcon = SuffixIconEnumType.close,
    this.obscureText = false,
    this.validationRules = const [],
    this.helperText,
    this.focusNode,
    this.focusTextColor,
    this.validatorCallBack,
    this.counterText,
    this.validatorFunction,
    this.validationBorderType = ValidationBorderType.none,
    this.onEditing,
    this.oncomplete,
    this.autovalidateMode,
    this.onTapped,
    this.isDisable = false,
    this.isReadOnly = false,
    this.prefixIcon,
    this.textInputAction,
    this.cursorColor,
    this.hintStyle,
    // this.lableStyle,
  });

  @override
  _FlutterInputFieldsState createState() => _FlutterInputFieldsState();
}

class _FlutterInputFieldsState extends State<FlutterInputFields> {
  final formKey = GlobalKey<FormState>();
  bool isValuesHaving = false;
  @override
  void dispose() {
    widget.textEditingController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Form(
            key: formKey,
            child: TextFormField(
              // autofocus: true,
              textInputAction: widget.textInputAction ?? TextInputAction.done,
              controller: widget.textEditingController,
              style: widget.textStyle ??
                  Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                        color: AppTheme().isDarkMode
                            ? ColorResource.colorFFFFFF
                            : ColorResource.color282829,
                      ),
              keyboardType: widget.keyBoardType,
              cursorColor: widget.cursorColor ??
                  Theme.of(context).textTheme.subtitle1!.color,
              obscureText: widget.obscureText,
              focusNode: widget.focusNode,
              autovalidateMode: widget.autovalidateMode,
              decoration: widget.borderType!.inputDecoration.copyWith(
                enabledBorder: BorderType.roundedRectangle == widget.borderType
                    ? OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          width: 1,
                          style: BorderStyle.solid,
                          color:
                              widget.validationBorderType.validationTypeStatus,
                        ),
                      )
                    : UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          width: 1,
                          style: BorderStyle.solid,
                          color:
                              widget.validationBorderType.validationTypeStatus,
                        ),
                      ),
                focusedBorder: BorderType.roundedRectangle == widget.borderType
                    ? OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          width: 1,
                          color:
                              widget.validationBorderType.validationTypeStatus,
                          style: BorderStyle.solid,
                        ),
                      )
                    : UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          width: 1,
                          color:
                              widget.validationBorderType.validationTypeStatus,
                          style: BorderStyle.solid,
                        ),
                      ),
                disabledBorder: BorderType.roundedRectangle == widget.borderType
                    ? OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          width: 1,
                          color:
                              widget.validationBorderType.validationTypeStatus,
                          style: BorderStyle.solid,
                        ),
                      )
                    : UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          width: 1,
                          style: BorderStyle.solid,
                          color:
                              widget.validationBorderType.validationTypeStatus,
                        ),
                      ),
                border: BorderType.roundedRectangle == widget.borderType
                    ? OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          width: 1,
                          color:
                              widget.validationBorderType.validationTypeStatus,
                          style: BorderStyle.solid,
                        ),
                      )
                    : UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          width: 1,
                          style: BorderStyle.solid,
                          color:
                              widget.validationBorderType.validationTypeStatus,
                        ),
                      ),
                errorMaxLines: 2,
                // labelText: widget.labelText,
                // labelStyle: widget.lableStyle ??
                //     Theme.of(context).textTheme.bodyText1!.copyWith(
                //           fontSize: 17,
                //           fontWeight: FontWeight.w400,
                //           color: AppTheme().isDarkMode
                //               ? ColorResource.colorFFFFFF
                //               : ColorResource.color282829,
                // ),
                labelText: widget.hintText,
                // hintText: widget.labelText,
                hintStyle: widget.hintStyle ??
                    Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                          color: AppTheme().isDarkMode
                              ? ColorResource.colorFFFFFF
                              : ColorResource.color282829,
                        ),
                focusColor: widget.validationBorderType.validationTypeStatus,
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(
                      () {
                        if (widget.suffixIcon.toString() ==
                            SuffixIconEnumType.close.toString()) {
                          widget.textEditingController!.clear();
                          isValuesHaving = false;
                          widget.focusNode!.unfocus();
                        } else if (widget.suffixIcon.toString() ==
                            SuffixIconEnumType.visibility.toString()) {
                          widget.obscureText =
                              widget.obscureText ? false : true;
                          widget.suffixIcon = widget.obscureText
                              ? SuffixIconEnumType.visibility
                              : SuffixIconEnumType.visibilityoff;
                        } else if (widget.suffixIcon.toString() ==
                            SuffixIconEnumType.visibilityoff.toString()) {
                          widget.obscureText =
                              widget.obscureText ? false : true;
                          widget.suffixIcon = widget.obscureText
                              ? SuffixIconEnumType.visibility
                              : SuffixIconEnumType.visibilityoff;
                        }
                      },
                    );
                  },
                  child: isValuesHaving ? widget.suffixIcon.icons : SizedBox(),
                ),
                enabled: true,
                suffixIconConstraints:
                    BoxConstraints(minHeight: 24, minWidth: 24),
                prefixIcon: widget.prefixIcon,
                prefixIconConstraints:
                    BoxConstraints(minHeight: 24, minWidth: 24),
                contentPadding:
                    EdgeInsets.only(top: 4, bottom: 4, left: 6, right: 6),
              ),
              validator: widget.validatorFunction ??
                  (String? value) {
                    if (widget.validationRules.isNotEmpty) {
                      final ValidationState validationStatus =
                          Validator.validate(value ?? '',
                              rules: widget.validationRules);
                      if (widget.validatorCallBack != null)
                        widget.validatorCallBack!(validationStatus.status);
                      if (!validationStatus.status) {
                        return validationStatus.error;
                      }
                    }
                    return null;
                  },
              onEditingComplete: () {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  setState(() {});
                });
                FocusScope.of(context).requestFocus(FocusNode());
                if (widget.onEditing != null) {
                  widget.onEditing!();
                }
              },
              onTap: () {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  setState(() {});
                });

                if (widget.onTapped != null) {
                  widget.onTapped!();
                }
              },
              onChanged: (value) {
                setState(() {
                  if (value != null && value != '') {
                    isValuesHaving = true;
                  } else {
                    isValuesHaving = false;
                    widget.focusNode!.unfocus();
                  }
                  saveForm();
                });
              },
            ),
          ),
        ),
        counterTextWidget(
          counterText: widget.counterText,
          validationBorderType: widget.validationBorderType,
          context: context,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 25),
          child: ElevatedButton(
            onPressed: () {
              saveForm();
            },
            child: Text(
              'Elevated Button',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
      ],
    );
  }

  String? validatePassword(String value) {
    if (widget.validationRules.isNotEmpty) {
      final ValidationState validationStatus =
          Validator.validate(value, rules: widget.validationRules);
      if (!validationStatus.status) {
        return validationStatus.error;
      }
    }
    return null;
  }

  void saveForm({Function(String)? onSaved}) {
    final bool isValid = formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    formKey.currentState!.save();
  }

  Widget counterTextWidget(
      {String? counterText,
      ValidationBorderType? validationBorderType,
      BuildContext? context}) {
    return counterText != null && counterText != ''
        ? Padding(
            padding: const EdgeInsets.only(left: 13.0),
            child: Row(
              children: [
                validationBorderType!.validationTypeIcon,
                SizedBox(
                  width: 5,
                ),
                Text(
                  counterText,
                  style: Theme.of(context!).textTheme.titleMedium!.copyWith(
                        color: validationBorderType.validationTypeStatus,
                      ),
                ),
              ],
            ),
          )
        : SizedBox();
  }
}

extension BorderTypeExtension on BorderType {
  InputDecoration get inputDecoration {
    switch (this) {
      case BorderType.roundedRectangle:
        return InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              width: 1,
              style: BorderStyle.solid,
              color: Color(0xff151515),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              width: 1,
              style: BorderStyle.solid,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
                width: 1, style: BorderStyle.solid, color: Color(0xFFAFAEAF)),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              width: 1,
              style: BorderStyle.solid,
            ),
          ),
        );
      case BorderType.underline:
        return InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              width: 1,
              style: BorderStyle.solid,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              width: 1,
              style: BorderStyle.solid,
            ),
          ),
          disabledBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              width: 1,
              style: BorderStyle.solid,
              color: Color(0xFFAFAEAF),
            ),
          ),
          border: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              width: 1,
              style: BorderStyle.solid,
            ),
          ),
        );
      case BorderType.none:
        return InputDecoration(
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          border: InputBorder.none,
        );
    }
  }
}

extension IconExtension on SuffixIconEnumType {
  Widget get icons {
    switch (this) {
      case SuffixIconEnumType.close:
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: Color(0xffAFAEAF),
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(90.0),
              ),
            ),
            child: Icon(
              Icons.close,
              color: Colors.black,
              size: 20,
            ),
          ),
        );
      case SuffixIconEnumType.visibility:
        return Container(
          padding: const EdgeInsets.all(8),
          child: const Icon(
            Icons.visibility,
            color: Colors.black,
          ),
        );
      case SuffixIconEnumType.visibilityoff:
        return Container(
          padding: const EdgeInsets.all(8),
          child: const Icon(
            Icons.visibility_off,
            color: Colors.black,
          ),
        );
      case SuffixIconEnumType.calendar:
        return Container(
          padding: const EdgeInsets.all(8.0),
          child: const Icon(
            Icons.calendar_today,
            color: Colors.black,
          ),
        );

      default:
        return SizedBox();
    }
  }
}

extension ValidationBorderTypeColor on ValidationBorderType {
  Color get validationTypeStatus {
    switch (this) {
      case ValidationBorderType.failure:
        return Colors.red;
      case ValidationBorderType.none:
        return Colors.black;
      case ValidationBorderType.success:
        return Color(0xFF32A64D);
      case ValidationBorderType.warning:
        return Color(0xffF37B21);
    }
  }

  Widget get validationTypeIcon {
    switch (this) {
      case ValidationBorderType.failure:
        return Icon(
          Icons.info_outline_rounded,
          size: 16,
          color: validationTypeStatus,
        );
      case ValidationBorderType.none:
        return SizedBox();
      case ValidationBorderType.success:
        return Icon(
          Icons.check_circle_outline,
          size: 16,
          color: validationTypeStatus,
        );
      case ValidationBorderType.warning:
        return Icon(
          Icons.check_circle_outline,
          size: 16,
          color: validationTypeStatus,
        );
    }
  }
}

enum BorderType {
  roundedRectangle,
  underline,
  none,
}

enum SuffixIconEnumType {
  close,
  visibility,
  visibilityoff,
  calendar,
}

enum ValidationBorderType {
  success,
  warning,
  failure,
  none,
}
