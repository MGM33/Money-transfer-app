import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

abstract class CryptoTransactionhistoryController extends GetxController {
  Future<void> Gethistory();
}

class CryptoTransactionhistoryControllerImp extends CryptoTransactionhistoryController {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  var Cryptotransaction = [].obs; // Observable list to store transactions
  var isLoading = true.obs; // Observable to track loading state

  @override
  void onInit() {
    super.onInit();
    Gethistory(); // Fetch initial data
  }

  @override
  Future<void> Gethistory() async {
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
          'GET',
          Uri.parse(
              'https://smart-pay.onrender.com/api/v0/transactions/cryptoTransactions'));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        final responseBody = await response.stream.bytesToString();
        final jsonResponse = json.decode(responseBody);
        Cryptotransaction.assignAll(jsonResponse['data']);
      } else {
        print('Error: ${response.reasonPhrase}');
        Get.snackbar("Error", response.reasonPhrase ?? "Unknown error");
      }
    } catch (e) {
      Get.snackbar("Exception", e.toString());
    } finally {
      isLoading.value = false; // Stop loading indicator
    }
  }
}
