import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradp2p/core/constants/routes.dart';
import 'package:gradp2p/view/widget/send&recieve/send_recieveCaed.dart';

class Billpaymentscreen extends StatelessWidget {
  Billpaymentscreen({super.key});

  final List<Map<String, dynamic>> dataList = [
    {'text': ' Electricity ', 'imageUrl': 'assets/images/lightning.png'},
    {'text': ' Internet ', 'imageUrl': 'assets/images/wifi.png'},
    {'text': ' Lanline ', 'imageUrl': 'assets/images/icons8-phone-16.png'},
    {'text': ' Mobile Recharge ', 'imageUrl': 'assets/images/phone_iphone.png'},
    {'text': ' Gas Bills ', 'imageUrl': 'assets/images/Pressure.png'},
    {'text': ' Water Bills ', 'imageUrl': 'assets/images/Group 1 (5) 1.jpg'},
    {'text': ' Education ', 'imageUrl': 'assets/images/school_8670806 (1).png'},
    {'text': ' Traffic Fines ',  'imageUrl':'assets/images/speeding-ticket.png'},
    {
      'text': ' Clubs Subscription ',
      'imageUrl': 'assets/images/night-club.png'
    },
    {'text': ' Financial ', 'imageUrl': 'assets/images/blue.png'},
    {'text': ' Banks ', 'imageUrl': 'assets/images/bank.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bill Payment'),
        centerTitle: true, // Center the title horizontally
        leading: IconButton(
          icon: const Icon(Icons.arrow_back), // Leading arrow icon
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
           send_recieveCard(),
            const SizedBox(
              height: 60,
            ),
            Expanded(
              child: GridView.builder(
                scrollDirection: Axis.vertical,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // Number of columns
                ),
                itemCount: dataList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      if (index == 0) {
                        Get.toNamed(AppRoute.Electricitybill);
                      } else if (index == 1) {
                        Get.toNamed(AppRoute.Internetbill);
                      } else if (index == 2) {
                        Get.toNamed(AppRoute.Landlinebill);
                      } else if (index == 3) {
                        Get.toNamed(AppRoute.Mobilerecharge);
                      } else if (index == 4) {
                        Get.toNamed(AppRoute.Gasbills);
                      } else if (index == 5) {
                        Get.toNamed(AppRoute.Waterbills);
                      } else if (index == 6) {
                        Get.toNamed(AppRoute.Educationbills);
                      } else if (index == 7) {
                        Get.toNamed(AppRoute.Traficfines);
                      } else if (index == 8) {
                        Get.toNamed(AppRoute.Clubsubsribtion);
                      } else if (index == 9) {
                        Get.toNamed(AppRoute.Finantialbills);
                      } else if (index == 10) {
                        Get.toNamed(AppRoute.Banksbills);
                      } else {}
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 91.0,
                        height: 109.0,
                        decoration: ShapeDecoration(
                          color: const Color(0xFFF8F9FA),
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                                width: 1.06, color: Color(0xFFEFF1F4)),
                            borderRadius: BorderRadius.circular(14.89),
                          ),
                          shadows: const [
                            BoxShadow(
                              color: Color(0x423A7BF8),
                              blurRadius: 40,
                              offset: Offset(0, 10),
                              spreadRadius: 0,
                            )
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset(
                              dataList[index]['imageUrl'],
                            ),
                            Text(
                              dataList[index]['text'],
                              textAlign: TextAlign.center,
                              style: const TextStyle(
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
          ],
        ),
      ),
    );
  }
}
