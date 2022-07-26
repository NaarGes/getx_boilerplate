import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../controller/on_boarding_controller.dart';
import '../../util/theme/palette.dart';
import '../component/theme_switcher.dart';

class OnBoardingPage extends StatelessWidget {
  OnBoardingPage({Key? key}) : super(key: key);

  final OnBoardingController controller = Get.put(OnBoardingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(4.h),
          child: Column(
            children: [
              Align(alignment: Alignment.centerLeft, child: ThemeSwitcher()),
              SizedBox(
                width: Get.width,
                height: Get.height * 0.7,
                child: PageView.builder(
                  controller: controller.pageController,
                  itemCount: controller.pages.length,
                  onPageChanged: (page) {
                    controller.index.value = page;
                  },
                  itemBuilder: (context, index) => Column(
                    children: [
                      const Spacer(),
                      SizedBox(
                        width: Get.height * 0.4,
                        height: Get.height * 0.4,
                        child: Image.asset(
                          controller.pages[index].image,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        controller.pages[index].title,
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      SizedBox(height: 4.h),
                      AutoSizeText(
                        controller.pages[index].description,
                        maxLines: 3,
                        style: Theme.of(context).textTheme.caption,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              const Spacer(),
              InkWell(
                onTap: () => controller.nextPage(),
                child: SizedBox(
                  width: 10.h,
                  height: 10.h,
                  child: Stack(
                    children: [
                      SizedBox(
                        width: 10.h,
                        height: 10.h,
                        child: Obx(
                          () => TweenAnimationBuilder(
                            tween: Tween<double>(
                                begin: 0.0,
                                end: (controller.index.value + 1) /
                                    controller.pages.length),
                            duration: const Duration(milliseconds: 500),
                            builder: (context, double value, _) =>
                                CircularProgressIndicator(
                              strokeWidth: 0.5.h,
                              valueColor: AlwaysStoppedAnimation(
                                  Theme.of(context).textTheme.headline2!.color),
                              backgroundColor:
                                  Theme.of(context).textTheme.caption!.color,
                              value: value,
                            ),
                          ),
                        ),
                      ),
                      Positioned.fill(
                        child: Icon(
                          Icons.navigate_next,
                          size: 6.h,
                          color: Theme.of(context).textTheme.headline2!.color,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
