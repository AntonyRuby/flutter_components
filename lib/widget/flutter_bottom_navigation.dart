import 'package:flutter/material.dart';

class FlutterBottomNavigationBar extends StatefulWidget {
  FlutterBottomNavigationBar({
    Key? key,
    required this.items,
    this.onTap,
    this.currentIndex = 0,
    this.elevation,
    this.type,
    // Color? fixedColor,
    this.backgroundColor,
    this.iconSize = 24.0,
    this.selectedItemColor = const Color(0xFFD02127),
    this.unselectedItemColor,
    this.selectedIconTheme,
    this.unselectedIconTheme,
    this.selectedFontSize = 14.0,
    this.unselectedFontSize = 12.0,
    this.selectedLabelStyle,
    this.unselectedLabelStyle,
    this.showSelectedLabels,
    this.showUnselectedLabels,
    this.mouseCursor,
    this.enableFeedback,
    this.landscapeLayout,
    this.borderRadius,
  })  : assert(items != null),
        assert(items.length >= 2),
        assert(
          items.every((BottomNavigationBarItem item) => item.label != null),
          'Every item must have a non-null label',
        ),
        assert(0 <= currentIndex && currentIndex < items.length),
        assert(elevation == null || elevation >= 0.0),
        assert(iconSize != null && iconSize >= 0.0),
        assert(selectedFontSize != null && selectedFontSize >= 0.0),
        assert(unselectedFontSize != null && unselectedFontSize >= 0.0),
        // selectedItemColor = selectedItemColor ?? fixedColor,
        super(key: key);

  /// Defines the appearance of the button items that are arrayed within the
  /// bottom navigation bar.
  final List<BottomNavigationBarItem> items;
  final ValueChanged<int>? onTap;
  final int currentIndex;
  final double? elevation;
  final BottomNavigationBarType? type;
  // Color? get fixedColor => selectedItemColor;
  final Color? backgroundColor;
  final double iconSize;
  final Color? selectedItemColor;
  final Color? unselectedItemColor;
  final IconThemeData? selectedIconTheme;
  final IconThemeData? unselectedIconTheme;
  final TextStyle? selectedLabelStyle;
  final TextStyle? unselectedLabelStyle;
  final double selectedFontSize;
  final double unselectedFontSize;
  final bool? showUnselectedLabels;
  final bool? showSelectedLabels;
  final MouseCursor? mouseCursor;
  final bool? enableFeedback;
  final BorderRadiusGeometry? borderRadius;

  final BottomNavigationBarLandscapeLayout? landscapeLayout;

  @override
  State<FlutterBottomNavigationBar> createState() =>
      _FlutterBottomNavigationBarState();
}

class _FlutterBottomNavigationBarState
    extends State<FlutterBottomNavigationBar> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: widget.borderRadius,
      ),
      child: BottomNavigationBar(
        items: widget.items,
        backgroundColor:
            widget.backgroundColor ?? Theme.of(context).bottomAppBarColor,
        onTap: (val) {
          widget.onTap!(val);
        },
        currentIndex: widget.currentIndex,
        selectedFontSize: widget.selectedFontSize,
        unselectedFontSize: widget.unselectedFontSize,
        selectedItemColor: widget.selectedItemColor ??
            Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
        unselectedItemColor: widget.unselectedItemColor ??
            Theme.of(context).bottomNavigationBarTheme.unselectedItemColor,
        selectedLabelStyle: widget.selectedLabelStyle ??
            Theme.of(context).bottomNavigationBarTheme.selectedLabelStyle,
        unselectedLabelStyle: widget.unselectedLabelStyle ??
            Theme.of(context).bottomNavigationBarTheme.unselectedLabelStyle,
        type: widget.type ?? BottomNavigationBarType.fixed,
        landscapeLayout: widget.landscapeLayout,
        // fixedColor: widget.fixedColor,
        elevation: widget.elevation,
        showSelectedLabels: widget.showSelectedLabels,
        showUnselectedLabels: widget.showUnselectedLabels,
        selectedIconTheme: widget.selectedIconTheme ??
            Theme.of(context).bottomNavigationBarTheme.selectedIconTheme,
        mouseCursor: widget.mouseCursor,
        iconSize: widget.iconSize,
        unselectedIconTheme: widget.unselectedIconTheme ??
            Theme.of(context).bottomNavigationBarTheme.unselectedIconTheme,
        enableFeedback: widget.enableFeedback,
      ),
    );
  }
}
