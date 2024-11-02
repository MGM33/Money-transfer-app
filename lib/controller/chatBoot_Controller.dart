import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

abstract class ChatbootController extends GetxController {
  Future<void> getChat();
  void sendMessage(String message);
}

class ChatbootControllerImp extends ChatbootController {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  var messages =
      <Map<String, dynamic>>[].obs; // Observable list to store messages

  @override
  Future<void> getChat() async {
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
          Uri.parse('https://smart-pay.onrender.com/api/v0/users/chat'));
      request.body = json.encode({"messages": messages});
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var responseBody = await response.stream.bytesToString();
        var jsonResponse = json.decode(responseBody);
        if (jsonResponse['status'] == 'success' &&
            jsonResponse['data']['response'] != null) {
          var responseMessage = jsonResponse['data']['response'];
          if (responseMessage['content'] != null &&
              responseMessage['content'].isNotEmpty) {
            messages.add(responseMessage);
          }
        }
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

  @override
  void sendMessage(String message) {
    if (message.isNotEmpty) {
      messages.add({"role": "user", "content": message});
      getChat();
    }
  }
}
