import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

abstract class WalletBalanceController extends GetxController {
  Future<void> getWalletBalance();
}

class WalletBalanceControllerImp extends WalletBalanceController {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  var balance = 0.0.obs; // Observable variable to store the balance

  @override
  Future<void> getWalletBalance() async {
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

      var request = http.Request('GET',
          Uri.parse('https://smart-pay.onrender.com/api/v0/users/balance'));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        final responseBody = await response.stream.bytesToString();
        final jsonResponse = json.decode(responseBody);
        balance.value = jsonResponse['data']['balance'];
        print('Balance: ${balance.value}');
      } else {
        print('Failed with status code: ${response.statusCode}');
        print('Response body: ${response.reasonPhrase}');
      }
    } catch (e) {
      Get.snackbar("Exception", e.toString());
    }
  }

  @override
  void onReady() {
    super.onReady();
    getWalletBalance();
  }
}
