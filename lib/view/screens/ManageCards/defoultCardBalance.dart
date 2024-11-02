import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradp2p/controller/ManageCards/DefaultCard_Controller.dart';
import 'package:gradp2p/core/constants/routes.dart';
import 'package:gradp2p/view/widget/auth/custombuttonauth.dart';
import 'package:gradp2p/view/widget/cards/defoultCard.dart';

class checkdefoultBalance extends StatelessWidget {
  checkdefoultBalance({super.key});

  final DefaultCardController defaultCardController =
      Get.put(DefaultCardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Icon(
                    Icons.arrow_back,
                    size: 32,
                    color: Colors.black54,
                  ),
                ),
              ),
              SizedBox(height: 50),
              Defoultcard(),
              SizedBox(height: 120),
              Obx(
                () => Text(
                  '${defaultCardController.balance.value.toStringAsFixed(2)} LE',
                  style: TextStyle(
                    color: Color(0xFF5163BF),
                    fontSize: 35,
                    fontFamily: 'Aclonica',
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.11,
                  ),
                ),
              ),
              SizedBox(height: 300),
              Custombuttonauth(
                buttonName: "confirm",
                onPressed: () {
                  Get.back();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
