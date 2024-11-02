import 'package:get/get.dart';

class BankSelectionController extends GetxController {
  var selectedBank = ''.obs;

  void setSelectedBank(String value) {
    selectedBank.value = value;
  }
}
