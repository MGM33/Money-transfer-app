import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradp2p/core/constants/routes.dart';

abstract class PhonevarifyController extends GetxController {
  gosendOTP();
}

class PhonevarifycontrollerImp extends PhonevarifyController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController phoneNumber;

  @override
  void onInit() {
    phoneNumber = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    phoneNumber.dispose();

    super.dispose();
  }

  @override
  gosendOTP() {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      print("Valid");
      Get.toNamed(AppRoute.otp);
    } else {
      print("Not Valid");
    }
  }
}
