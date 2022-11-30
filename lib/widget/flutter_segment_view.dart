import 'package:flutter/material.dart';
import 'package:flutter_components/app_theme.dart';
import 'package:flutter_components/color_resource.dart';

typedef ValueChanged<T, M> = void Function(T value, M valueM);

// ignore: must_be_immutable
class FlutterSegment extends StatefulWidget {
  final double height;
  final double width;
  final List<String> tabs;
  final ValueChanged<int, String> selected;
  final Color normalBackgroundColor;
  final Color activeBackgroundColor;
  final Color normalTitleColor;
  final Color activeTitleColor;
  final TextStyle activeTitleStyle;
  final Color borderColor;
  final double radius;
  final bool isScrollable;
  final bool selectNone;

  FlutterSegment({
    required this.tabs,
    required this.selected,
    this.height = 40,
    this.width = double.infinity,
    this.normalBackgroundColor = Colors.white,
    this.activeBackgroundColor = Colors.blue,
    this.normalTitleColor = Colors.blue,
    this.activeTitleColor = Colors.white,
    this.activeTitleStyle = const TextStyle(fontSize: 18, color: Colors.white),
    this.radius = 0,
    this.borderColor = Colors.blue,
    this.selectNone = false,
    this.isScrollable = false,
  });

  late _FlutterSegmentState state;

  @override
  _FlutterSegmentState createState() {
    state = _FlutterSegmentState();
    return state;
  }
}

class _FlutterSegmentState extends State<FlutterSegment>
    with SingleTickerProviderStateMixin {
  late TabController _ctrl;

  @override
  void initState() {
    super.initState();
    _ctrl = TabController(length: widget.tabs.length, vsync: this);
    _ctrl.addListener(() {
      if (_ctrl.indexIsChanging) {
        setState(() {});
        widget.selected(_ctrl.index, widget.tabs[_ctrl.index]);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 25,
        right: 25,
      ),
      child: SizedBox(
        height: widget.height,
        width: widget.width,
        child: Container(
          padding: EdgeInsets.fromLTRB(6, 6, 6, 6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(widget.radius)),
            color: AppTheme().isDarkMode
                ? ColorResource.color282829
                : ColorResource.colorF0F2F5,
          ),
          child: TabBar(
            controller: _ctrl,
            tabs: widget.tabs.map((f) {
              var idx = widget.tabs.indexOf(f);
              return Tab(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.all(Radius.circular(widget.radius)),
                    color: (idx == _ctrl.index && !widget.selectNone)
                        ? AppTheme().isDarkMode
                            ? ColorResource.color4D4E50
                            : ColorResource.colorFFFFFF
                        : AppTheme().isDarkMode
                            ? ColorResource.color282829
                            : ColorResource.colorF0F2F5,
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        f,
                        style: (idx == _ctrl.index && !widget.selectNone)
                            ? Theme.of(context).textTheme.titleSmall!.copyWith(
                                backgroundColor: Colors.transparent,
                                color: AppTheme().isDarkMode
                                    ? ColorResource.colorFFFFFF
                                    : ColorResource.color000000)
                            : Theme.of(context).textTheme.titleSmall!.copyWith(
                                backgroundColor: Colors.transparent,
                                color: AppTheme().isDarkMode
                                    ? ColorResource.color808080
                                    : ColorResource.color000000),
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
            isScrollable: widget.isScrollable,
            labelPadding: EdgeInsets.zero,
            indicator: BoxDecoration(
              color: Colors.transparent,
            ),
          ),
        ),
      ),
    );
  }

  BorderRadius circleRadius(int idx) {
    if (idx == 0) {
      return BorderRadius.only(
        topLeft: Radius.circular(widget.radius),
        bottomLeft: Radius.circular(widget.radius),
      );
    }

    if (idx == widget.tabs.length - 1) {
      return BorderRadius.only(
        topRight: Radius.circular(widget.radius),
        bottomRight: Radius.circular(widget.radius),
      );
    }

    return BorderRadius.zero;
  }
}
