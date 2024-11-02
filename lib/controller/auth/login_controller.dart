import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradp2p/core/constants/routes.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

abstract class LoginController extends GetxController {
  void Login();
  void goToSignup();
  getCode();
  Future<void> logiWithPhone();
  void gotoforgetPass();
}

class logincontrollerImp extends LoginController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController password;
  late TextEditingController phoneNumber;
  bool isshowpassword = true;

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  void showPassword() {
    isshowpassword = !isshowpassword;
    update();
  }

  @override
  void Login() {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      print("Valid");
      print(phoneNumber.text);
      print(password.text);
      logiWithPhone();
    } else {
      print("Not Valid");
    }
  }

  @override
  void goToSignup() {
    Get.offNamed(AppRoute.Signup);
  }

  @override
  void onInit() {
    password = TextEditingController();
    phoneNumber = TextEditingController();
    super.onInit();
  }

  @override
  Future<void> logiWithPhone() async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var request = http.Request(
        'POST',
        Uri.parse('https://smart-pay.onrender.com/api/v0/users/login'),
      );
      request.body =
          json.encode({"phone": phoneNumber.text, "password": password.text});
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        final responseBody = await response.stream.bytesToString();
        final jsonResponse = json.decode(responseBody);
        final token = jsonResponse['token'];
        final data = jsonResponse['data'];

        // Save token and user data in SharedPreferences
        final SharedPreferences prefs = await _prefs;
        await prefs.setString('token', token);

        await prefs.setString('smartEmail', data['smartEmail']);
        await prefs.setString('name', data['name']);

        await prefs.setString('phone', data['phone']);

        await prefs.setString('birthDate', data['birthDate']);

        print("Token and user data saved");
        getCode();
        Get.offAllNamed(AppRoute.otp);
      } else {
        print(response.reasonPhrase);
        Get.snackbar("Error", response.reasonPhrase!);
      }
    } catch (e) {
      Get.snackbar("Exception", e.toString());
    }
  }

  @override
  Future<void> getCode() async {
    try {
      final SharedPreferences prefs = await _prefs;
      final token = prefs.getString('token');

      if (token == null) {
        Get.snackbar("Error", "Token not found. Please login again.");
        return;
      }

      var headers = {'Authorization': 'Bearer $token'};
      var request = http.Request(
        'GET',
        Uri.parse(
            'https://smart-pay.onrender.com/api/v0/users/generatePhoneOtp'),
      );

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        print("otp");
        print(await response.stream.bytesToString());
      } else {
        print("otp");
        print(response.reasonPhrase);
        Get.snackbar("Error", response.reasonPhrase!);
      }
    } catch (e) {
      print("error");
      Get.snackbar("Exception", e.toString());
    }
  }

  @override
  void dispose() {
    password.dispose();
    phoneNumber.dispose();
    super.dispose();
  }

  @override
  void gotoforgetPass() {
    Get.toNamed(AppRoute.forgetPassPhone);
  }
}









