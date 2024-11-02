import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradp2p/core/constants/routes.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

abstract class SellcryptoController extends GetxController {
  Sell();

  SellApi();
}

class SellcryptoControllerImp extends SellcryptoController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  var amount = ''.obs; // Make amount observable
  var name = ''.obs; // Make name observable

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  void onInit() {
    super.onInit();
    amount.listen((value) {
      update();
    });
  }

  @override
  Sell() {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      print("Valid");
      print(amount.value);
      print(name);
      SellApi();
    } else {
      print("Not Valid");
    }
  }

  @override
  Future<void> SellApi() async {
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
              'https://smart-pay.onrender.com/api/v0/transactions/buyOrSellCrypto'));
      request.body = json.encode({
        "crypto": name.value.toString(),
        "type": "sell-crypto",
        "cryptoAmount": amount.value.toString(),
      });
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        print(await response.stream.bytesToString());
        Get.offAllNamed(AppRoute.Bottomnavbar);
        Get.snackbar("success", "Sell Done");
      } else {
        print(response.reasonPhrase);
        Get.snackbar("Error ", "Sell Failed");
      }
    } catch (e) {
      Get.snackbar("Exception", e.toString());
    }
  }

  @override
  void dispose() {
    super.dispose();
  }
}
