import 'package:flutter/material.dart';
import 'package:flutter_components/color_resource.dart';

import '../app_theme.dart';

class FlutterSwitch extends StatefulWidget {
  const FlutterSwitch({
    Key? key,
    required this.value,
    required this.onTap,
    this.activeColor,
    this.inactiveColor,
    this.toggleColor,
    this.activeToggleColor,
    this.inactiveToggleColor,
    this.width = 45.0,
    this.height = 24.0,
    this.toggleSize = 22.0,
    this.borderRadius = 24.0,
    this.padding = 1.0,
    this.showOnOff = false,
    this.activeText,
    this.inactiveText,
    this.switchBorder,
    this.activeSwitchBorder,
    this.inactiveSwitchBorder,
    this.toggleBorder,
    this.activeToggleBorder,
    this.inactiveToggleBorder,
    this.activeIcon,
    this.inactiveIcon,
    this.duration = const Duration(milliseconds: 200),
    this.disabled = false,
    this.activeTextStyle,
    this.inActiveTextStyle,
    this.toggleMargin,
  })  : assert(
            (switchBorder == null || activeSwitchBorder == null) &&
                (switchBorder == null || inactiveSwitchBorder == null),
            'Cannot provide switchBorder when an activeSwitchBorder or inactiveSwitchBorder was given\n'
            'To give the switch a border, use "activeSwitchBorder: border" or "inactiveSwitchBorder: border".'),
        assert(
            (toggleBorder == null || activeToggleBorder == null) &&
                (toggleBorder == null || inactiveToggleBorder == null),
            'Cannot provide toggleBorder when an activeToggleBorder or inactiveToggleBorder was given\n'
            'To give the toggle a border, use "activeToggleBorder: color" or "inactiveToggleBorder: color".'),
        super(key: key);

  final bool value;

  final ValueChanged<bool> onTap;

  final bool showOnOff;

  final String? activeText;

  final String? inactiveText;

  final Color? activeColor;

  final TextStyle? activeTextStyle;

  final TextStyle? inActiveTextStyle;

  final Color? inactiveColor;

  final Color? toggleColor;

  final Color? activeToggleColor;

  final Color? inactiveToggleColor;

  final double width;

  final double height;

  final double toggleSize;

  final double borderRadius;

  final double padding;

  final BoxBorder? switchBorder;

  final BoxBorder? activeSwitchBorder;

  final BoxBorder? inactiveSwitchBorder;

  final BoxBorder? toggleBorder;

  final EdgeInsetsGeometry? toggleMargin;

  final BoxBorder? activeToggleBorder;

  final BoxBorder? inactiveToggleBorder;

  final Widget? activeIcon;

  final Widget? inactiveIcon;

  final Duration duration;

  final bool disabled;

  @override
  _FlutterSwitchState createState() => _FlutterSwitchState();
}

class _FlutterSwitchState extends State<FlutterSwitch>
    with SingleTickerProviderStateMixin {
  late final Animation _toggleAnimation;
  late final AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      value: widget.value ? 1.0 : 0.0,
      duration: widget.duration,
    );
    _toggleAnimation = AlignmentTween(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.linear,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(FlutterSwitch oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.value == widget.value) return;

    if (widget.value)
      _animationController.forward();
    else
      _animationController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    Color? _toggleColor = ColorResource.colorFFFFFF;
    Color? _switchColor = ColorResource.colorFFFFFF;
    Border? _switchBorder;
    Border? _toggleBorder;

    if (widget.value) {
      _toggleColor = widget.activeToggleColor ??
          widget.toggleColor ??
          ColorResource.colorFFFFFF;
      _switchColor = widget.activeColor ?? ColorResource.color32A64D;
      _switchBorder = widget.activeSwitchBorder as Border? ??
          widget.switchBorder as Border?;
      _toggleBorder = widget.activeToggleBorder as Border? ??
          widget.toggleBorder as Border?;
    } else {
      _toggleColor = widget.inactiveToggleColor ??
          widget.toggleColor ??
          ColorResource.colorFFFFFF;
      if (AppTheme().isDarkMode) {
        _switchColor = widget.inactiveColor ?? ColorResource.color404040;
      } else {
        _switchColor = widget.inactiveColor ?? ColorResource.colorD2D2D3;
      }

      _switchBorder = widget.inactiveSwitchBorder as Border? ??
          widget.switchBorder as Border?;
      _toggleBorder = widget.inactiveToggleBorder as Border? ??
          widget.toggleBorder as Border?;
    }

    double _textSpace = widget.width - widget.toggleSize;

    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Container(
          width: widget.width,
          child: Align(
            child: GestureDetector(
              onTap: () {
                if (!widget.disabled) {
                  if (widget.value)
                    _animationController.forward();
                  else
                    _animationController.reverse();

                  widget.onTap(!widget.value);
                }
              },
              child: Opacity(
                opacity: widget.disabled ? 0.4 : 1,
                child: Container(
                  width: widget.width,
                  height: widget.height,
                  padding: EdgeInsets.all(widget.padding),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(widget.borderRadius),
                    color: _switchColor,
                    border: _switchBorder,
                  ),
                  child: Stack(
                    children: <Widget>[
                      AnimatedOpacity(
                        opacity: widget.value ? 1.0 : 0.0,
                        duration: widget.duration,
                        child: Container(
                          width: _textSpace,
                          padding: EdgeInsets.symmetric(horizontal: 4.0),
                          alignment: Alignment.centerLeft,
                          child: _activeText,
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: AnimatedOpacity(
                          opacity: !widget.value ? 1.0 : 0.0,
                          duration: widget.duration,
                          child: Container(
                            width: _textSpace,
                            padding: EdgeInsets.symmetric(horizontal: 4.0),
                            alignment: Alignment.centerRight,
                            child: _inactiveText,
                          ),
                        ),
                      ),
                      Container(
                        child: Align(
                          alignment: _toggleAnimation.value,
                          child: Container(
                            width: widget.toggleSize,
                            height: widget.toggleSize,
                            margin: widget.toggleMargin ?? EdgeInsets.all(1),
                            padding: EdgeInsets.all(4.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _toggleColor,
                              border: _toggleBorder,
                            ),
                            child: FittedBox(
                              fit: BoxFit.contain,
                              child: Container(
                                child: Stack(
                                  children: [
                                    Center(
                                      child: AnimatedOpacity(
                                        opacity: widget.value ? 1.0 : 0.0,
                                        duration: widget.duration,
                                        child: widget.activeIcon,
                                      ),
                                    ),
                                    Center(
                                      child: AnimatedOpacity(
                                        opacity: !widget.value ? 1.0 : 0.0,
                                        duration: widget.duration,
                                        child: widget.inactiveIcon,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget get _activeText {
    if (widget.showOnOff) {
      return Text(
        widget.activeText ?? "On",
        style: widget.activeTextStyle ??
            TextStyle(
                color: Colors.white,
                fontSize: 9,
                fontWeight: FontWeight.w700,
                height: 1.0),
      );
    }

    return Text("");
  }

  Widget get _inactiveText {
    if (widget.showOnOff) {
      return Text(
        widget.inactiveText ?? "Off",
        style: widget.inActiveTextStyle ??
            TextStyle(
                color: Colors.white,
                fontSize: 8,
                fontWeight: FontWeight.w700,
                height: 1.0),
        textAlign: TextAlign.right,
      );
    }

    return Text("");
  }
}
