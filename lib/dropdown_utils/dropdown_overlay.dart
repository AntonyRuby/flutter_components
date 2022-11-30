part of 'flutter_dropdown.dart';

const _headerPadding = EdgeInsets.only(
  left: 16.0,
  top: 1,
  bottom: 1,
  right: 14,
);
const _overlayOuterPadding = EdgeInsets.only(bottom: 1, left: 12, right: 12);
const _overlayShadowOffset = Offset(0, 6);
const _listItemPadding = EdgeInsets.symmetric(vertical: 12, horizontal: 16);

class _DropdownOverlay extends StatefulWidget {
  // final List<String> items;
  final List<DropdownModel> dropdownList;
  final TextEditingController controller;
  final Size size;
  final LayerLink layerLink;
  final VoidCallback hideOverlay;
  final String hintText;
  final TextStyle? headerStyle;
  final TextStyle? listItemStyle;
  final bool? excludeSelected;
  final bool? canCloseOutsideBounds;
  final _SearchType? searchType;
  final bool multiSelect;
  final bool? displayUpLayout;

  const _DropdownOverlay({
    Key? key,
    // required this.items,
    required this.dropdownList,
    required this.controller,
    required this.size,
    required this.layerLink,
    required this.hideOverlay,
    required this.hintText,
    this.headerStyle,
    this.listItemStyle,
    this.excludeSelected,
    this.canCloseOutsideBounds,
    this.searchType,
    this.displayUpLayout,
    this.multiSelect = false,
  }) : super(key: key);

  @override
  _DropdownOverlayState createState() => _DropdownOverlayState();
}

