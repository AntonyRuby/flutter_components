import 'package:flutter/material.dart';
import 'package:flutter_components/app_theme.dart';
import 'package:flutter_components/color_resource.dart';

// ignore: must_be_immutable
class FlutterTabBar extends StatefulWidget {
  FlutterTabBar({
    Key? key,
    required this.tabs,
    this.onTap,
    this.lableStyle,
    this.lableColor,
    this.indicatorWeight,
    this.unselectedLabelColor,
    this.selectedTabDecoration,
    this.indicatorColor,
    this.labelPadding,
    this.isScrollable = false,
    this.backgroundColor,
    this.tabBorder,
    this.tabMargin,
    this.padding,
    this.indicatorPadding,
    this.physics,
    this.controller,
    this.prefixIcon,
    this.suffixIcon,
    this.isPrefixIcon = false,
    this.isSuffixIcon = false,
    this.isDisable = const [true, false],
  }) : super(key: key);
  final List<String> tabs;
  final List<dynamic>? prefixIcon;
  final List<dynamic>? suffixIcon;
  final Function(int)? onTap;
  final TextStyle? lableStyle;
  final Color? lableColor;
  final double? indicatorWeight;
  final Color? unselectedLabelColor;
  final Decoration? selectedTabDecoration;
  final Color? indicatorColor;
  final EdgeInsetsGeometry? labelPadding;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? tabMargin;
  final bool isScrollable;
  final Color? backgroundColor;
  final BoxBorder? tabBorder;
  final EdgeInsetsGeometry? indicatorPadding;
  final ScrollPhysics? physics;
  final TabController? controller;
  bool isPrefixIcon;
  bool isSuffixIcon;
  List<bool> isDisable;

  @override
  State<FlutterTabBar> createState() => _FlutterTabBarState();
}

class _FlutterTabBarState extends State<FlutterTabBar>
    with SingleTickerProviderStateMixin {
  TabController? controller;
  int selectedIndex = 0;
  @override
  void initState() {
    super.initState();
    controller = TabController(length: widget.tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    return Container(
      decoration: BoxDecoration(
        color: AppTheme().isDarkMode
            ? widget.backgroundColor ?? ColorResource.color282829
            : widget.backgroundColor ?? ColorResource.colorFFFFFF,
        border: widget.tabBorder ??
            Border(
                bottom: BorderSide(
                    color: AppTheme().isDarkMode
                        ? Colors.transparent
                        : ColorResource.colorF0F2F5)),
      ),
      width: double.infinity,
      child: Container(
        margin: widget.tabMargin ?? EdgeInsets.symmetric(horizontal: 16.0),
        alignment: Alignment.center,
        child: TabBar(
          controller: controller,
          padding: widget.padding ?? EdgeInsets.zero,
          isScrollable: widget.isScrollable,
          labelPadding: widget.labelPadding ?? EdgeInsets.zero,
          indicatorPadding: widget.indicatorPadding ?? EdgeInsets.zero,
          indicatorColor: widget.indicatorColor ?? ColorResource.colorD02127,
          labelStyle:
              widget.lableStyle ?? Theme.of(context).tabBarTheme.labelStyle,
          indicatorWeight: widget.indicatorWeight ?? 2.0,
          labelColor:
              widget.lableColor ?? Theme.of(context).tabBarTheme.labelColor,
          unselectedLabelColor: AppTheme().isDarkMode
              ? widget.unselectedLabelColor ?? ColorResource.colorFFFFFF
              : widget.unselectedLabelColor ??
                  Theme.of(context).tabBarTheme.unselectedLabelColor,
          indicator: brightness.toString() == Brightness.dark.toString()
              ? widget.selectedTabDecoration ??
                  BoxDecoration(
                    color: ColorResource.color4D4E50,
                    border: Border(
                      bottom: BorderSide(
                          width: 2.0, color: ColorResource.colorD02127),
                    ),
                  )
              : widget.selectedTabDecoration ??
                  BoxDecoration(
                    color: ColorResource.colorF0F2F5,
                    border: Border(
                      bottom: BorderSide(
                          width: 2.0, color: ColorResource.colorD02127),
                    ),
                  ),
          onTap: (int index) {
            setState(() {
              if (widget.isDisable[index] == false) {
                controller!.index = controller!.previousIndex;
              }
            });
          },
          tabs: [
            for (int index = 0; index < widget.tabs.length; index++)
              Tab(
                child: Container(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        children: [
                          if (widget.tabs.length ==
                              (widget.prefixIcon?.length ?? 0))
                            Icon(
                              widget.prefixIcon?[index],
                              size: 20,
                              color: AppTheme().isDarkMode
                                  ? ColorResource.colorFFFFFF
                                  : ColorResource.color000000,
                            ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            widget.tabs[index],
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                    backgroundColor: Colors.transparent,
                                    color: AppTheme().isDarkMode
                                        ? ColorResource.colorFFFFFF
                                        : ColorResource.color000000),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          if (widget.tabs.length ==
                              (widget.suffixIcon?.length ?? 0))
                            Icon(
                              widget.suffixIcon?[index],
                              size: 20,
                              color: AppTheme().isDarkMode
                                  ? ColorResource.colorFFFFFF
                                  : ColorResource.color000000,
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
