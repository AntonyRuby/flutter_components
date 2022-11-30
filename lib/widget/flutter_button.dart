import 'package:flutter/material.dart';
import 'package:flutter_components/app_theme.dart';
import 'package:flutter_components/color_resource.dart';

// ignore: must_be_immutable
class FlutterButton extends StatefulWidget implements PreferredSizeWidget {
  final ButtonSize? buttonSize;
  final ButtonType? buttonType;

  final IconData? leadingIcon;

  final String? buttonText;
  Function()? buttonCallBack;

  final IconData? trailingIcon;
  final bool? isEnabled;
  final ButtonCategory? buttonCategory;
  double? width;

  FlutterButton(
      {Key? key,
      this.buttonSize = ButtonSize.medium,
      this.leadingIcon,
      this.buttonText,
      this.buttonCallBack,
      this.trailingIcon,
      this.isEnabled = false,
      this.buttonType = ButtonType.Primary,
      this.width,
      this.buttonCategory = ButtonCategory.Normal})
      : super(key: key);

  @override
  State<FlutterButton> createState() => _FlutterButtonState();

  @override
  Size get preferredSize => throw UnimplementedError();
}

class _FlutterButtonState extends State<FlutterButton> {
  bool isSingleIcon = false;

  Color getOutlinedButtonTextColor(Set<MaterialState> states) {
    // const Set<MaterialState> interactiveStates = <MaterialState>{
    //   MaterialState.disabled
    // };
    if (states.contains(MaterialState.disabled)) {
      if (widget.buttonCategory == ButtonCategory.Success) {
        return AppTheme().isDarkMode
            ? ColorResource.color78C489
            : ColorResource.color78C489;
      }
      if (widget.buttonCategory == ButtonCategory.Info) {
        return AppTheme().isDarkMode
            ? ColorResource.color66C1CF
            : ColorResource.color66C1CF;
      }
      if (widget.buttonCategory == ButtonCategory.Danger) {
        return AppTheme().isDarkMode
            ? ColorResource.colorEE7C85
            : ColorResource.colorEE7C85;
      }
      if (widget.buttonCategory == ButtonCategory.Warning) {
        return AppTheme().isDarkMode
            ? ColorResource.colorEDC859
            : ColorResource.colorEDC859;
      }
      if (widget.buttonCategory == ButtonCategory.Normal) {
        return AppTheme().isDarkMode
            ? ColorResource.color4D4E50
            : ColorResource.colorAFAEAF;
      }
    } else {
      if (widget.buttonCategory == ButtonCategory.Success) {
        return AppTheme().isDarkMode
            ? ColorResource.color32A64D
            : ColorResource.color32A64D;
      }
      if (widget.buttonCategory == ButtonCategory.Info) {
        return AppTheme().isDarkMode
            ? ColorResource.color17A1B7
            : ColorResource.color17A1B7;
      }
      if (widget.buttonCategory == ButtonCategory.Danger) {
        return AppTheme().isDarkMode
            ? ColorResource.colorE63946
            : ColorResource.colorE63946;
      }
      if (widget.buttonCategory == ButtonCategory.Warning) {
        return AppTheme().isDarkMode
            ? ColorResource.colorE4AC04
            : ColorResource.colorE4AC04;
      }
    }
    return AppTheme().isDarkMode
        ? ColorResource.colorFFFFFF
        : ColorResource.color151515;
  }

