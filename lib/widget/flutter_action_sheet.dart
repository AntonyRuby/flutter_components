import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_components/color_resource.dart';
import 'package:flutter_components/widget/flutter_button.dart';

// ignore: must_be_immutable
class FlutterActionSheet extends StatefulWidget {
  final String? title;
  final String? message;
  final TextStyle? titleTextStyle;
  final TextStyle? messageTextStyle;
  final IconData? headerIcon;
  final List<String>? actionWidget;
  List<IconData>? icon;
  final String? cancelButton;
  final MainAxisAlignment? mainAxisAlignment;
  IconType? iconType;
  Function? onPressed;
  FlutterActionSheet({
    super.key,
    this.title,
    this.message,
    this.headerIcon,
    this.titleTextStyle,
    this.messageTextStyle,
    this.actionWidget,
    this.cancelButton,
    this.mainAxisAlignment,
    this.icon,
    this.iconType,
    this.onPressed,
  });

  @override
  State<FlutterActionSheet> createState() => _FlutterActionSheetState();
}

class _FlutterActionSheetState extends State<FlutterActionSheet> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Center(
        child: FlutterButton(
          buttonText: 'ActionSheet',
          buttonCallBack: () {
            showActionSheet(context);
          },
        ),
      ),
    );
  }

  void showActionSheet(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                widget.title!,
                style: widget.titleTextStyle ??
                    Theme.of(context).textTheme.button!.copyWith(fontSize: 20),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              widget.message!,
              style: widget.messageTextStyle ??
                  Theme.of(context).textTheme.button!.copyWith(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: ColorResource.color898A8B,
                      ),
            ),
          ],
        ),
        actions: [
          for (int index = 0; index < widget.actionWidget!.length; index++)
            CupertinoActionSheetAction(
                child: Padding(
                  padding: EdgeInsets.only(left: 12, right: 12),
                  child: Row(
                    mainAxisAlignment: widget.iconType != null
                        ? MainAxisAlignment.spaceBetween
                        : MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.actionWidget![index],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      widget.iconType != null
                          ? Icon(
                              widget.icon![index],
                            )
                          : SizedBox(),
                    ],
                  ),
                ),
                onPressed: () {
                  print(index);
                })
        ],
        cancelButton: FlutterButton(
          buttonText: widget.cancelButton,
          buttonCallBack: () {
            close(context);
          },
          buttonSize: ButtonSize.large,
        ),
      ),
    );
  }

  void close(BuildContext context) {
    Navigator.of(context).pop();
  }
}

enum IconType {
  textWithIcon,
  textWithoutIcon,
}
