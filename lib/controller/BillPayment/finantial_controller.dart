import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:gradp2p/core/constants/routes.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

abstract class FinantialController extends GetxController {
  Pay();

  Payapi();
}

class FinantialControllerImp extends FinantialController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController MobileNumber;

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  var current = 0.obs;

  final List<Map<String, dynamic>> FinancialList = [
    {
      'text': 'Valu Company',
      'text2': 'Valu Company',
      'TextFieldLabel': 'National ID',
      'imageUrl': 'assets/images/Financial/Valu Company.jpeg',
      'email': 'valu_company@smartpay.com'
    },
    {
      'text': 'B.TECH',
      'text2': 'B.TECH',
      'TextFieldLabel': 'Payment Code(7-Digits)',
      'imageUrl': 'assets/images/Financial/B.TECH.png',
      'email': 'b_tech@smartpay.com'
    },
    {
      'text': 'Contact',
      'text2': 'Contact',
      'TextFieldLabel': 'National ID',
      'imageUrl': 'assets/images/Financial/Contact.png',
      'email': 'contact@smartpay.com'
    },
    {
      'text': 'Souhoola',
      'text2': 'Souhoola',
      'TextFieldLabel': 'National ID',
      'imageUrl': 'assets/images/Financial/Souhoola.png',
      'email': 'souhoola@smartpay.com'
    },
  ];

  String selectedProviderEmail = '';
  void changeIndex(int index) {
    current.value = index;
    selectedProviderEmail = FinancialList[index]['email'];
  }

  @override
  Pay() {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      print("Valid");

      Get.toNamed(AppRoute.Financialinvoice);
    } else {
      print("Not Valid");
    }
  }

  @override
  void onInit() {
    MobileNumber = TextEditingController();

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
        "smartEmail": selectedProviderEmail.toString(),
        "amount": 5000,
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
        Get.snackbar("Error", 'Payment Failed');
      }
    } catch (e) {
      Get.snackbar("Exeption", e.toString());
    }
  }

  @override
  void dispose() {
    MobileNumber.dispose();
    super.dispose();
  }
}