  BorderSide getOutlinedButtonBorder(Set<MaterialState> states) {
    if (states.contains(MaterialState.disabled)) {
      if (widget.buttonCategory == ButtonCategory.Success) {
        return AppTheme().isDarkMode
            ? BorderSide(color: ColorResource.color78C489)
            : BorderSide(color: ColorResource.color78C489);
      }
      if (widget.buttonCategory == ButtonCategory.Info) {
        return AppTheme().isDarkMode
            ? BorderSide(color: ColorResource.color66C1CF)
            : BorderSide(color: ColorResource.color66C1CF);
      }
      if (widget.buttonCategory == ButtonCategory.Danger) {
        return AppTheme().isDarkMode
            ? BorderSide(color: ColorResource.colorEE7C85)
            : BorderSide(color: ColorResource.colorEE7C85);
      }
      if (widget.buttonCategory == ButtonCategory.Warning) {
        return AppTheme().isDarkMode
            ? BorderSide(color: ColorResource.colorEDC859)
            : BorderSide(color: ColorResource.colorEDC859);
      }
      if (widget.buttonCategory == ButtonCategory.Normal) {
        return AppTheme().isDarkMode
            ? BorderSide(color: ColorResource.color4D4E50)
            : BorderSide(color: ColorResource.colorAFAEAF);
      }
    } else {
      if (widget.buttonCategory == ButtonCategory.Success) {
        return AppTheme().isDarkMode
            ? BorderSide(color: ColorResource.color32A64D)
            : BorderSide(color: ColorResource.color32A64D);
      }
      if (widget.buttonCategory == ButtonCategory.Info) {
        return AppTheme().isDarkMode
            ? BorderSide(color: ColorResource.color17A1B7)
            : BorderSide(color: ColorResource.color17A1B7);
      }
      if (widget.buttonCategory == ButtonCategory.Danger) {
        return AppTheme().isDarkMode
            ? BorderSide(color: ColorResource.colorE63946)
            : BorderSide(color: ColorResource.colorE63946);
      }
      if (widget.buttonCategory == ButtonCategory.Warning) {
        return AppTheme().isDarkMode
            ? BorderSide(color: ColorResource.colorE4AC04)
            : BorderSide(color: ColorResource.colorE4AC04);
      }

      // return AppTheme().isDarkMode
      //     ? BorderSide(color: ColorResource.colorFFFFFF)
      //     : BorderSide(color: ColorResource.color151515);
    }
    return AppTheme().isDarkMode
        ? BorderSide(color: ColorResource.colorFFFFFF)
        : BorderSide(color: ColorResource.color151515);
  }

  Color getBackgroundColor(Set<MaterialState> states) {
    // const Set<MaterialState> interactiveStates = <MaterialState>{
    //   MaterialState.disabled
    // };
    if (states.contains(MaterialState.disabled)) {
      // return ColorResource.colorE2E5EB;
      if (widget.buttonCategory! == ButtonCategory.Success) {
        return AppTheme().isDarkMode
            ? ColorResource.color78C489
            : ColorResource.colorBBE2C4;
      } else if (widget.buttonCategory! == ButtonCategory.Warning) {
        return AppTheme().isDarkMode
            ? ColorResource.colorEDC859
            : ColorResource.colorF6E4AC;
      } else if (widget.buttonCategory! == ButtonCategory.Info) {
        return AppTheme().isDarkMode
            ? ColorResource.color66C1CF
            : ColorResource.colorB2E0E7;
      } else if (widget.buttonCategory! == ButtonCategory.Danger) {
        return AppTheme().isDarkMode
            ? ColorResource.colorEE7C85
            : ColorResource.colorF7BEC2;
      } else if (widget.buttonCategory! == ButtonCategory.Normal) {
        return AppTheme().isDarkMode
            ? ColorResource.colorAFAEAF
            : ColorResource.color898A8B;
      }
    } else {
      if (widget.buttonCategory! == ButtonCategory.Success) {
        return AppTheme().isDarkMode
            ? ColorResource.color32A64D
            : ColorResource.color32A64D;
      } else if (widget.buttonCategory! == ButtonCategory.Warning) {
        return AppTheme().isDarkMode
            ? ColorResource.colorE4AC04
            : ColorResource.colorE4AC04;
      } else if (widget.buttonCategory! == ButtonCategory.Info) {
        return AppTheme().isDarkMode
            ? ColorResource.color17A1B7
            : ColorResource.color17A1B7;
      } else if (widget.buttonCategory == ButtonCategory.Danger) {
        return AppTheme().isDarkMode
            ? ColorResource.colorD02127
            : ColorResource.colorD02127;
      }
    }
    return AppTheme().isDarkMode
        ? ColorResource.colorFFFFFF
        : ColorResource.color151515;
  }

