import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:gradp2p/core/constants/routes.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

abstract class MobilerechargeController extends GetxController {
  void Pay();
  Future<void> Payapi();
  void CalculateResult(String input);
}

class MobilerechargeControllerImp extends MobilerechargeController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController PhoneNumber;
  late TextEditingController amount;
  final result = 0.0.obs;

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  var current = 0.obs;

  final List<Map<String, dynamic>> MobileProvidersList = [
    {
      'text': 'Vodafone',
      'text2': 'Vodafone Recharge',
      'TextFieldLabel': 'Phone no.',
      'imageUrl': 'assets/images/vodafone.png',
      'email': 'Vodafone@smartpay.com'
    },
    {
      'text': 'Etisalat',
      'text2': 'Etisalat Recharge',
      'TextFieldLabel': 'Phone no.',
      'imageUrl': 'assets/images/Etisalat.png',
      'email': 'Etisalat@smartpay.com'
    },
    {
      'text': 'Orange',
      'text2': 'Orange Recharge',
      'TextFieldLabel': 'Phone no.',
      'imageUrl': 'assets/images/orange.png',
      'email': 'Orange@smartpay.com'
    },
    {
      'text': 'We',
      'text2': 'WE Recharge',
      'TextFieldLabel': 'Phone no.',
      'imageUrl': 'assets/images/we.png',
      'email': 'We@smartpay.com'
    },
  ];

  String selectedProviderEmail = '';
  void changeIndex(int index) {
    current.value = index;
    selectedProviderEmail = MobileProvidersList[index]['email'];
  }

  @override
  void CalculateResult(String input) {
    final enteredNumber = double.tryParse(input) ?? 0.0;
    result.value = enteredNumber * 0.7;
  }

  @override
  Pay() {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      print("Valid");
      Get.toNamed(AppRoute.Mobilerechargeinvoice);
    } else {
      print("Not Valid");
    }
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
        "smartEmail": selectedProviderEmail,
        "amount": amount.text,
      });
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        print(await response.stream.bytesToString());
        print(selectedProviderEmail);
        Get.offAllNamed(AppRoute.Bottomnavbar);
        Get.snackbar("Succes", 'Payment Succes');
      } else {
        print(response.reasonPhrase);
        Get.snackbar("Error ", 'Payment Failed');
      }
    } catch (e) {
      Get.snackbar("Exeption", e.toString());
    }
  }

  @override
  void onInit() {
    PhoneNumber = TextEditingController();
    amount = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    PhoneNumber.dispose();
    amount.dispose();
    super.dispose();
  }
}
