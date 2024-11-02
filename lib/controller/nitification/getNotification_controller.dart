import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

abstract class GetnotificationController extends GetxController {
  GetNoti();
  resetNotificationCount();
}

class GetnotificationControllerImp extends GetnotificationController {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  var notifications = [].obs; // Observable list to store notifications
  var newNotificationsCount =
      0.obs; // Observable to store new notifications count

  @override
  Future<void> GetNoti() async {
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
          Uri.parse('https://smart-pay.onrender.com/api/v0/notifications'));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        final responseBody = await response.stream.bytesToString();
        final jsonResponse = json.decode(responseBody);
        notifications.value = jsonResponse['data']; // Store the response data
        newNotificationsCount.value =
            jsonResponse['data'].length; // Update the count
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
  void resetNotificationCount() {
    newNotificationsCount.value = 0; // Reset the new notifications count
  }
}






// abstract class GetnotificationController extends GetxController {
//   GetNoti();
// }

// class GetnotificationControllerImp extends GetnotificationController {
//   final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
//   var notifications = [].obs; // Observable list to store notifications
//   var newNotificationsCount =
//       0.obs; // Observable to store new notifications count

//   @override
//   Future<void> GetNoti() async {
//     try {
//       final SharedPreferences prefs = await _prefs;
//       final token = prefs.getString('token');

//       if (token == null) {
//         Get.snackbar("Error", "Token not found. Please login again.");
//         return;
//       }

//       var headers = {
//         'Content-Type': 'application/json',
//         'Authorization': 'Bearer $token'
//       };

//       var request = http.Request('GET',
//           Uri.parse('https://smart-pay.onrender.com/api/v0/notifications'));

//       request.headers.addAll(headers);

//       http.StreamedResponse response = await request.send();

//       if (response.statusCode == 200) {
//         final responseBody = await response.stream.bytesToString();
//         final jsonResponse = json.decode(responseBody);
//         notifications.value = jsonResponse['data']; // Store the response data
//         newNotificationsCount.value =
//             jsonResponse['data'].length; // Update the count
//       } else {
//         print(response.reasonPhrase);
//       }
//     } catch (e) {
//       Get.snackbar("Exception", e.toString());
//     }
//   }
// }




// import 'dart:convert';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';

// abstract class GetnotificationController extends GetxController {
//   Future<void> GetNoti();
// }

// class GetnotificationControllerImp extends GetnotificationController {
//   final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
//   var notifications = [].obs; // Observable list to store notifications

//   @override
//   Future<void> GetNoti() async {
//     try {
//       final SharedPreferences prefs = await _prefs;
//       final token = prefs.getString('token');

//       if (token == null) {
//         Get.snackbar("Error", "Token not found. Please login again.");
//         return;
//       }
//       var headers = {
//         'Content-Type': 'application/json',
//         'Authorization': 'Bearer $token'
//       };

//       var request = http.Request('GET',
//           Uri.parse('https://smart-pay.onrender.com/api/v0/notifications'));

//       request.headers.addAll(headers);

//       http.StreamedResponse response = await request.send();

//       if (response.statusCode == 200) {
//         final responseBody = await response.stream.bytesToString();
//         final jsonResponse = json.decode(responseBody);
//         notifications.value = jsonResponse['data']; // Store the response data
//       } else {
//         print(response.reasonPhrase);
//       }
//     } catch (e) {
//       Get.snackbar("Exception", e.toString());
//     }
//   }
// }
