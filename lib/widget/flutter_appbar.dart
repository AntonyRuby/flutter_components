import 'package:flutter/material.dart';
import 'package:flutter_components/color_resource.dart';

// ignore: must_be_immutable
class FlutterAppbar extends AppBar implements PreferredSizeWidget {
  final bool? toolBarShowSearch;
  final bool? toolbarIsSearchBoarder;
  late final String? toolBarTitleString;
  final String? toolBarSubTitle;
  final String? toolBarLabel;
  final String? toolBarCaptionText;
  final String? searchHint;
  final int? toolBarNotificationCount;
  final IconEnum? toolBarIconEnum;
  final MenuIconEnum? toolBarActionMenuIconEnum;
  TextEditingController? toolBarTextController = TextEditingController();
  final double? toolBarTitleSpacing;
  final double? toolBarElevation;
  Function(dynamic)? callback;

  FlutterAppbar({
    Key? key,
    this.toolBarTitleString,
    this.toolBarSubTitle,
    this.toolBarCaptionText,
    this.searchHint = 'Search hint',
    this.toolBarElevation = 0.0,
    this.toolBarIconEnum = IconEnum.empty,
    this.toolBarActionMenuIconEnum = MenuIconEnum.empty,
    this.toolBarLabel,
    this.toolBarShowSearch = false,
    this.toolbarIsSearchBoarder,
    this.toolBarNotificationCount = 0,
    this.toolBarTitleSpacing,
    this.toolBarTextController,
    this.callback,
  }) : super(key: key);

  @override
  FlutterAppbarState createState() => FlutterAppbarState();

  @override
  Size get preferredSize => throw UnimplementedError();
}

class FlutterAppbarState extends State<FlutterAppbar> {
  bool showCancel = false;
  bool showSearch = false;

  @override
  void initState() {
    super.initState();
  }

  void updateTitle(String? titleString) {
    debugPrint('Title string $titleString');
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: widget.toolBarLabel != null ? 120 : 10,
      elevation: widget.toolBarElevation,
      centerTitle: widget.toolBarLabel == null ? false : true,
      automaticallyImplyLeading: false,
      flexibleSpace: widget.toolBarSubTitle != null &&
              widget.toolBarSubTitle != ''
          ? Container(
              padding: EdgeInsets.only(left: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 100),
                  GestureDetector(
                    onTap: () {
                      widget.callback!(ButtonClickAction.subTitle);
                    },
                    child: Text(
                      widget.toolBarSubTitle!,
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1!
                          .copyWith(fontWeight: FontWeight.w500, fontSize: 28),
                    ),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            )
          : SizedBox(),
      titleSpacing: widget.toolBarTitleSpacing ?? 0,
      title: showSearch
          ? searchBar()
          // ignore: unnecessary_null_comparison
          : widget.toolBarTitleString != null && widget.toolBarTitleString != ''
              ? Center(
                  child: Text(
                    widget.toolBarTitleString!,
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2!
                        .copyWith(fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                )
              : const SizedBox(),
      actions: <Widget>[
        if (widget.toolBarLabel == null) searchButton(context),
        if (widget.toolBarLabel == null) button(context),
        if (widget.toolBarCaptionText != null && widget.toolBarLabel != null)
          Container(
            alignment: Alignment.center,
            margin: widget.toolBarActionMenuIconEnum == MenuIconEnum.empty
                ? EdgeInsets.only(right: 10)
                : EdgeInsets.zero,
            child: Text(
              widget.toolBarCaptionText!,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .caption!
                  .copyWith(fontWeight: FontWeight.w400, fontSize: 13),
            ),
          ),
        if (widget.toolBarLabel != null) leadingIcon(context)!,
      ],
      leading: widget.toolBarLabel == null
          ? leadingIcon(context)
          : GestureDetector(
              onTap: () {
                widget.callback!(ButtonClickAction.label);
              },
              child: Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.arrow_back_ios,
                    size: 18,
                    color: Theme.of(context).iconTheme.color,
                  ),
                  Text(
                    widget.toolBarLabel!,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.labelMedium!,
                  )
                ],
              ),
            ),
    );
  }

  Widget searchBar() {
    widget.toolBarTextController?.text.isNotEmpty == true;
    return Container(
      margin: const EdgeInsets.only(left: 5, right: 10.0),
      alignment: Alignment.centerLeft,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
      ),
      child: TextFormField(
        autofocus: true,
        controller: widget.toolBarTextController,
        cursorColor: Color(0xFF151515),
        textAlign: TextAlign.left,
        decoration: InputDecoration(
          filled: true,
          // focusColor: Color(0xFFF0F2F5),#DAF0F3
          fillColor: Color(0xFFDAF0F3),
          //#DAF0F3
          contentPadding: EdgeInsets.all(10.0),
          hintMaxLines: 1,
          isDense: true,
          hintText: widget.searchHint,
          // border: InputBorder.none,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
                color: widget.toolbarIsSearchBoarder!
                    ? Color(0xFF151515)
                    : Color(0xFFDAF0F3),
                width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            //#151515
            borderSide: BorderSide(
                color: widget.toolbarIsSearchBoarder!
                    ? Color(0xFF151515)
                    : Color(0xFFDAF0F3),
                width: 1),
          ),
          //#898A8B Color(0xFF898A8B)
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
                color: widget.toolbarIsSearchBoarder!
                    ? Color(0xFF151515)
                    : Color(0xFFDAF0F3),
                width: 1),
          ),
          // suffixIconConstraints: BoxConstraints.tight(const Size(49, 24)),
          // prefixIconConstraints: BoxConstraints(maxWidth: 40),

          suffixIconConstraints: BoxConstraints.tight(const Size(35, 24)),
          prefixIconConstraints: BoxConstraints.tight(const Size(44, 44)),
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                widget.toolBarTextController?.clear();
                showSearch = false;
              });
            },
            child: Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                // borderRadius: BorderRadius.circular(2),
                shape: BoxShape.circle,
                border: Border.all(
                  color: Color(0xFF151515),
                  width: 1,
                ),
                // color: Colors.white.withOpacity(0.2),
              ),
              padding: const EdgeInsets.all(1.0),
              child: const Center(
                  child: Icon(
                Icons.clear,
                color: Color(0xFF151515),
                size: 16,
              )),
            ),
          ),
          prefixIcon: Container(
            height: 25,
            width: 30,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  widget.toolBarTextController?.clear();
                  showSearch = false;
                });
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Icon(
                  Icons.search_sharp,
                  color: Colors.grey,
                  size: Theme.of(context).iconTheme.size,
                ),
              ),
            ),
          ),
          hintStyle: Theme.of(context).textTheme.subtitle1!.copyWith(
                fontWeight: FontWeight.w400,
                backgroundColor: Colors.transparent,
                fontSize: 17,
              ),
        ),
        keyboardType: TextInputType.text,
        style: Theme.of(context).textTheme.subtitle1!.copyWith(
              fontWeight: FontWeight.w400,
              backgroundColor: Colors.transparent,
              fontSize: 17,
            ),
        onFieldSubmitted: (String stringValues) {
          widget.callback!(stringValues);
          FocusScope.of(context).requestFocus(FocusNode());
        },
        onChanged: (String stringValues) {},
      ),
    );
  }

  Widget searchButton(BuildContext context) {
    return Visibility(
      visible: showSearch == true
          ? false
          : widget.toolBarShowSearch == true
              ? true
              : false,
      child: GestureDetector(
        child: Container(
          margin: const EdgeInsets.only(right: 8),
          child: const Icon(
            Icons.search,
            size: 24,
          ),
        ),
        onTap: () {
          setState(() {
            showSearch = true;
            // widget.onItemSelected!('searchTriggering');
          });
        },
      ),
    );
  }

  Widget button(BuildContext context) {
    return Visibility(
      // ignore: unrelated_type_equality_checks
      visible: widget.toolBarActionMenuIconEnum != MenuIconEnum.empty,
      child: GestureDetector(
        child: Container(
          margin: const EdgeInsets.only(right: 4),
          alignment: Alignment.center,
          child: Stack(
            alignment: Alignment.topRight,
            children: [
              widget.toolBarActionMenuIconEnum!.icons,
              if (widget.toolBarNotificationCount != 0 &&
                  // ignore: unrelated_type_equality_checks
                  widget.toolBarActionMenuIconEnum!.icons != MenuIconEnum.empty)
                Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).iconTheme.color,
                  ),
                  height: 19,
                  width: 19,
                  child: Text(
                    widget.toolBarNotificationCount! > 10
                        ? '10+'
                        : widget.toolBarNotificationCount.toString(),
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontSize: 9,
                        color: Colors.white,
                        backgroundColor: Theme.of(context).iconTheme.color,
                        fontWeight: FontWeight.w700),
                    textAlign: TextAlign.center,
                  ),
                ),
            ],
          ),
        ),
        onTap: () {
          setState(() {
            widget.callback!(ButtonClickAction.notification);
          });
        },
      ),
    );
  }

  Widget? leadingIcon(BuildContext context) {
    Widget? leadingView = SizedBox();
    if (widget.toolBarIconEnum != IconEnum.empty) {
      leadingView = Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: GestureDetector(
          child: widget.toolBarIconEnum!.icons,
          onTap: () {
            widget.callback!(ButtonClickAction.mainMenu);
          },
        ),
      );
    }
    return leadingView;
  }
}

