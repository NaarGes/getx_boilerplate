import 'dart:ui';

class Palette {
  static const Color primaryColor = Color(0xff00abab);
  static const Color complementaryColor = Color(0xffFF7400);
  static const Color transparentColor = Color(0x00ffffff);
}

class LightPalette extends Palette {
  static const Color backgroundColor = Color(0xffffffff);
  static const Color headerTextColor = Color(0xff000000);
  static const Color captionTextColor = Color(0xff888888);
}

class DarkPalette {
  static const Color backgroundColor = Color(0xff000000);
  static const Color headerTextColor = Color(0xffffffff);
  static const Color captionTextColor = Color(0xff888888);
}