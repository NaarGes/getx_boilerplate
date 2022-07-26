import 'package:get/get.dart';

import 'controller/on_boarding_controller.dart';
import 'view/page/home_page.dart';
import 'view/page/on_boarding_page.dart';

class Routes {
  static const String onBoarding = '/onBoarding';
  static const String signUp = '/signUp';
  static const String signIn = '/signIn';
  static const String home = '/home';

  static final List<GetPage> pages = [
    GetPage(
        name: onBoarding,
        page: () => OnBoardingPage(),
        binding: BindingsBuilder(() {
          Get.lazyPut(() => OnBoardingController());
        })),
    GetPage(
      name: home,
      page: () => const HomePage(),
    ),
  ];
}