import 'package:flutter/material.dart';
import 'package:flutter_components/app_theme.dart';
import 'package:flutter_components/color_resource.dart';
import 'package:flutter_components/widget/flutter_button.dart';
import 'package:flutter_components/widget/flutter_input_fields/flutter_input_fields_widget.dart';

// ignore: must_be_immutable
class FlutterAlertDialog extends StatefulWidget {
  final String? title;
  final String? image;
  final String? description;
  final bool isLabelField;
  CrossAxisAlignment? crossAxisAlignment;
  MainAxisAlignment? mainAxisAlignment;
  final bool button;
  final TextStyle? textStyle;
  final TextStyle? descriptionTextStyle;

  FlutterAlertDialog(
      // ignore: invalid_required_positional_param
      {
    Key? key,
    required this.title,
    this.image,
    this.description,
    this.button = false,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.isLabelField = false,
    this.textStyle,
    this.descriptionTextStyle,
  }) : super(key: key);

  @override
  _FlutterAlertDialogState createState() => _FlutterAlertDialogState();
}

class _FlutterAlertDialogState extends State<FlutterAlertDialog> {
  TextEditingController textEditingController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Center(
        child: ElevatedButton(
          child: Text('Alert Dialog'),
          onPressed: () {
            _showDialog(context);
          },
        ),
      ),
    );
  }

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisAlignment: widget.mainAxisAlignment!,
          children: [
            AlertDialog(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),
              backgroundColor:
                  Theme.of(context).textTheme.subtitle1!.backgroundColor,
              contentPadding: EdgeInsets.zero,
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: widget.crossAxisAlignment!,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Theme.of(context)
                                    .textTheme
                                    .subtitle1!
                                    .color!,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(90.0),
                              ),
                            ),
                            child: Icon(
                              Icons.close,
                              color:
                                  Theme.of(context).textTheme.subtitle1!.color!,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                    widget.image != null
                        ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              widget.image!,
                              width: 50,
                              height: 50,
                            ),
                          )
                        : SizedBox(),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Text(
                        widget.title ?? '',
                        style: widget.textStyle ??
                            Theme.of(context).textTheme.bodyText1!.copyWith(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                  color: AppTheme().isDarkMode
                                      ? ColorResource.colorFFFFFF
                                      : ColorResource.color282829,
                                ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      child: widget.isLabelField
                          ? Text(
                              widget.description ?? '',
                              style: widget.descriptionTextStyle ??
                                  Theme.of(context)
                                      .textTheme
                                      .subtitle1!
                                      .copyWith(
                                        fontSize: 16,
                                      ),
                              maxLines: 2,
                            )
                          : Text(
                              widget.description ?? '',
                              style: widget.descriptionTextStyle ??
                                  Theme.of(context)
                                      .textTheme
                                      .subtitle1!
                                      .copyWith(
                                        fontSize: 16,
                                      ),
                              textAlign: TextAlign.center,
                              maxLines: 2,
                            ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    widget.isLabelField
                        ? Column(
                            children: [
                              FlutterInputFields(
                                'hintText',
                                textEditingController,
                                borderType: BorderType.roundedRectangle,
                              ),
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: FlutterButton(
                                  buttonText: 'Button',
                                  isEnabled: true,
                                ),
                              )
                            ],
                          )
                        : widget.button
                            ? textButtonWidget()
                            : Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: primaryButtonWidget(),
                              ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget textButtonWidget() {
    return Container(
      height: 45,
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Colors.grey,
          ),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () {},
            child: Text(
              'Learn More',
              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                    color: ColorResource.color0071EB,
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                  ),
              // textAlign: TextAlign.center,
            ),
          ),
          VerticalDivider(
            color: Colors.grey,
          ),
          // GestureDetector(
          //   onTap: () {},
          //   child: Text(
          //     'Cancel',
          //     style: Theme.of(context).textTheme.subtitle1!.copyWith(
          //           color: ColorResource.color0071EB,
          //           fontSize: 17,
          //           fontWeight: FontWeight.w400,
          //         ),
          //     textAlign: TextAlign.center,
          //   ),
          // ),
          // VerticalDivider(
          //   color: Colors.grey,
          // ),
          GestureDetector(
            onTap: () {},
            child: Text(
              'Okay',
              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                    color: ColorResource.color0071EB,
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                  ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Widget primaryButtonWidget() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Align(
          alignment: Alignment.center,
          child: FlutterButton(
            buttonText: 'Learn More',
            isEnabled: true,
            buttonSize: ButtonSize.small,
            buttonType: ButtonType.Secondary,
            buttonCategory: ButtonCategory.Success,
          ),
        ),
        // FlutterButton(
        //   buttonText: 'Cancel',
        //   isEnabled: true,
        //   buttonSize: ButtonSize.small,
        // ),
        // FlutterButton(
        //   buttonText: 'Okay',
        //   isEnabled: true,
        //   buttonSize: ButtonSize.small,
        // ),
      ],
    );
  }
}