class _DropdownOverlayState extends State<_DropdownOverlay> {
  bool displayOverly = true;
  bool displayOverlayBottom = true;
  late String headerText;
  // late List<String> items;
  late List<DropdownModel> dropdownList;
  late List<String> filteredItems;
  late List<DropdownModel> dropdownFilteredItems;
  final key1 = GlobalKey(), key2 = GlobalKey();
  final scrollController = ScrollController();
  List selectedValues = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final render1 = key1.currentContext?.findRenderObject() as RenderBox;
      final render2 = key2.currentContext?.findRenderObject() as RenderBox;
      final screenHeight = MediaQuery.of(context).size.height;
      double y = render1.localToGlobal(Offset.zero).dy;
      if (screenHeight - y < render2.size.height) {
        displayOverlayBottom = false;
        setState(() {});
      }
    });

    headerText = '';

    // headerText = widget.controller.text;
    // if (widget.controller.text.isNotEmpty) {
    //   for (var element in widget.controller.text.split(', ')) {
    //     setState(() {
    //       selectedValues.add(element);
    //     });
    //     print('--selectedValues---> $selectedValues');
    //   }
    // }

    if (widget.excludeSelected! &&
        widget.dropdownList.length > 1 &&
        widget.controller.text.isNotEmpty) {
      dropdownList = widget.dropdownList
          .where((item) => item.displayName != headerText)
          .toList();
    } else {
      dropdownList = widget.dropdownList;
    }
    dropdownFilteredItems = dropdownList;
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final darkMode = MediaQuery.of(context).platformBrightness;
    // search availability check
    final onListDataSearch = widget.searchType == _SearchType.onListData;

    // border radius
    final borderRadius = BorderRadius.circular(8);

    // overlay icon
    // final overlayIcon = Icon(
    //   displayOverlayBottom ? Icons.clear : Icons.clear,
    //   color: Colors.black,
    //   size: 24,
    // );

    // overlay offset
    final overlayOffset = Offset(-12, 60
        // -12,
        // widget.noUp == false
        //     ? displayOverlayBottom
        //         ? 60
        //         : 365
        //     : displayOverlayBottom
        //         ? 60
        //         : 60,
        );

    // list padding
    final listPadding =
        onListDataSearch ? const EdgeInsets.only(top: 8) : EdgeInsets.zero;

    // items list
    final list = dropdownList.isNotEmpty
        ? _ItemsList(
            scrollController: scrollController,
            excludeSelected: widget.dropdownList.length > 1
                ? widget.excludeSelected!
                : false,
            // items: items,
            dropdownList: dropdownList,
            padding: listPadding,
            headerText: headerText,
            itemTextStyle: widget.listItemStyle,
            multiSelect: widget.multiSelect,
            onItemSelect: (value) {
              if (widget.multiSelect) {
                setState(() {
                  value.selected = !value.selected!;
                  if (selectedValues.contains(value.displayName)) {
                    print('----remove values-->> ${value.displayName}');
                    selectedValues.remove(value.displayName);
                  } else {
                    selectedValues.add(value.displayName);
                  }

                  print(selectedValues.join(', '));
                  widget.controller.text = selectedValues.join(', ');
                });
              } else {
                if (headerText != value.displayName) {
                  widget.controller.text = value.displayName;
                }
                setState(() => displayOverly = false);
              }
            },
          )
        : const Center(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 12.0),
              child: Text(
                'No result found.',
                style: TextStyle(fontSize: 16),
              ),
            ),
          );

    Widget overlayContainer() {
      return Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color:
                darkMode == Brightness.dark ? Color(0xFF4D4E50) : Colors.white,
            borderRadius: borderRadius,
            boxShadow: [
              BoxShadow(
                blurRadius: 24.0,
                color: Colors.black.withOpacity(.08),
                offset: _overlayShadowOffset,
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: AnimatedSection(
              animationDismissed: widget.hideOverlay,
              expand: displayOverly,
              axisAlignment: displayOverlayBottom ? 2.0 : -2.0,
              child: SizedBox(
                key: key2,
                height: dropdownList.length > 4
                    ? onListDataSearch
                        ? 360
                        : 320
                    : null,
                child: ClipRRect(
                  borderRadius: borderRadius,
                  child: NotificationListener<OverscrollIndicatorNotification>(
                    onNotification: (notification) {
                      notification.disallowIndicator();
                      return true;
                    },
                    child: Theme(
                      data: Theme.of(context).copyWith(
                        scrollbarTheme: ScrollbarThemeData(
                          thumbVisibility: MaterialStateProperty.all(
                            true,
                          ),
                          thickness: MaterialStateProperty.all(5),
                          radius: const Radius.circular(4),
                          thumbColor: MaterialStateProperty.all(
                            Colors.grey[300],
                          ),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: _headerPadding,
                            child: Row(
                              children: [
                                Expanded(
                                  child: widget.multiSelect
                                      ? GestureDetector(
                                          child: Text(
                                            'Done',
                                            style: TextStyle(
                                                color: Color(0xFFF37B21)),
                                          ),
                                          onTap: () {
                                            setState(
                                                () => displayOverly = false);
                                          },
                                        )
                                      : Text(
                                          headerText.isNotEmpty
                                              ? headerText
                                              : widget.hintText,
                                          style: widget.headerStyle,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                ),
                                const SizedBox(width: 12),
                                // overlayIcon,
                              ],
                            ),
                          ),
                          if (onListDataSearch)
                            _SearchField(
                              // items: filteredItems,
                              dropdownList: dropdownFilteredItems,
                              onSearchedItems: (val) {
                                // setState(() => items = val);
                                setState(() => dropdownList = val);
                              },
                            ),
                          dropdownList.length > 4 ? Expanded(child: list) : list
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    }

    final child = Stack(
      children: [
        widget.displayUpLayout == false
            ? Container(
                key: key1,
                // Here change the overlay position
                alignment: Alignment.bottomCenter,
                padding: _overlayOuterPadding,
                child: overlayContainer())
            : Positioned(
                width: widget.size.width + 24,
                // height: MediaQuery.of(context).size.height,
                child: CompositedTransformFollower(
                  link: widget.layerLink,
                  followerAnchor: displayOverlayBottom
                      ? Alignment.topLeft
                      : Alignment.bottomLeft,
                  showWhenUnlinked: false,
                  offset: overlayOffset,
                  child: Container(
                      key: key1,
                      // Here change the overlay position
                      // alignment: Alignment.bottomCenter,
                      padding: _overlayOuterPadding,
                      child: overlayContainer()),
                ),
              ),
      ],
    );

    return GestureDetector(
      onTap: () => setState(() => displayOverly = false),
      child: widget.canCloseOutsideBounds!
          ? Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Colors.transparent,
              child: child,
            )
          : child,
    );
  }
}

class _ItemsList extends StatelessWidget {
  final ScrollController scrollController;
  // final List<String> items;
  final List<DropdownModel> dropdownList;
  final bool excludeSelected;
  final String headerText;
  final ValueSetter<DropdownModel> onItemSelect;
  final EdgeInsets padding;
  final TextStyle? itemTextStyle;
  final bool multiSelect;

  const _ItemsList({
    Key? key,
    required this.scrollController,
    // required this.items,
    required this.dropdownList,
    required this.excludeSelected,
    required this.headerText,
    required this.onItemSelect,
    required this.padding,
    this.itemTextStyle,
    this.multiSelect = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final darkMode = MediaQuery.of(context).platformBrightness;
    final listItemStyle =
        const TextStyle(fontSize: 16, height: 1.35).merge(itemTextStyle);

    return Scrollbar(
      controller: scrollController,
      child: ListView.builder(
        controller: scrollController,
        shrinkWrap: true,
        padding: padding,
        itemCount: dropdownList.length,
        itemBuilder: (_, index) {
          bool selected = false;
          if (!multiSelect) {
            selected = !excludeSelected &&
                headerText == dropdownList[index].displayName;
          }
          return Material(
            color: Colors.transparent,
            child: InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.grey[200],
              onTap: () {
                onItemSelect(dropdownList[index]);
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 8),
                color:
                    selected ? ColorResource.color808080 : Colors.transparent,
                padding: _listItemPadding,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (multiSelect)
                      dropdownList[index].selected!
                          ? Icon(
                              Icons.check_circle_outline,
                              size: 21.5,
                              color: Colors.green,
                            )
                          : Icon(
                              Icons.circle_outlined,
                              size: 21.5,
                              color: Colors.grey,
                            ),
                    if (multiSelect)
                      SizedBox(
                        width: 8,
                      ),
                    Text(
                      dropdownList[index].displayName,
                      style: listItemStyle.merge(TextStyle(
                          color: darkMode != Brightness.dark
                              ? Color(0xFF151515)
                              : Colors.white)),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _SearchField extends StatefulWidget {
  // final List<String> items;
  final List<DropdownModel> dropdownList;
  final ValueChanged<List<DropdownModel>> onSearchedItems;
  const _SearchField({
    Key? key,
    // required this.items,
    required this.dropdownList,
    required this.onSearchedItems,
  }) : super(key: key);

  @override
  State<_SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<_SearchField> {
  final searchCtrl = TextEditingController();

  @override
  void dispose() {
    searchCtrl.dispose();
    super.dispose();
  }

  void onSearch(String str) {
    final result = widget.dropdownList
        .where((item) =>
            item.displayName.toLowerCase().contains(str.toLowerCase()))
        .toList();
    widget.onSearchedItems(result);
  }

  void onClear() {
    print('-------000------');
    if (searchCtrl.text.isNotEmpty) {
      searchCtrl.clear();
      widget.onSearchedItems(widget.dropdownList);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        // padding: EdgeInsets.only(
        //     bottom: MediaQuery.of(context).viewInsets.bottom - 150, left: 8),
        child: FlutterSearchField(
          callback: (val) {},
          controller: searchCtrl,
          onChanged: onSearch,
          isCancelButton: true,
          onClose: (val) => onClear(),
        ));
  }
}
