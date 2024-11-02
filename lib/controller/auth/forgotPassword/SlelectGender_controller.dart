import 'package:get/get.dart';

class SlelectgenderController extends GetxController {
  var selectedgender = ''.obs;

  void setSelectedgender(String value) {
    selectedgender.value = value;
  }
}
