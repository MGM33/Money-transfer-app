import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:gradp2p/core/constants/routes.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

abstract class BanksController extends GetxController {
  Pay();

  Payapi();
}

class BanksControllerImp extends BanksController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController subscribeNumber;
  late TextEditingController MobileNumber;

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  var current = 0.obs;

  final List<Map<String, dynamic>> BanksList = [
    {
      'text': 'Money Fellows',
      'text2': 'Money Fellows',
      'TextFieldLabel': 'Mobile Number',
      'TextFieldLabel2': 'National ID',
      'imageUrl': 'assets/images/Financial/Money Fellows.png',
      'email': 'money_fellows@smartpay.com'
    },
    {
      'text': 'ABK Bank',
      'text2': 'ABK Loan',
      'TextFieldLabel': 'National ID',
      'TextFieldLabel2': 'Loan ID',
      'imageUrl': 'assets/images/Financial/ABK Bank.png',
      'email': 'abk_bank@smartpay.com'
    },
    {
      'text': 'Mashreq Bank',
      'text2': 'Mashreq Loan',
      'TextFieldLabel': 'National ID',
      'TextFieldLabel2': 'Account Number',
      'imageUrl': 'assets/images/Financial/Mashreq Bank.jpeg',
      'email': 'mashreq_bank@smartpay.com'
    },
    {
      'text': 'Bank ABC',
      'text2': 'Bank ABC Loan',
      'TextFieldLabel': 'National ID',
      'TextFieldLabel2': 'Loan ID',
      'imageUrl': 'assets/images/Financial/Bank ABC.png',
      'email': 'bank_abc@smartpay.com'
    },
  ];

  String selectedProviderEmail = '';
  void changeIndex(int index) {
    current.value = index;
    selectedProviderEmail = BanksList[index]['email'];
  }

  @override
  Pay() {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      print("Valid");

      Get.toNamed(AppRoute.Banksinvoice);
    } else {
      print("Not Valid");
    }
  }

  @override
  void onInit() {
    subscribeNumber = TextEditingController();
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
        "amount": 3000,
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
    subscribeNumber.dispose();
    MobileNumber.dispose();
    super.dispose();
  }
}
