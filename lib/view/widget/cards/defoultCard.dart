import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradp2p/controller/ManageCards/DefaultCard_Controller.dart';

class Defoultcard extends StatelessWidget {
  Defoultcard({super.key});

  final DefaultCardController defaultCardController =
      Get.put(DefaultCardController());

  @override
  Widget build(BuildContext context) {
    defaultCardController.loadDefaultCard();
    return Obx(() {
            String cardNumber = defaultCardController.number.value;
                  String last4Digits = cardNumber.length >= 4
                      ? cardNumber.substring(cardNumber.length - 4)
                      : cardNumber;
             
                  
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 340,
          height: 80,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 1, color: Color(0xFF5163BF)),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 60,
                width: 60,
                child: Image.asset("assets/images/logo.png"),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    defaultCardController.name.value,
                    style: TextStyle(
                      color: Color(0xFF1E1E1E),
                      fontSize: 12,
                      fontFamily: 'Actor',
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.04,
                    ),
                  ),
                  Text(
                     '**** **** **** $last4Digits',
                    style: TextStyle(
                      color: Color(0xFF1E1E1E),
                      fontSize: 12,
                      fontFamily: 'Actor',
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.04,
                    ),
                  ),
                ],
              ),
              // GestureDetector(
              //   onTap: () {
              //     // Handle check balance action
              //   },
              //   child: Container(
              //     child: const Column(
              //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //       children: [
              //         Text(
              //           'Check',
              //           style: TextStyle(
              //             color: Color(0xFF5163BF),
              //             fontSize: 16,
              //             fontFamily: 'Poppins',
              //             fontWeight: FontWeight.w500,
              //             letterSpacing: 0.05,
              //           ),
              //         ),
              //         Text(
              //           'Balance',
              //           style: TextStyle(
              //             color: Color(0xFF5163BF),
              //             fontSize: 16,
              //             fontFamily: 'Poppins',
              //             fontWeight: FontWeight.w500,
              //             letterSpacing: 0.05,
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // )
            ],
          ),
        ),
      );
    });
  }
}
