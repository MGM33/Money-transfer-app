import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:gradp2p/core/constants/routes.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

abstract class InternetController extends GetxController {
  Pay();

  Payapi();
}

class InternetControllerImp extends InternetController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController PhoneNumber;

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  var current = 0.obs;

  final List<Map<String, dynamic>> DSLProvidersList = [
    {
      'text': ' We',
      'text2': 'WE-Home Internet Invoice',
      'TextFieldLabel': '  Phone no. ',
      'imageUrl': 'assets/images/we.png',
      'email': 'We@smartpay.com'
    },
    {
      'text': 'Vodafone',
      'text2': 'Vodafone ADSL',
      'TextFieldLabel': '  Phone no. ',
      'imageUrl': 'assets/images/vodafone.png',
      'email': 'Vodafone@smartpay.com'
    },
    {
      'text': 'Etisalat',
      'text2': 'Etisalat ADSL',
      'TextFieldLabel': '  Phone no. ',
      'imageUrl': 'assets/images/Etisalat.png',
      'email': 'Etisalat@smartpay.com'
    },
    {
      'text': 'Orange DSL',
      'text2': 'Orange ADSL',
      'TextFieldLabel': '  Phone no. ',
      'imageUrl': 'assets/images/orange.png',
      'email': 'Orange@smartpay.com'
    },
    {
      'text': 'noor DSL',
      'text2': 'noor ADSL',
      'TextFieldLabel': '  Phone no. ',
      'imageUrl': 'assets/images/Noor adsl.jpeg',
      'email': 'noor@smartpay.com'
    },
  ];
  String selectedProviderEmail = '';
  void changeIndex(int index) {
    current.value = index;
    selectedProviderEmail = DSLProvidersList[index]['email'];
  }

  @override
  Pay() {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      print("Valid");

      Get.toNamed(AppRoute.Internetinvoice);
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
    PhoneNumber.dispose();

    super.dispose();
  }
}
