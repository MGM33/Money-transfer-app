import 'package:get/get.dart';

class SendController extends GetxController {
  var current = 0.obs;

  List<Map<String, dynamic>> dataList = [
    {'text': 'Mobile Number', 'imageUrl': 'assets/images/send 1.png'},
    {'text': 'Card', 'imageUrl': 'assets/images/send 2.png'},
    {'text': 'Payment Address', 'imageUrl': 'assets/images/send 3.png'},
    {'text': 'scan QR', 'imageUrl': 'assets/images/Pocket.png'},
  ];

  void changeIndex(int index) {
    current.value = index;
  }
}
