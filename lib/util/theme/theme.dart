import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

import 'palette.dart';

class ThemeService {
  final GetStorage _box = GetStorage();
  final String _key = 'isDarkMode';

  ThemeMode get theme => _loadThemeFromBox() ? ThemeMode.dark : ThemeMode.light;

  bool _loadThemeFromBox() => _box.read(_key) ?? false;

  Future<void> _saveThemeToBox(bool isDarkMode) => _box.write(_key, isDarkMode);

  void switchTheme() {
    debugPrint('switching theme... isDarkMode? ${_loadThemeFromBox()}');
    Get.changeThemeMode(_loadThemeFromBox() ? ThemeMode.light : ThemeMode.dark);
    _saveThemeToBox(!_loadThemeFromBox());
  }

  static bool isDarkMode() => Get.isDarkMode;
}

class AppTheme {
  static final ThemeData light = ThemeData.dark().copyWith(
    backgroundColor: LightPalette.backgroundColor,
    primaryColor: Palette.primaryColor,
    textTheme: TextTheme(
      headline2: GoogleFonts.lato().copyWith(fontWeight: FontWeight.w800,
        fontSize: 25,
        color: LightPalette.headerTextColor,
        fontStyle: FontStyle.italic,
      ),
      caption: GoogleFonts.lato().copyWith(fontWeight: FontWeight.w200,
        fontSize: 18,
        height: 1.5,
        color: LightPalette.captionTextColor,
        fontStyle: FontStyle.italic,
      ),
    ),
  );
  static final ThemeData dark = ThemeData.light().copyWith(
    backgroundColor: DarkPalette.backgroundColor,
    primaryColor: Palette.primaryColor,
    textTheme: TextTheme(
      headline2: GoogleFonts.lato().copyWith(fontWeight: FontWeight.w800,
        fontSize: 25,
        color: DarkPalette.headerTextColor,
        fontStyle: FontStyle.italic,
      ),
      caption: GoogleFonts.lato().copyWith(fontWeight: FontWeight.w200,
        fontSize: 18,
        height: 1.5,
        color: DarkPalette.captionTextColor,
        fontStyle: FontStyle.italic,
      ),
    ),
  );
}