import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradp2p/controller/recieve/recieve_controller.dart';
import 'package:gradp2p/view/screens/QRScreens/generateQRcollect.dart';
import 'package:gradp2p/view/screens/recieveScreens/MultipleCollect.dart';
import 'package:gradp2p/view/screens/recieveScreens/mobileNumber.dart';
import 'package:gradp2p/view/screens/recieveScreens/paymentAddress.dart';
import 'package:gradp2p/view/widget/send&recieve/send_recieveCaed.dart';

class Recievescreen extends StatelessWidget {
  Recievescreen({super.key});
  final RecieveController controller = Get.put(RecieveController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Money collect'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            size: 32,
            color: Colors.black54,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              send_recieveCard(),
              SizedBox(height: 20),
              Divider(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      "Collect money from",
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(5),
                width: double.infinity,
                child: SizedBox(
                  height: 120,
                  width: double.infinity,
                  child: ListView.builder(
                    itemCount: controller.dataList.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (ctx, index) {
                      return GestureDetector(
                        onTap: () {
                          controller.changeIndex(index);
                        },
                        child: Obx(
                          () => Container(
                            margin: EdgeInsets.all(5),
                            width: 80,
                            height: 97,
                            decoration: BoxDecoration(
                              color: controller.current.value == index
                                  ? Colors.white70
                                  : Colors.white54,
                              borderRadius: controller.current.value == index
                                  ? BorderRadius.circular(15)
                                  : BorderRadius.circular(10),
                              border: controller.current.value == index
                                  ? Border.all(
                                      color: Colors.blue,
                                      width: 2,
                                    )
                                  : null,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.asset(
                                  controller.dataList[index]['imageUrl'],
                                ),
                                Text(
                                  controller.dataList[index]['text'],
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFF3177FF),
                                    fontSize: 12,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Obx(() => Visibility(
                    visible: controller.current.value == 0,
                    child:
                        RecieveFromMobileNumber(), // Assuming SendToMobileNumber() is defined elsewhere
                  )),
              Obx(() => Visibility(
                    visible: controller.current.value == 1,
                    child:
                        RecieveFromPaymentAddress(), // Assuming SendToCard() is defined elsewhere
                  )),
              Obx(() => Visibility(
                    visible: controller.current.value == 2,
                    child:
                        Multiplecollect(), // Assuming SendToPaymentAddress() is defined elsewhere
                  )),
              Obx(() => Visibility(
                    visible: controller.current.value == 3,
                    child:
                        ReceiveMoneyScreen(), // Assuming SendToPaymentAddress() is defined elsewhere
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
