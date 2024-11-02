import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradp2p/controller/BillPayment/Electricity_controller.dart';
import 'package:gradp2p/controller/BillPayment/Water_controller.dart';
import 'package:gradp2p/core/constants/colors.dart';
import 'package:gradp2p/view/widget/auth/custombuttonauth.dart';
import 'package:intl/intl.dart';

class Waterinvoice extends StatelessWidget {
  final WaterControllerImp controller = Get.put(WaterControllerImp());

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Water Bill Details'),
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
                      Center(
                        child: Text(
                          ' Water Bill',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'To:',
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            controller.selectedProviderEmail,
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Subscribtion Number:',
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            controller.subnumber.text,
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),

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

                      Divider(),
                      SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Amount:',
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            ' 150 LE',
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
                    controller.Payapi();
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
