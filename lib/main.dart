import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'routes.dart';
import 'util/strings.dart';
import 'util/theme/theme.dart';
import 'view/page/on_boarding_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        themeMode: ThemeMode.light,
        translations: Strings(),
        locale: const Locale('en', 'US'),
        debugShowCheckedModeBanner: false,
        getPages: Routes.pages,
        home: OnBoardingPage(),
      );
    });
  }
}
