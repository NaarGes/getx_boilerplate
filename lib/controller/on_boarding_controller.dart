import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getx_boilerplate/routes.dart';

import '../data/model/on_boarding_model.dart';
import '../util/assets.dart';

class OnBoardingController extends GetxController {
  RxInt index = 0.obs;
  final PageController pageController = PageController(initialPage: 0);

  @override
  void onInit() {
    index.listen((p0) {
      print('>>>>> $p0');
    });
    super.onInit();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  final List<OnBoardingModel> pages = [
    const OnBoardingModel(
        image: Assets.onBoarding1,
        title: 'title 1',
        description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'),
    const OnBoardingModel(
        image: Assets.onBoarding2,
        title: 'title 2',
        description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'),
    const OnBoardingModel(
        image: Assets.onBoarding3,
        title: 'title 3',
        description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'),
    const OnBoardingModel(
        image: Assets.onBoarding4,
        title: 'title 4',
        description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'),
  ];

  void nextPage() {
    if (index.value != pages.length - 1) {
      index.value += 1;
      pageController.animateToPage(index.value, curve: Curves.easeOutCubic,
          duration: Duration(milliseconds: 1000));
    } else {
      Get.offNamed(Routes.home);
    }
  }

  void previousPage() {
    if (index.value != 0) {
      index.value -= 1;
      pageController.animateToPage(index.value, curve: Curves.easeIn,
          duration: Duration(microseconds: 1000));
    }
  }
}