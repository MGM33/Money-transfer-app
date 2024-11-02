import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:gradp2p/core/constants/routes.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

abstract class GasController extends GetxController {
  Pay();

  Payapi();
}

class GasControllerImp extends GasController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController subnumber;

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  var current = 0.obs;

  final List<Map<String, dynamic>> GProvidersList = [
    {
      'text': 'Petrotrade',
      'TextFieldLabel': 'Subscriber Number (16 Digits)',
      'imageUrl': 'assets/images/Petrotrade Gas Provider.jpg',
      'email': 'petrotrade@smartpay.com'
    },
    {
      'text': 'Taqa Gas',
      'TextFieldLabel': 'Subscriber Number (16Digits)',
      'imageUrl': 'assets/images/taqa_arabia_logo.jpeg',
      'email': 'taqa_gas@smartpay.com'
    },
    {
      'text': 'NAT Gas',
      'TextFieldLabel': 'Subscriber Number (16 Digits)',
      'imageUrl': 'assets/images/natgascomeg_logo.jpeg',
      'email': 'nat_gas@smartpay.com'
    },
    {
      'text': 'Gastec',
      'TextFieldLabel': 'Bill Number(6-Digits)',
      'imageUrl': 'assets/images/Gastec.png',
      'email': 'gastec@smartpay.com'
    },
    {
      'text': 'Master Gas',
      'TextFieldLabel': 'Account Code',
      'imageUrl': 'assets/images/Master gas.jpeg',
      'email': 'master_gas@smartpay.com'
    },
  ];
  String selectedProviderEmail = '';
  void changeIndex(int index) {
    current.value = index;
    selectedProviderEmail = GProvidersList[index]['email'];
  }

  @override
  Pay() {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      print("Valid");

      Get.toNamed(AppRoute.Gasinvoice);
    } else {
      print("Not Valid");
    }
  }

  @override
  void onInit() {
    subnumber = TextEditingController();

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
        "amount": 300,
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
    subnumber.dispose();

    super.dispose();
  }
}
