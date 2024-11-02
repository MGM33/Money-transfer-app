import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:gradp2p/core/constants/routes.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

abstract class EducationController extends GetxController {
  Pay();

  Payapi();
}

class EducationControllerImp extends EducationController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController studentID;
  late TextEditingController NationalID;

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  var current = 0.obs;

  final List<Map<String, dynamic>> EducationProvidersList = [
    {
      'text': 'Cairo Univesity',
      'text2': 'Cairo University Tuitions',
      'TextFieldLabel': 'Student ID',
      'imageUrl': 'assets/images/education/Cairo Univesity.jpeg',
      'email': 'cairo_university@smartpay.com'
    },
    {
      'text': 'American School',
      'text2': 'American School Tuitions',
      'TextFieldLabel': 'Student ID',
      'imageUrl': 'assets/images/education/American School.png',
      'email': 'american_school@smartpay.com'
    },
    {
      'text': '30 June schools ',
      'text2': 'American School Tuitions',
      'TextFieldLabel': 'Student ID',
      'TextFieldLabel2': 'National ID',
      'imageUrl': 'assets/images/education/30 June schools.png',
      'email': '30_june_schools@smartpay.com'
    },
    {
      'text': 'Ain Shams University',
      'text2': 'Ain Shams University Tuitions',
      'TextFieldLabel': 'Student ID',
      'imageUrl': 'assets/images/education/Ain Shams University.png',
      'email': 'ain_shams_university@smartpay.com'
    },
    {
      'text': 'Nile University',
      'text2': 'Nile University Tuitions',
      'TextFieldLabel': 'National ID',
      'TextFieldLabel2': 'Name',
      'imageUrl': 'assets/images/education/Nile University.png',
      'email': 'nile_university@smartpay.com'
    },
    {
      'text': 'Egyptian E-learing',
      'text2': 'Egyptian E-learing Tuitions',
      'TextFieldLabel': 'Student ID',
      'imageUrl': 'assets/images/education/Egyptian E-learing.jpeg',
      'email': 'egyptian_e_learing@smartpay.com'
    },
  ];

  String selectedProviderEmail = '';
  void changeIndex(int index) {
    current.value = index;
    selectedProviderEmail = EducationProvidersList[index]['email'];
  }

  @override
  Pay() {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      print("Valid");

      Get.toNamed(AppRoute.Educationinvoice);
    } else {
      print("Not Valid");
    }
  }

  @override
  void onInit() {
    studentID = TextEditingController();
    NationalID = TextEditingController();

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
        "amount": 10000,
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
    studentID.dispose();
    NationalID.dispose();
    super.dispose();
  }
}
