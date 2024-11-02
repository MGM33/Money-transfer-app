import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradp2p/core/constants/routes.dart';

abstract class ConfirmcodeController extends GetxController {
  // checkCode();
  gotoNewpass();
}

class ConfirmcodecontrollerImp extends ConfirmcodeController {
  late String verifycode;
  late TextEditingController otpcodecontroller;

  @override
  gotoNewpass() {
    Get.offNamed(AppRoute.Newpass);
  }

  @override
  void onInit() {
    otpcodecontroller = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    otpcodecontroller.dispose();
    super.dispose();
  }
}
// @override
  // Future<void> checkCode() async {
  //   try {
  //     var headers = {'Authorization': 'Bearer'};
  //     var request = http.Request(
  //         'GET',
  //         Uri.parse(
  //             'https://smart-pay.onrender.com/api/v0/users/generatePhoneOtp'));

  //     request.headers.addAll(headers);

  //     http.StreamedResponse response = await request.send();

  //     if (response.statusCode == 200) {
  //       print(await response.stream.bytesToString());
  //     } else {
  //       print(response.reasonPhrase);
  //     }
  //   } catch (e) {
  //     Get.snackbar("Exeption", e.toString());
  //   }
  // }