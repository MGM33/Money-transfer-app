
import 'package:get/get.dart';

class SlelectcityController extends GetxController {
  var selectedcity = ''.obs;

  void setSelectedcity(String value) {
    selectedcity.value = value;
  }
}
