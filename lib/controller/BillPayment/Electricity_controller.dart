import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:gradp2p/core/constants/routes.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

abstract class ElectricityController extends GetxController {
  Pay();

  Payapi();
}

class ElectricityControllerImp extends ElectricityController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController number;

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  var current = 0.obs;

  final List<Map<String, dynamic>> EProvidersList = [
    {
      'text': 'South Cairo',
      'text2': 'South Cairo',
      'TextFieldLabel': 'E-Payment Code',
      'imageUrl': 'assets/images/South Cairo E.jpeg',
      'email': 'SouthCairo@smartpay.com'
    },
    {
      'text': 'North Cairo',
      'text2': 'North Cairo',
      'TextFieldLabel': 'Payment Code',
      'imageUrl': 'assets/images/North Cairo E.jpeg',
      'email': 'NorthCairo@smartpay.com'
    },
    {
      'text': 'Canal Electricity',
      'text2': 'Canal Electricity',
      'TextFieldLabel': 'Subscriber ID',
      'imageUrl': 'assets/images/Canal Electricity E.png',
      'email': 'CanalElectricity@smartpay.com'
    },
    {
      'text': 'Alexandria Electricty',
      'text2': 'Alexandria Electricty',
      'TextFieldLabel': 'E-Code(16-Digits)',
      'imageUrl': 'assets/images/Alexandria Electricty E.jpeg',
      'email': 'AlexandriaElectricty@smartpay.com'
    },
    {
      'text': 'South Delta Electricity',
      'text2': 'South Delta Electricity',
      'TextFieldLabel': 'Subscriber ID(13-Digits)',
      'imageUrl': 'assets/images/South Delta Electricity E.jpeg',
      'email': 'SouthDeltaElectricity@smartpay.com'
    },
    {
      'text': 'Upper Egypt Electricity',
      'text2': 'Upper Egypt Electricity',
      'TextFieldLabel': 'E-Payment Code(16-Digits)',
      'imageUrl': 'assets/images/Upper Egypt Electricity E.jpeg',
      'email': 'UpperEgyptElectricity@smartpay.com'
    },
    {
      'text': 'North Delta Electricity',
      'text2': 'North Delta Electricity',
      'TextFieldLabel': 'Payment Code(13-Digits after /)',
      'imageUrl': 'assets/images/North Delta Electricity E.jpeg',
      'email': 'NorthDeltaElectricity@smartpay.com'
    },
    {
      'text': 'TAQA Power',
      'text2': 'TAQA Power',
      'TextFieldLabel': 'Electricity Meter Number.',
      'imageUrl': 'assets/images/taqa_arabia_logo.jpeg',
      'email': 'TAQAPower@smartpay.com'
    },
    {
      'text': 'Injaz Electricity',
      'text2': 'Injaz Electricity',
      'TextFieldLabel': 'Bill Nubmer.',
      'imageUrl': 'assets/images/Injaz Electricity E.png',
      'email': 'InjazElectricity@smartpay.com'
    },
    {
      'text': 'Middle Egypt Electricity',
      'text2': 'Middle Egypt Electricity',
      'TextFieldLabel': 'Subscription Number(10-Digits)',
      'imageUrl': 'assets/images/Middle Egypt Electricity E.jpeg',
      'email': 'MiddleEgyptElectricity@smartpay.com'
    },
  ];

  String selectedProviderEmail = '';
  void changeIndex(int index) {
    current.value = index;
    selectedProviderEmail = EProvidersList[index]['email'];
  }

  @override
  Pay() {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      print("Valid");
      Get.toNamed(AppRoute.Electricityinvoice);
    } else {
      print("Not Valid");
    }
  }

  @override
  void onInit() {
    number = TextEditingController();

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
    number.dispose();

    super.dispose();
  }
}