enum IconEnum { close, back, menu, empty, mainMenu }

enum MenuIconEnum { download, add, notification, empty }

extension IconExtension on IconEnum {
  Widget get icons {
    switch (this) {
      case IconEnum.close:
        return const Icon(
          Icons.close,
          color: Colors.white,
          size: 25,
        );
      case IconEnum.back:
        return Container(
          padding: const EdgeInsets.all(5),
          child: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        );
      case IconEnum.mainMenu:
        return Container(
          child: const Icon(
            Icons.supervised_user_circle_outlined,
            size: 32,
          ),
          // ),
        );
      case IconEnum.menu:
        return const Icon(Icons.menu);
      case IconEnum.empty:
        return SizedBox();
      default:
        return SizedBox();
    }
  }

  String get iconsString {
    switch (this) {
      case IconEnum.close:
        return IconEnum.close.toString();
      case IconEnum.back:
        return IconEnum.back.toString();
      case IconEnum.menu:
        return IconEnum.menu.toString();
      case IconEnum.empty:
        return IconEnum.empty.toString();
      case IconEnum.mainMenu:
        return IconEnum.mainMenu.toString();
      default:
        return IconEnum.empty.toString();
    }
  }
}

extension MenuButtonExtension on MenuIconEnum {
  Widget get icons {
    switch (this) {
      case MenuIconEnum.download:
        return const Icon(
          Icons.download,
          color: ColorResource.colorD02127,
          size: 32,
        );
      case MenuIconEnum.add:
        return Container(
          padding: const EdgeInsets.all(5),
          child: Icon(
            size: 32,
            Icons.add,
            color: ColorResource.colorD02127,
          ),
        );
      case MenuIconEnum.notification:
        return Container(
          child: Icon(
            Icons.notifications,
            size: 32,
            color: ColorResource.colorD02127,
          ),
          // ),
        );
      default:
        return SizedBox();
    }
  }
}

enum ButtonClickAction {
  mainMenu,
  add,
  notification,
  empty,
  caption,
  title,
  label,
  subTitle
}
