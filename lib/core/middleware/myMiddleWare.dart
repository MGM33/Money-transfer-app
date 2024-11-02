import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradp2p/core/constants/routes.dart';
import 'package:gradp2p/core/services/services.dart';

class Mymiddleware extends GetMiddleware {
  int? get Priority => 1;

  MyServices myServices = Get.find();
  @override
  RouteSettings? redirect(String? route) {
    if (myServices.sharedPreferences.getString("onboarding") == "1") {
      return const RouteSettings(name: AppRoute.SplashScreen);
    }
    return null;
  }
}