  Color getTextColor(Set<MaterialState> states) {
    // const Set<MaterialState> interactiveStates = <MaterialState>{
    //   MaterialState.disabled
    // };
    if (states.contains(MaterialState.disabled)) {
      // return ColorResource.colorE2E5EB;
      if (widget.buttonCategory! == ButtonCategory.Success) {
        return AppTheme().isDarkMode
            ? ColorResource.colorFFFFFF
            : ColorResource.colorFFFFFF;
      } else if (widget.buttonCategory! == ButtonCategory.Warning) {
        return AppTheme().isDarkMode
            ? ColorResource.colorFFFFFF
            : ColorResource.colorFFFFFF;
      } else if (widget.buttonCategory! == ButtonCategory.Info) {
        return AppTheme().isDarkMode
            ? ColorResource.colorFFFFFF
            : ColorResource.colorFFFFFF;
      } else if (widget.buttonCategory! == ButtonCategory.Danger) {
        return AppTheme().isDarkMode
            ? ColorResource.colorFFFFFF
            : ColorResource.colorFFFFFF;
      } else if (widget.buttonCategory! == ButtonCategory.Normal) {
        return AppTheme().isDarkMode
            ? ColorResource.color4D4E50
            : ColorResource.colorE2E5EB;
      }
    } else {
      if (widget.buttonCategory! == ButtonCategory.Success) {
        return AppTheme().isDarkMode
            ? ColorResource.colorFFFFFF
            : ColorResource.colorFFFFFF;
      } else if (widget.buttonCategory! == ButtonCategory.Warning) {
        return AppTheme().isDarkMode
            ? ColorResource.colorFFFFFF
            : ColorResource.colorFFFFFF;
      } else if (widget.buttonCategory! == ButtonCategory.Info) {
        return AppTheme().isDarkMode
            ? ColorResource.colorFFFFFF
            : ColorResource.colorFFFFFF;
      } else if (widget.buttonCategory == ButtonCategory.Danger) {
        return AppTheme().isDarkMode
            ? ColorResource.colorFFFFFF
            : ColorResource.colorFFFFFF;
      }
    }
    return AppTheme().isDarkMode
        ? ColorResource.color151515
        : ColorResource.colorFFFFFF;
  }

