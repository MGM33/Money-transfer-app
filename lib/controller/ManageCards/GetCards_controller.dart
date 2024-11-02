import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

abstract class GetcardsController extends GetxController {
  GetCards();
}

class GetcardsControllerImp extends GetcardsController {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  var cards = [].obs; // Observable list to store cards

  @override
  Future<void> GetCards() async {
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
          Uri.parse('https://smart-pay.onrender.com/api/v0/users/cards'));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        // print(await response.stream.bytesToString());
        final responseBody = await response.stream.bytesToString();
        final jsonResponse = json.decode(responseBody);
        cards.value = jsonResponse['data'];
        print(cards);
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      Get.snackbar("Exception", e.toString());
    }
  }

  @override
  void onReady() {
    super.onReady();
  }
}
