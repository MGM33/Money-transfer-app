import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradp2p/controller/ManageCards/GetCards_controller.dart';
import 'package:gradp2p/controller/ManageCards/SelectBank_controller.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

abstract class AddcardController extends GetxController {
  void addNCard();
  Future<void> addCardApi();
}

class AddcardControllerImp extends AddcardController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController cardNumber;
  late TextEditingController fullName;
  late TextEditingController ccv;
  late TextEditingController date;
  late TextEditingController cardPin;
  var selectedBank = ''.obs;

  bool isshowpassword2 = true;

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final BankSelectionController bankSelectionController =
      Get.find(); // Find the BankSelectionController
  final GetcardsControllerImp cardsController =
      Get.find(); // Find the GetcardsControllerImp

  void showhidePassword2() {
    isshowpassword2 = !isshowpassword2;
    update();
  }

  @override
  void addNCard() {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      print("Valid");
      print(fullName.text);
      print(cardNumber.text);
      addCardApi();
    } else {
      print("Not Valid");
    }
  }

  @override
  void onInit() {
    fullName = TextEditingController();
    cardNumber = TextEditingController();
    ccv = TextEditingController();
    date = TextEditingController();
    cardPin = TextEditingController();
    super.onInit();
  }

  @override
  Future<void> addCardApi() async {
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
      var request = http.Request('POST',
          Uri.parse('https://smart-pay.onrender.com/api/v0/users/cards'));
      request.body =
          json.encode({"name": fullName.text, "number": cardNumber.text});
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        print(await response.stream.bytesToString());

        Get.back();
        Get.snackbar("Success", "Card Added");
        cardsController.GetCards(); // Update cards list after adding a new card
      } else {
        print(response.reasonPhrase);
        Get.snackbar("Error", "Adding Card Failed");
      }
    } catch (e) {
      Get.snackbar("Exception", e.toString());
    }
  }

  @override
  void dispose() {
    cardNumber.dispose();
    fullName.dispose();
    ccv.dispose();
    date.dispose();
    cardPin.dispose();
    super.dispose();
  }
}
