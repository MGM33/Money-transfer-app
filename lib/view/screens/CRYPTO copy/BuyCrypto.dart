import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradp2p/controller/crypto/buycrypto_controller.dart';
import 'package:gradp2p/core/functions/validInput.dart';
import 'package:gradp2p/view/widget/auth/custombuttonauth.dart';
import 'package:gradp2p/view/widget/send&recieve/customAmountField.dart';

class Buycrypto extends StatelessWidget {
  final BuycryptoControllerImp controller = Get.put(BuycryptoControllerImp());

  Buycrypto({super.key});

  @override
  Widget build(BuildContext context) {
    final arguments = Get.arguments as Map<String, dynamic>? ?? {};
    final selectItemID = arguments['selectItemID'] as String? ?? '';
    final name = arguments['name'] as String? ?? 'Unknown';
    final additionalName = arguments['additionalName'] as String? ?? '';
    final price = arguments['price'] as double? ?? 0.0;
    final image = arguments['image'] as String? ?? '';

    controller.name.value = name; // Set the name in the controller

    return Scaffold(
      appBar: AppBar(
        title: Text('Buy Crypto'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            size: 32,
            color: Colors.black54,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Form(
        key: controller.formstate,
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Card(
                elevation: 3,
                color: Colors.blueAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "$name ($additionalName)",
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Text(
                                "Price: \$${price.toStringAsFixed(2)}",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        height: 60,
                        width: 60,
                        child: image.isNotEmpty
                            ? Image.network(image)
                            : Container(),
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  CustomAmountfield(
                    labeltext: "$name amount",
                    mycontroller: TextEditingController()
                      ..text = controller.amount.value,
                    prefix: Icon(
                      Icons.currency_bitcoin_outlined,
                    ),
                    valid: (val) {
                      return validInput(val!, 1, 6, "amount");
                    },
                    onnchanged: (val) {
                      controller.amount.value = val!;
                    },
                  ),
                  SizedBox(height: 20),
                  Divider(thickness: 2),
                  SizedBox(height: 20),
                  Obx(() {
                    final amount =
                        double.tryParse(controller.amount.value) ?? 0.0;
                    final cryptoAmount = amount * price;
                    return Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Text(
                              "amount in USD",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              cryptoAmount.toStringAsFixed(6),
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.blueAccent,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ],
              ),
              Custombuttonauth(
                buttonName: "Confirm",
                onPressed: () {
                  // Handle confirm action
                  controller.Buy();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
