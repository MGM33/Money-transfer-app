import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradp2p/controller/CryptoHistory_controller.dart';
import 'package:gradp2p/core/constants/colors.dart';
import 'package:intl/intl.dart';

class Cryptohistory extends StatelessWidget {
  final CryptoTransactionhistoryControllerImp controller =
      Get.put(CryptoTransactionhistoryControllerImp());

  @override
  Widget build(BuildContext context) {
    controller.Gethistory(); // Fetch transaction history on screen load

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Crypto History')),
      ),
      body: Obx(() {
        if (controller.Cryptotransaction.isEmpty) {
          return Center(child: CircularProgressIndicator());
        } else {
          // Reverse the list to show the latest transactions first
          var reversedTransactions =
              controller.Cryptotransaction.reversed.toList();
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              itemCount: reversedTransactions.length,
              itemBuilder: (context, index) {
                var transaction = reversedTransactions[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  elevation: 4.0,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'From: ${transaction['from']}',
                          style: TextStyle(fontSize: 16.0, color: TextColor2),
                        ),
                        Text(
                          'Type: ${transaction['type']}',
                          style: TextStyle(fontSize: 16.0, color: TextColor2),
                        ),
                        Text(
                          'Created At: ${DateFormat.yMMMd().format(DateTime.parse(transaction['createdAt']))}',
                          style: TextStyle(fontSize: 14.0, color: TextColor1),
                        ),
                       
                        SizedBox(height: 8.0),
                        Center(
                          child: Text(
                            'Amount: ${transaction['amount']} LE',
                            style: TextStyle(
                              color: kColor1,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        }
      }),
    );
  }
}
