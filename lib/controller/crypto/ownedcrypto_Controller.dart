import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

abstract class OwnedcryptoController extends GetxController {
  Future<void> GetOwnedCrypto();
}

class OwnedcryptoControllerImp extends OwnedcryptoController {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  var ownedCrypto = [].obs; // Observable list to store owned crypto

  @override
  Future<void> GetOwnedCrypto() async {
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
          Uri.parse('https://smart-pay.onrender.com/api/v0/users/crypto'));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        final responseBody = await response.stream.bytesToString();
        final jsonResponse = json.decode(responseBody);
        ownedCrypto.value = jsonResponse['data'];
        print(ownedCrypto);
        // print(responseBody);
      } else {
        //  print(response.reasonPhrase);
      }
    } catch (e) {
      Get.snackbar("Exception", e.toString());
    }
  }

  @override
  void onReady() {
    super.onReady();
    GetOwnedCrypto();
  }
}
