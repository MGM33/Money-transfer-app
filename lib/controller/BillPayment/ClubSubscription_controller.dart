import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:gradp2p/core/constants/routes.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

abstract class ClubsubscriptionController extends GetxController {
  Pay();

  Payapi();
}

class ClubsubscriptionControllerImp extends ClubsubscriptionController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController subscribeNumber;
  late TextEditingController MobileNumber;

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  var current = 0.obs;

  final List<Map<String, dynamic>> ClubsList = [
    {
      'text': 'Matrix Sports Club',
      'text2': 'Matrix Sports Club Membership Installment',
      'TextFieldLabel': 'Subscription Number',
      'TextFieldLabel2': 'Mobile Number',
      'imageUrl': 'assets/images/clubs/Matrix Sports Club.png',
      'email': 'matrix_sports_club@smartpay.com'
    },
    {
      'text': 'Matrix Sports Club',
      'text2': 'Matrix Sports Club Membership Renewals',
      'TextFieldLabel': 'Membership ID',
      'TextFieldLabel2': 'Mobile Number',
      'imageUrl': 'assets/images/clubs/Matrix Sports Club.png',
      'email': 'matrix_sports_club@smartpay.com'
    },
    {
      'text': 'Elshams Club',
      'text2': 'Elshams Club Membership Installment',
      'TextFieldLabel': 'Membership ID',
      'TextFieldLabel2': 'Mobile Number',
      'imageUrl': 'assets/images/clubs/Elshams Club.jpeg',
      'email': 'elshams_club@smartpay.com'
    },
    {
      'text': 'Elshams Club',
      'text2': 'Elshams Club Membership Renewals',
      'TextFieldLabel': 'Membership ID',
      'TextFieldLabel2': 'Mobile Number',
      'imageUrl': 'assets/images/clubs/Elshams Club.jpeg',
      'email': 'elshams_club@smartpay.com'
    },
    {
      'text': 'Shooting Club',
      'text2': 'Shooting Club Membership Installment',
      'TextFieldLabel': 'Membership ID',
      'TextFieldLabel2': 'Mobile Number',
      'imageUrl': 'assets/images/clubs/Shooting Club.png',
      'email': 'shooting_club@smartpay.com'
    },
    {
      'text': 'Shooting Club',
      'text2': 'Shooting Club Membership Renewals',
      'TextFieldLabel': 'Membership ID',
      'TextFieldLabel2': 'Mobile Number',
      'imageUrl': 'assets/images/clubs/Shooting Club.png',
      'email': 'shooting_club@smartpay.com'
    },
    {
      'text': 'Ismaily Club',
      'text2': 'Ismaily Club Membership Installment',
      'TextFieldLabel': 'Membership ID',
      'TextFieldLabel2': 'Mobile Number',
      'imageUrl': 'assets/images/clubs/Ismaily Club.png',
      'email': 'ismaily_club@smartpay.com'
    },
    {
      'text': 'Ismaily Club',
      'text2': 'Ismaily Club Membership Renewals',
      'TextFieldLabel': 'Membership ID',
      'TextFieldLabel2': 'Mobile Number',
      'imageUrl': 'assets/images/clubs/Ismaily Club.png',
      'email': 'ismaily_club@smartpay.com'
    },
    {
      'text': 'Alahly Club',
      'text2': 'Alahly Club Membership Installment',
      'TextFieldLabel': 'Membership ID',
      'TextFieldLabel2': 'Mobile Number',
      'imageUrl': 'assets/images/clubs/Alahly Club.png',
      'email': 'alahly_club@smartpay.com'
    },
    {
      'text': 'Alahly Club',
      'text2': 'Alahly Club Membership Renwewals',
      'TextFieldLabel': 'Membership ID',
      'TextFieldLabel2': 'Mobile Number',
      'imageUrl': 'assets/images/clubs/Alahly Club.png',
      'email': 'alahly_club@smartpay.com'
    },
  ];

  String selectedProviderEmail = '';
  void changeIndex(int index) {
    current.value = index;
    selectedProviderEmail = ClubsList[index]['email'];
  }

  @override
  Pay() {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      print("Valid");

      Get.toNamed(AppRoute.Clubsinvoice);
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
    subscribeNumber.dispose();
    MobileNumber.dispose();
    super.dispose();
  }
}
