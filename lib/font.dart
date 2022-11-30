class Font {
  static const Font ilisarniqBold = Font('Ilisarniq-Bold');
  static const Font ilisarniqItalic = Font('Ilisarniq-Italic');
  static const Font ilisarniqRegular = Font('Ilisarniq-Regular');
  static const Font ilisarniqMedium = Font('Ilisarniq-Medium');
  static const Font ilisarniqMediumItalic = Font('Ilisarniq-MediumItalic');
  static const Font ilisarniqLight = Font('Ilisarniq-Light');
  final String _fontName;

  String get value => _fontName;

  const Font(this._fontName);
}
