import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:gradp2p/core/constants/routes.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

abstract class WithdrowController extends GetxController {
  Withdrow();

  Withdrowapi();
}

class WithdrowControllerImp extends WithdrowController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController amount;

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  Withdrow() {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      print("Valid");

      Withdrowapi();
    } else {
      print("Not Valid");
    }
  }

  @override
  void onInit() {
    amount = TextEditingController();

    super.onInit();
  }

  @override
  Future<void> Withdrowapi() async {
    try {
      final SharedPreferences prefs = await _prefs;
      final token = prefs.getString('token');
      final defaultCardId = prefs.getString('defaultCardId');

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
              'https://smart-pay.onrender.com/api/v0/transactions/rechargeOrDeposit'));
      request.body = json.encode(
          {"cardId": defaultCardId, "type": "Withdraw", "amount": amount.text});
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        print(await response.stream.bytesToString());

        Get.offAllNamed(AppRoute.Bottomnavbar);
        Get.snackbar("Success", "Withdraw  successfully.");
      } else {
        print(response.reasonPhrase);
        Get.snackbar("Error", "Failed to Withdraw : ${response.reasonPhrase}");
      }
    } catch (e) {
      Get.snackbar("Exeption", e.toString());
    }
  }

  @override
  void dispose() {
    amount.dispose();

    super.dispose();
  }
}
