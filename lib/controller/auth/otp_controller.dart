import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradp2p/core/constants/routes.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

abstract class OtpController extends GetxController {
  Future<void> checkCode();
  void login();
}

class otpcontrollerImp extends OtpController {
  late String verifycode;
  late TextEditingController otpController;

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  void login() {
    //  print(otp)
    checkCode();
  }

  @override
  Future<void> checkCode() async {
    try {
      final SharedPreferences prefs = await _prefs;
      final token = prefs.getString('token');

      if (token == null) {
        Get.snackbar("Error", "Token not found. Please login again.");
        return;
      }
      var headers = {
        'Authorization': 'Bearer $token',
        "Content-Type": "application/json"
      };
      var request = http.Request(
          'POST',
          Uri.parse(
              'https://smart-pay.onrender.com/api/v0/users/verifyPhoneOtp'));
      request.body = json.encode({"otp": otpController.text});
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        print(await response.stream.bytesToString());
        Get.offNamed(AppRoute.Bottomnavbar);
      } else {
        print(request.headers);

        print(otpController.text);
        print(response.reasonPhrase);
      }
    } catch (e) {
      Get.snackbar("Exception", e.toString());
    }
  }

  @override
  void onInit() {
    otpController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    otpController.dispose();
    super.dispose();
  }
}








// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:gradp2p/core/constants/routes.dart';
// import 'package:http/http.dart' as http;

// abstract class OtpController extends GetxController {
//   checkCode();
//   login();
// }

// class otpcontrollerImp extends OtpController {
//   late String verifycode;

//   late TextEditingController otpController;

//   @override
//   login() {
//     Get.toNamed(AppRoute.Bottomnavbar);
//   }

//   @override
//   Future<void> checkCode() async {
//     try {
//       var headers = {'Authorization': 'Bearer + token' };
//       var request = http.Request(
//           'GET',
//           Uri.parse(
//               'https://smart-pay.onrender.com/api/v0/users/generatePhoneOtp'));

//       request.headers.addAll(headers);

//       http.StreamedResponse response = await request.send();

//       if (response.statusCode == 200) {
//         print(await response.stream.bytesToString());
//         Get.toNamed(AppRoute.Bottomnavbar);
//       } else {
//         print(response.reasonPhrase);
//       }
//     } catch (e) {
//       Get.snackbar("Exeption", e.toString());
//     }
//   }

//   @override
//   void onInit() {
//     otpController = TextEditingController();
//     super.onInit();
//   }

//   @override
//   void dispose() {
//     otpController.dispose();
//     super.dispose();
//   }
// }
