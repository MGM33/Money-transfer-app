import 'dart:convert';
import 'package:get/get.dart';
import 'package:gradp2p/core/constants/routes.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

abstract class ConfirmnotiController extends GetxController {
  Future<void> ConfirmNoti(String id);
}

class ConfirmnotiControllerImp extends ConfirmnotiController {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  Future<void> ConfirmNoti(String id) async {
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
              'https://smart-pay.onrender.com/api/v0/notifications/confirmNotification/$id'));
      request.body = json.encode({"accept": true});
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        print(await response.stream.bytesToString());

        Get.offNamed(AppRoute.Bottomnavbar);
        Get.snackbar("succes", "send succesfully.");
      } else {
        print(id);
        print(response);
        print(response.reasonPhrase);
        Get.snackbar("Error", "send Failed.");
      }
    } catch (e) {
      Get.snackbar("Exception", e.toString());
    }
  }
}
