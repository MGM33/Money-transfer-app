import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DefaultCardController extends GetxController {
  var name = ''.obs;
  var number = ''.obs;
  var id = ''.obs;
  var balance = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    loadDefaultCard();
  }

  Future<void> loadDefaultCard() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    name.value = prefs.getString('defaultCardName') ?? '';
    number.value = prefs.getString('defaultCardNumber') ?? '';
    id.value = prefs.getString('defaultCardId') ?? '';
    balance.value = prefs.getDouble('defaultCardBalance') ?? 0.0;
  }

  Future<void> setDefaultCard(Map<String, dynamic> card) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('defaultCardName', card['name']);
    await prefs.setString('defaultCardNumber', card['number']);
    await prefs.setString('defaultCardId', card['_id']);
    await prefs.setDouble('defaultCardBalance', card['balance']);
    loadDefaultCard();
  }
}
