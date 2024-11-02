import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradp2p/controller/onboarding_controller.dart';
import 'package:gradp2p/data/datasource/static/static.dart';

class CustomSliderOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomSliderOnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pageController,
      onPageChanged: (val) {
        controller.onPageChanged(val);
      },
      itemCount: onBoardingList.length,
      itemBuilder: (context, i) => Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                height: 300, child: Image.asset(onBoardingList[i].image!)),
            Column(
              children: [
                Text(onBoardingList[i].title!,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineMedium),
                Text(onBoardingList[i].body!,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium)
              ],
            ),
          ]),
    );
  }
}
