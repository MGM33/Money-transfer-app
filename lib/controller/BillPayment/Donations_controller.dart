import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:gradp2p/core/constants/routes.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

abstract class DonationsController extends GetxController {
  Donate();

  Donateapi();
}

class DonationsControllerImp extends DonationsController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController amount;

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  var current = 0.obs;

  List<Map<String, dynamic>> donationsList = [
    {
      'text': 'Bayt Al Zakat',
      'imageUrl': 'assets/images/Bayt Al Zakat.jpeg',
      'email': 'bayt_al_zakat@smartpay.com'
    },
    {
      'text': '57357',
      'imageUrl': 'assets/images/57357.png',
      'email': '57357@smartpay.com'
    },
    {
      'text': 'Resala',
      'imageUrl': 'assets/images/Resala.png',
      'email': 'resala@smartpay.com'
    },
    {
      'text': 'Abou elRich ElMonera',
      'imageUrl': 'assets/images/Abou elRich ElMonera.jpeg',
      'email': 'abou_elrich@smartpay.com'
    },
    {
      'text': 'El Nas Hospital',
      'imageUrl': 'assets/images/El Nas Hospital.png',
      'email': 'el_nas@smartpay.com'
    },
    {
      'text': 'Egyption Food Bank',
      'imageUrl': 'assets/images/Egyption Food Bank.jpeg',
      'email': 'egyption_food_bank@smartpay.com'
    },
    {
      'text': 'Misr Elkheir',
      'imageUrl': 'assets/images/Misr Elkheir.png',
      'email': 'misr_elkheir@smartpay.com'
    },
    {
      'text': 'Baheya',
      'imageUrl': 'assets/images/Baheya.png',
      'email': 'baheya@smartpay.com'
    },
    {
      'text': 'Mersal Foundation',
      'imageUrl': 'assets/images/Mersal Foundation.png',
      'email': 'mersal_foundation@smartpay.com'
    },
  ];

  String selectedProviderEmail = '';

  void changeIndex(int index) {
    current.value = index;
    selectedProviderEmail = donationsList[index]['email'];
  }

  @override
  Donate() {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      print("Valid");

      print(amount);
      Donateapi();
    } else {
      print("Not Valid");
    }
  }

  @override
  void onInit() {
    amount = TextEditingController();
    selectedProviderEmail =
        donationsList[0]['email']; // Default to the first provider

    super.onInit();
  }

  @override
  Future<void> Donateapi() async {
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
        Get.snackbar("Error", 'Payment Failed');
      }
    } catch (e) {
      Get.snackbar("Exception", e.toString());
    }
  }

  @override
  void dispose() {
    amount.dispose();

    super.dispose();
  }
}
