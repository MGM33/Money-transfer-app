import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradp2p/controller/nitification/confirmNoti_controller.dart';
import 'package:gradp2p/core/constants/colors.dart';
import 'package:gradp2p/view/widget/auth/custombuttonauth.dart';
import 'package:intl/intl.dart';

class Collectsummary extends StatelessWidget {
  final Map<String, dynamic> notification;

  Collectsummary({required this.notification});
  final ConfirmnotiControllerImp controller =
      Get.put(ConfirmnotiControllerImp());

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Notification Details'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(),
              Container(
                decoration: BoxDecoration(
                  color: schafoldGrey,
                  borderRadius: BorderRadius.circular(20),
                ),
                width: width,
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'From:',
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            notification['transaction']['from'],
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'To:',
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            notification['transaction']['to'],
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                     
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     Text(
                      //       'Updated At:',
                      //       style: TextStyle(fontSize: 16),
                      //     ),
                      //     Text(notification['updatedAt'])
                      //   ],
                      // ),
                      // SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'ID:',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          Text(notification['_id'])
                        ],
                      ),
                      SizedBox(height: 10),

                       Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Date:',
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            DateFormat.yMMMd().format(
                                DateTime.parse(notification['createdAt'])),
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'State:',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            notification['state'],
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                      Divider(),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Amount:',
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            'Amount: ${notification['transaction']['amount']}',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Custombuttonauth(
                  buttonName: "Confirm",
                  onPressed: () {
                    controller.ConfirmNoti(
                        notification['_id']); // Pass the notification ID here
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
