import 'package:flutter/material.dart';
import 'package:flutter_components/widget/flutter_appbar.dart';
import 'package:flutter_components/widget/flutter_core_widgets.dart';

// ignore: must_be_immutable
class FlutterScaffold extends CoreWidgets {
  FlutterScaffold({
    Key? key,
    required this.child,
    this.isStatusBar = true,
    this.isAppBar = true,
    this.floatingActionButton,
    this.floatingActionButtonLocation = FloatingActionButtonLocation.endFloat,
    this.toolBarTitleString,
    this.toolBarSubTitle,
    this.toolbarIsSearchBoarder = false,
    this.toolBarCaptionText,
    this.toolBarElevation = 0.0,
    this.toolBarIconEnum = IconEnum.empty,
    this.toolBarActionMenuIconEnum = MenuIconEnum.empty,
    this.toolBarLabel,
    this.searchHint,
    this.toolBarShowSearch = false,
    this.toolBarNotificationCount = 0,
    this.toolBarTitleSpacing,
    this.floatingIcon,
    this.toolBarTextController,
    this.toolBarCallback,
    this.bottomNavigationBar,
    this.resizeToAvoidBottomInset,
  }) : super(key: key);

  Widget child;
  bool? isStatusBar;
  bool? isAppBar;
  FloatingActionButtonLocation? floatingActionButtonLocation;
  FloatingActionButton? floatingActionButton;
  final bool? toolBarShowSearch;
  final bool? toolbarIsSearchBoarder;
  late final String? toolBarTitleString;
  final String? toolBarSubTitle;
  final String? toolBarLabel;
  final String? searchHint;
  final String? toolBarCaptionText;
  final int? toolBarNotificationCount;
  final IconEnum? toolBarIconEnum;
  final MenuIconEnum? toolBarActionMenuIconEnum;
  TextEditingController? toolBarTextController = TextEditingController();
  final double? toolBarTitleSpacing;
  final IconData? floatingIcon;
  final double? toolBarElevation;
  Function(dynamic)? toolBarCallback;
  final Widget? bottomNavigationBar;
  dynamic resizeToAvoidBottomInset;

  @override
  M2PScaffoldWidgetState createState() => M2PScaffoldWidgetState();
}

class M2PScaffoldWidgetState extends State<FlutterScaffold> {
  @override
  Widget build(BuildContext context) {
    double height = kToolbarHeight;
    if (widget.toolBarSubTitle != null) {
      // ignore: unnecessary_statements
      height + kToolbarHeight;
    }

    return Scaffold(
      appBar: widget.isAppBar!
          ? PreferredSize(
              preferredSize: Size(double.infinity, sizedBoxHeight()),
              child: FlutterAppbar(
                toolBarTitleString: widget.toolBarTitleString,
                toolBarLabel: widget.toolBarLabel,
                toolBarSubTitle: widget.toolBarSubTitle,
                callback: widget.toolBarCallback,
                searchHint: widget.searchHint,
                toolbarIsSearchBoarder: widget.toolbarIsSearchBoarder,
                toolBarActionMenuIconEnum: widget.toolBarActionMenuIconEnum,
                toolBarCaptionText: widget.toolBarCaptionText,
                toolBarElevation: widget.toolBarElevation,
                toolBarIconEnum: widget.toolBarIconEnum,
                toolBarNotificationCount: widget.toolBarNotificationCount,
                toolBarShowSearch: widget.toolBarShowSearch,
                toolBarTextController: widget.toolBarTextController,
                toolBarTitleSpacing: widget.toolBarTitleSpacing,
              ),
            )
          : null,
      resizeToAvoidBottomInset: widget.resizeToAvoidBottomInset,
      body: SingleChildScrollView(
        child: Column(
          children: [widget.child],
        ),
      ),
      bottomNavigationBar: widget.bottomNavigationBar,
      floatingActionButtonLocation: widget.floatingActionButtonLocation,
      floatingActionButton: widget.floatingIcon != null
          ? FloatingActionButton(
              elevation: 0.0,
              backgroundColor: const Color(0xFFE57373),
              onPressed: () {
                widget.toolBarCallback!('floatingClick');
              },
              child: Icon(
                widget.floatingIcon,
                color:
                    Theme.of(context).floatingActionButtonTheme.backgroundColor,
              ),
            )
          : SizedBox(),
    );
  }

  double sizedBoxHeight() {
    return widget.toolBarSubTitle != null
        ? kToolbarHeight + kToolbarHeight
        : kToolbarHeight;
  }
}
