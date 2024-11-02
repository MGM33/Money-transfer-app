import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradp2p/core/constants/routes.dart';

abstract class phoneNumberController extends GetxController {
  gosendOTP();
}

class phoneNumbercontrollerImp extends phoneNumberController {
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
      Get.offNamed(AppRoute.Confirmcode);
    } else {
      print("Not Valid");
    }
  }
}
