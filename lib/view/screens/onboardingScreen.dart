import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradp2p/controller/onboarding_controller.dart';
import 'package:gradp2p/view/widget/onboarding/CustomButtonOnBoarding.dart';
import 'package:gradp2p/view/widget/onboarding/CustomDotControllerOnBoarding.dart';
import 'package:gradp2p/view/widget/onboarding/CustomSliderOnBoarding.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp());
    return const Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(children: [
            Expanded(
              flex: 3,
              child: CustomSliderOnBoarding(),
            ),
            Expanded(
                flex: 1,
                child: Column(
                  children: [
                    CustomDotControllerOnBoarding(),
                    Spacer(flex: 2),
                    CustomButtonOnBoarding()
                  ],
                ))
          ]),
        ));
  }
}
