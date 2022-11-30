class DropdownModel {
  DropdownModel(
    this.displayName,
    this.index, {
    this.selected = false,
  });

  bool? selected;
  String displayName;
  int index;
}