  @override
  void initState() {
    super.initState();
    checkSingleIcon();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.buttonSize!.height,
      width: widget.width,
      //  width: isSingleIcon ? widget.buttonSize!.width : 343,
      child: widget.buttonType == ButtonType.Primary
          ? ElevatedButton(
              style: widget.buttonCategory! == ButtonCategory.Normal
                  ? ElevatedButton.styleFrom(
                      minimumSize: Size.zero, // Set this
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      primary: getBackgroundColor(<MaterialState>{}))
                  : ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.disabled)) {
                          return getBackgroundColor(
                              <MaterialState>{MaterialState.disabled});
                        }
                        return getBackgroundColor(<MaterialState>{});
                      }),
                      minimumSize: MaterialStateProperty.all(Size.zero),
                      padding: MaterialStateProperty.all(EdgeInsets.zero)),
              onPressed: widget.buttonCallBack ?? () {},
              child: isSingleIcon
                  ? singleIcon()
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        sizedBoxwithWidth(8),
                        leadingIcon(),
                        sizedBoxwithWidth(8),
                        textButton(),
                        sizedBoxwithWidth(8),
                        trailingIcon(),
                      ],
                    ),
            )
          : OutlinedButton(
              style: widget.buttonCategory! == ButtonCategory.Normal
                  ? OutlinedButton.styleFrom(
                      minimumSize: Size.zero, // Set this
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      side: getOutlinedButtonBorder(<MaterialState>{}),
                    )
                  // primary: getBackgroundColor(<MaterialState>{})),
                  : ButtonStyle(
                      side: MaterialStateProperty.resolveWith<BorderSide>(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.disabled)) {
                          return getOutlinedButtonBorder(
                              <MaterialState>{MaterialState.disabled});
                        }
                        return getOutlinedButtonBorder(<MaterialState>{});
                      }),
                      textStyle: MaterialStateProperty.resolveWith<TextStyle>(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.disabled)) {
                          return TextStyle(
                            color: getOutlinedButtonTextColor(
                                <MaterialState>{MaterialState.disabled}),
                          );
                        }
                        return TextStyle(
                            color:
                                getOutlinedButtonTextColor(<MaterialState>{}));
                      }),
                      minimumSize: MaterialStateProperty.all(Size.zero),
                      padding: MaterialStateProperty.all(EdgeInsets.zero)),
              // onPressed: widget.isEnabled! ? () {} : null,
              onPressed: widget.buttonCallBack ?? () {},
              child: isSingleIcon
                  ? singleIcon()
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // sizedBoxwithWidth(8),
                        leadingIcon(),
                        // sizedBoxwithWidth(8),
                        textButton(),
                        // sizedBoxwithWidth(8),
                        trailingIcon(),
                      ],
                    ),
            ),
    );
  }

  Widget sizedBoxwithWidth(double width) {
    return SizedBox(
      width: width,
    );
  }

  Widget leadingIcon() {
    Widget leadingView = SizedBox();
    if (widget.leadingIcon != null) {
      return Icon(
        widget.leadingIcon,
        size: 24,
        color: widget.buttonType == ButtonType.Primary
            ? getTextColor(<MaterialState>{
                widget.isEnabled!
                    ? MaterialState.focused
                    : MaterialState.disabled
              })
            : getOutlinedButtonTextColor(<MaterialState>{
                widget.isEnabled!
                    ? MaterialState.focused
                    : MaterialState.disabled
              }),
      );
    }
    return leadingView;
  }

  Widget singleIcon() {
    Widget singleIconView = SizedBox();
    if (widget.buttonText == null) {
      if (widget.leadingIcon == null && widget.trailingIcon == null) {
        setState(() {
          isSingleIcon = true;
        });
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Icon(
            Icons.add,
            size: 24,
            color: widget.buttonType == ButtonType.Primary
                ? getTextColor(<MaterialState>{
                    widget.isEnabled!
                        ? MaterialState.focused
                        : MaterialState.disabled
                  })
                : getOutlinedButtonTextColor(<MaterialState>{
                    widget.isEnabled!
                        ? MaterialState.focused
                        : MaterialState.disabled
                  }),
          ),
        );
      }
    }
    return singleIconView;
  }

  Widget trailingIcon() {
    Widget trailingView = SizedBox();
    if (widget.trailingIcon != null) {
      return Icon(
        widget.trailingIcon,
        size: 24,
        color: widget.buttonType == ButtonType.Primary
            ? getTextColor(
                <MaterialState>{
                  widget.isEnabled!
                      ? MaterialState.focused
                      : MaterialState.disabled
                },
                // color: widget.isEnabled!
                //     ? ColorResource.colorFFFFFF
                //     : ColorResource.colorE2E5EB,
              )
            : getOutlinedButtonTextColor(
                <MaterialState>{
                  widget.isEnabled!
                      ? MaterialState.focused
                      : MaterialState.disabled
                },
              ),
      );
    }
    return trailingView;
  }

  Widget textButton() {
    Widget textView = SizedBox();
    if (widget.buttonText != null) {
      return Padding(
        padding: const EdgeInsets.only(left: 12, right: 12),
        child: Text(
          widget.buttonText!,
          style: TextStyle(
            color: widget.buttonType == ButtonType.Primary
                ? getTextColor(<MaterialState>{
                    widget.isEnabled!
                        ? MaterialState.focused
                        : MaterialState.disabled
                  })
                : getOutlinedButtonTextColor(<MaterialState>{
                    widget.isEnabled!
                        ? MaterialState.focused
                        : MaterialState.disabled
                  }),
          ),
          textAlign: TextAlign.center,
        ),
      );
    }
    return textView;
  }

  checkSingleIcon() {
    if (widget.buttonText == null) {
      if (widget.leadingIcon == null && widget.trailingIcon == null) {
        setState(() {
          isSingleIcon = true;
        });
      }
    }
  }
}

enum ButtonSize { small, medium, large }

extension ButtonSizeExtension on ButtonSize {
  double get height {
    switch (this) {
      case ButtonSize.large:
        return 48;

      case ButtonSize.medium:
        return 40;

      case ButtonSize.small:
        return 32;

      default:
        return 40;
    }
  }
}

extension ButtonWidth on ButtonSize {
  double get width {
    switch (this) {
      case ButtonSize.large:
        return 48;

      case ButtonSize.medium:
        return 40;

      case ButtonSize.small:
        return 32;

      default:
        return 40;
    }
  }
}

enum ButtonType {
  Primary,
  Secondary,
}

enum ButtonCategory { Normal, Success, Warning, Info, Danger }
