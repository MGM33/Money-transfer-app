
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:gradp2p/core/constants/routes.dart';

import 'package:shared_preferences/shared_preferences.dart';

abstract class NewpassController extends GetxController {
  goTologin();
  savenewpass();
}

class NewpassControllerImp extends NewpassController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController password;
  late TextEditingController confirmPassword;
  bool isshowpassword = true;
  bool isshowpassword2 = true;

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  showPassword() {
    isshowpassword = isshowpassword == true ? false : true;
    update();
  }

  showPassword2() {
    isshowpassword2 = isshowpassword2 == true ? false : true;
    update();
  }

   @override
  savenewpass() {
     var formdata = formstate.currentState;
    if (formdata!.validate()) {
      print("Valid");
      Get.offNamed(AppRoute.login);
    } else {
      print("Not Valid");
    }
  }
  @override
  goTologin() {
    Get.offNamed(AppRoute.login);
  }

  @override
  void onInit() {
    password = TextEditingController();
    confirmPassword = TextEditingController();

    super.onInit();
  }

  // @override
  // Future<void> logiWithPhone() async {
  //   try {
  //     var headers = {'Content-Type': 'application/json'};
  //     var request = http.Request('POST',
  //         Uri.parse('https://smart-pay.onrender.com/api/v0/users/login'));
  //     request.body =
  //         json.encode({"phone": confirmPassword.text, "password": password.text});
  //     request.headers.addAll(headers);

  //     http.StreamedResponse response = await request.send();

  //     if (response.statusCode == 200) {
  //       print(await response.stream.bytesToString());

  //       Get.offAllNamed(AppRoute.otp);
  //     } else {
  //       print(response.reasonPhrase);
  //     }
  //   } catch (e) {
  //     Get.snackbar("Exeption", e.toString());
  //   }
  // }

  @override
  void dispose() {
    password.dispose();
    confirmPassword.dispose();

    super.dispose();
  }
  

}
