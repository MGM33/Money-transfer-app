import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserController extends GetxController {
  var smartEmail = 'Loading...'.obs;

  @override
  void onInit() {
    super.onInit();
    _getUserData();
  }

  Future<void> _getUserData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String email = prefs.getString('smartEmail') ?? 'No Email';
    smartEmail.value = email;
  }
}
