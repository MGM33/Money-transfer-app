import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:gradp2p/core/constants/routes.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

abstract class LandlineController extends GetxController {
  Pay();

  Payapi();
}

class LandlineControllerImp extends LandlineController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController PhoneNumber;

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  var current = 0.obs;

  final List<Map<String, dynamic>> LandLineProvidersList = [
    {
      'text': ' TE Monthly Bill',
      'TextFieldLabel': '  Phone no. ',
      'imageUrl': 'assets/images/we.png',
    },
    {
      'text': ' TE Quarterly Bill',
      'TextFieldLabel': '  Phone no. ',
      'imageUrl': 'assets/images/we.png',
    },
  ];
  void changeIndex(int index) {
    current.value = index;
  }

  @override
  Pay() {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      print("Valid");

      Get.toNamed(AppRoute.Landlineinvoice);
    } else {
      print("Not Valid");
    }
  }

  @override
  void onInit() {
    PhoneNumber = TextEditingController();

    super.onInit();
  }

  @override
  Future<void> Payapi() async {
    try {
      final SharedPreferences prefs = await _prefs;
      final token = prefs.getString('token');

      if (token == null) {
        Get.snackbar("Error", "Token not found. Please login again.");
        return;
      }
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      };
      var request = http.Request(
          'POST',
          Uri.parse(
              'https://smart-pay.onrender.com/api/v0/transactions/transfer'));
      request.body = json.encode({
        "smartEmail": "we@smartpay.com",
        "amount": 300,
      });
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        print(await response.stream.bytesToString());

        Get.offAllNamed(AppRoute.Bottomnavbar);
        Get.snackbar("Succes", 'Payment Succes');
      } else {
        print(response.reasonPhrase);
        Get.snackbar("Error", 'Payment Failed');
      }
    } catch (e) {
      Get.snackbar("Exeption", e.toString());
    }
  }

  @override
  void dispose() {
    PhoneNumber.dispose();

    super.dispose();
  }
}
