import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradp2p/controller/BillPayment/Electricity_controller.dart';
import 'package:gradp2p/core/constants/colors.dart';
import 'package:gradp2p/view/widget/auth/custombuttonauth.dart';
import 'package:intl/intl.dart';

class Electricityinvoice extends StatelessWidget {
  final ElectricityControllerImp controller =
      Get.put(ElectricityControllerImp());

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Electricity Bill Details'),
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
                          ' Electricity Bill',
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
                            'ID:',
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            controller.number.text,
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
                            ' 300 LE',
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
