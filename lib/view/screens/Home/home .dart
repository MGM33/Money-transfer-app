import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradp2p/controller/nitification/getNotification_controller.dart';
import 'package:gradp2p/core/constants/routes.dart';
import 'package:gradp2p/view/widget/drawer.dart';
import 'package:gradp2p/view/screens/collect/collectNotifications.dart';
import 'package:gradp2p/view/widget/homeContainers/homeCreditcardContainer.dart';
import 'package:gradp2p/view/widget/homeContainers/transactionhistorycontainer.dart';
import 'package:gradp2p/view/widget/homeContainers/userName.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final List<Map<String, dynamic>> dataList = [
    {
      'text': 'Send Money ',
      'imageUrl': 'assets/images/noun_send_3612583 1.png'
    },
    {
      'text': 'Receive Money ',
      'imageUrl': 'assets/images/noun_send_3612583 1 (1).png'
    },
    //{'text': ' Check Balance', 'imageUrl': 'assets/images/Bank Card.png'},
    {'text': ' Bill Payment', 'imageUrl': 'assets/images/Vector.png'},
    {
      'text': ' Transactions',
      'imageUrl': 'assets/images/Horizontal_switch_light.png'
    },
    {'text': ' Cryptocurrency', 'imageUrl': 'assets/images/Cypto.png'},
    {'text': ' Donations', 'imageUrl': 'assets/images/donate.png'},
  ];

  @override
  Widget build(BuildContext context) {
    final GetnotificationControllerImp notificationController =
        Get.put(GetnotificationControllerImp());

    // Fetch notifications when the screen is loaded
    notificationController.GetNoti();
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          actions: [
            Obx(() {
              return Stack(
                children: [
                  IconButton(
                    icon: Icon(Icons.notifications_active),
                    onPressed: () {
                      Get.to(() => CollectNoti());
                      notificationController.newNotificationsCount == 0;
                    },
                  ),
                  if (notificationController.newNotificationsCount.value > 0)
                    Positioned(
                      right: 11,
                      top: 11,
                      child: Container(
                        padding: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        constraints: BoxConstraints(
                          minWidth: 14,
                          minHeight: 14,
                        ),
                        child: Text(
                          '${notificationController.newNotificationsCount.value}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 8,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                ],
              );
            }),
          ],
        ),
        drawer: navDrawer(),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  'Welcome Back',
                  style: TextStyle(
                    color: Color(0xFF878787),
                    fontSize: 18,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.05,
                  ),
                ),
                Username(),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Accounts',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF878787),
                        fontSize: 16,
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.05,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(AppRoute.manageCards);
                      },
                      child: const Text(
                        'Mange',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF5163BF),
                          fontSize: 16,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.05,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 80,
                  width: width,
                  child: const cardwallet(),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Service',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF878787),
                        fontSize: 16,
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.05,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(AppRoute.service);
                      },
                      child: const Text(
                        'More >',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF5163BF),
                          fontSize: 16,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.05,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: height * 0.9 / 3,
                  child: GridView.builder(
                    //scrollDirection: Axis.vertical,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, // Number of columns
                    ),
                    itemCount: dataList.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          if (index == 0) {
                            Get.toNamed(AppRoute.Sendscreen);
                          } else if (index == 1) {
                            Get.toNamed(AppRoute.Recievescreen);
                          } else if (index == 2) {
                            Get.toNamed(AppRoute.Billpaymentscreen);
                          } else if (index == 3) {
                            Get.toNamed(AppRoute.transaction);
                          } else if (index == 4) {
                            Get.toNamed(AppRoute.CryptoHome);
                          } else if (index == 5) {
                            Get.toNamed(AppRoute.DonationsScreen);
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 91.0,
                            height: 109.0,
                            decoration: ShapeDecoration(
                              color: Color(0xFFF8F9FA),
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
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Last Transactions',
                      style: TextStyle(
                        color: Color(0xFF878787),
                        fontSize: 18,
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w400,
                        height: 0.07,
                        letterSpacing: 0.05,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(AppRoute.transaction);
                      },
                      child: const Text(
                        'See All  >',
                        style: TextStyle(
                          color: Color(0xFF5163BF),
                          fontSize: 16,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.05,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  // height: height * 0.9 / 3,
                  child: LastTransactionsWidget(),
                ),
                SizedBox(
                  height: height / 9,
                )
              ],
            ),
          ),
        ));
  }
}
