import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../util/theme/theme.dart';

class ThemeSwitcher extends StatelessWidget {
  const ThemeSwitcher({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => ThemeService().switchTheme(),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(
          ThemeService.isDarkMode() ? Icons.nightlight_round : Icons.wb_sunny,
          color: ThemeService.isDarkMode() ? Colors.black : Colors.yellow[200],
          size: 5.w,
        ),
      ),
    );
  }
}