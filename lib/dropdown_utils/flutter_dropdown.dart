library animated_custom_dropdown;

export 'flutter_dropdown.dart';

import 'package:flutter/material.dart';
import 'package:flutter_components/color_resource.dart';
import 'package:flutter_components/dropdown_utils/dropdown_model.dart';
import 'package:flutter_components/widget/flutter_search_field.dart';

import '../app_theme.dart';

part 'animated_section.dart';
part 'dropdown_field.dart';
part 'dropdown_overlay.dart';
part 'overlay_builder.dart';

enum _SearchType { onListData }

class FlutterDropdown extends StatefulWidget {
  // final List<String> items;
  final List<String> dropdownList;
  final TextEditingController controller;
  final FocusNode focusNode;
  final String? hintText;
  final TextStyle? hintStyle;
  final String? lableText;
  final TextStyle? lableStyle;
  final TextStyle? selectedStyle;
  final TextStyle? listItemStyle;
  final BorderRadius? borderRadius;
  final Widget? fieldSuffixIcon;
  final Function(String)? onChanged;
  final Function(String?)? validation;
  final bool? excludeSelected;
  final Color? fillColor;
  final bool? canCloseOutsideBounds;
  final _SearchType? searchType;
  final bool isDisabled;
  final bool isEditable;
  final bool isShowStatus;
  final BorderSideEnum borderSide;
  final BorderColorEnum borderColorEnum;
  final TextAlignVertical textAlignVertical;
  final String? flag;
  final Widget? prefixIcon;
  final bool multiSelect;
  final bool displayUpLayout;
  final String? statusText;
  final Widget? statusIcon;

  FlutterDropdown(
      {Key? key,
      // required this.items,
      required this.dropdownList,
      required this.controller,
      required this.focusNode,
      this.hintText,
      this.hintStyle,
      this.lableText,
      this.lableStyle,
      this.selectedStyle,
      this.listItemStyle,
      this.borderRadius,
      this.fieldSuffixIcon,
      this.onChanged,
      this.validation,
      this.excludeSelected = true,
      this.isDisabled = false,
      this.fillColor = Colors.white,
      this.isEditable = false,
      this.isShowStatus = false,
      this.borderSide = BorderSideEnum.fill,
      this.borderColorEnum = BorderColorEnum.Active,
      this.textAlignVertical = TextAlignVertical.top,
      this.flag,
      this.prefixIcon,
      this.multiSelect = false,
      this.statusText,
      this.statusIcon,
      this.displayUpLayout = false})
      : assert(dropdownList.isNotEmpty,
            'Items list must contain at least one item.'),
        // assert(
        //   controller.text.isEmpty || dropdownList.contains(controller.text),
        //   'Controller value must match with one of the item in items list.',
        // ),
        searchType = null,
        canCloseOutsideBounds = true,
        super(key: key);

  FlutterDropdown.search({
    Key? key,
    // required this.items,
    required this.dropdownList,
    required this.controller,
    required this.focusNode,
    this.hintText,
    this.hintStyle,
    this.lableText,
    this.lableStyle,
    this.selectedStyle,
    this.listItemStyle,
    this.borderRadius,
    this.fieldSuffixIcon,
    this.onChanged,
    this.validation,
    this.excludeSelected = true,
    this.canCloseOutsideBounds = true,
    this.fillColor = Colors.white,
    this.isDisabled = false,
    this.isEditable = false,
    this.isShowStatus = false,
    this.borderSide = BorderSideEnum.fill,
    this.borderColorEnum = BorderColorEnum.Active,
    this.textAlignVertical = TextAlignVertical.top,
    this.flag,
    this.prefixIcon,
    this.multiSelect = false,
    this.statusText,
    this.statusIcon,
    this.displayUpLayout = false,
  })  : assert(dropdownList.isNotEmpty,
            'Items list must contain at least one item.'),
        // assert(
        //   controller.text.isEmpty || dropdownList.contains(controller.text),
        //   'Controller value must match with one of the item in items list.',
        // ),
        searchType = _SearchType.onListData,
        super(key: key);

  @override
  _FlutterDropdownState createState() => _FlutterDropdownState();
}

class _FlutterDropdownState extends State<FlutterDropdown> {
  final layerLink = LayerLink();

  @override
  Widget build(BuildContext context) {
    /// hint text
    /// //Select value
    final hintText = widget.hintText ?? '';

    // hint style :: if provided then merge with default
    final hintStyle = Theme.of(context)
        .textTheme
        .subtitle1!
        .copyWith(
            fontWeight: FontWeight.w400,
            backgroundColor: Colors.transparent,
            fontSize: 16,
            color: Color(0xFFA7A7A7))
        .merge(widget.hintStyle);

    // selected item style :: if provided then merge with default
    final selectedStyle = Theme.of(context)
        .textTheme
        .subtitle1!
        .copyWith(
          fontWeight: FontWeight.w500,
          backgroundColor: Colors.transparent,
          fontSize: 16,
        )
        .merge(widget.hintStyle);
    return _OverlayBuilder(
      overlay: (size, hideCallback) {
        List<DropdownModel> val = [];
        widget.dropdownList.asMap().forEach((index, value) {
          val.add(DropdownModel(value, index));
        });
        return _DropdownOverlay(
          // items: widget.items,
          dropdownList: val,
          controller: widget.controller,
          size: size,
          layerLink: layerLink,
          hideOverlay: hideCallback,
          headerStyle:
              widget.controller.text.isNotEmpty ? selectedStyle : hintStyle,
          hintText: hintText,
          listItemStyle: widget.listItemStyle,
          excludeSelected: widget.excludeSelected,
          canCloseOutsideBounds: widget.canCloseOutsideBounds,
          searchType: widget.searchType,
          multiSelect: widget.multiSelect,
          displayUpLayout: widget.displayUpLayout,
        );
      },
      child: (showCallback) {
        return CompositedTransformTarget(
          link: layerLink,
          child: _DropDownField(
            controller: widget.controller,
            focusNode: widget.focusNode,
            onTap: showCallback,
            style: selectedStyle,
            borderRadius: widget.borderRadius,
            hintStyle: hintStyle,
            hintText: hintText,
            suffixIcon: widget.fieldSuffixIcon,
            onChanged: widget.onChanged,
            validation: widget.validation,
            fillColor: widget.fillColor,
            isDisabled: widget.isDisabled,
            isEditable: widget.isEditable,
            isShowStatus: widget.isShowStatus,
            lableStyle: widget.lableStyle,
            lableText: widget.lableText,
            borderSideEnum: widget.borderSide,
            borderColorEnum: widget.borderColorEnum,
            textAlignVertical: widget.textAlignVertical,
            flag: widget.flag,
            prefixIcon: widget.prefixIcon,
            statusText: widget.statusText,
            statusIcon: widget.statusIcon,
          ),
        );
      },
    );
  }
}
