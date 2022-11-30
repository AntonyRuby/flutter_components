import 'package:flutter/material.dart';

class FlutterChip extends StatefulWidget {
  final String? label;
  final CircleAvatar? avatar;
  final Widget? deleteIcon;
  final EdgeInsetsGeometry? labelPadding;
  final TextStyle? labelStyle;
  final Color? backgroundColor;
  final OutlinedBorder? shape;
  const FlutterChip({
    super.key,
    required this.label,
    this.avatar,
    this.deleteIcon,
    this.labelPadding,
    this.labelStyle,
    this.backgroundColor,
    this.shape,
  });

  @override
  State<FlutterChip> createState() => _FlutterChipState();
}

class _FlutterChipState extends State<FlutterChip> {
  bool isDeletedChip = true;
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isDeletedChip,
      child: Chip(
        label: Text(
          widget.label!,
          style: TextStyle(
            backgroundColor: Colors.transparent,
          ),
        ),
        avatar: widget.avatar,
        backgroundColor: widget.backgroundColor,
        labelStyle: widget.labelStyle,
        labelPadding: widget.labelPadding,
        deleteIcon: widget.deleteIcon,
        onDeleted: () {
          print(isDeletedChip);
        },
        shape: widget.shape,
      ),
    );
  }
}
