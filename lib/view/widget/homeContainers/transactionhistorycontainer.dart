import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradp2p/controller/transactionHistory_controller.dart';

class LastTransactionsWidget extends StatelessWidget {
  final TransactionhistoryControllerImp controller =
      Get.put(TransactionhistoryControllerImp());

  @override
  Widget build(BuildContext context) {
    controller.Gethistory(); // Fetch transaction history on load

    return Obx(() {
      if (controller.transaction.isEmpty) {
        return Center(child: CircularProgressIndicator());
      } else {
        // Reverse the transactions list to show the latest first
        var transactions = controller.transaction.reversed.take(3).toList();
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: transactions.length,
            itemBuilder: (context, index) {
              var transaction = transactions[index];
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
                        style: TextStyle(fontSize: 16.0),
                      ),
                      Text(
                        'To: ${transaction['to']}',
                        style: TextStyle(fontSize: 16.0),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        'Amount: ${transaction['amount']} LE',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      // Uncomment if you want to display these fields
                      // Text(
                      //   'Created At: ${DateFormat.yMMMd().format(DateTime.parse(transaction['createdAt']))}',
                      //   style: TextStyle(fontSize: 14.0, color: Colors.grey),
                      // ),
                      // Text(
                      //   'Updated At: ${DateFormat.yMMMd().format(DateTime.parse(transaction['updatedAt']))}',
                      //   style: TextStyle(fontSize: 14.0, color: Colors.grey),
                      // ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      }
    });
  }
}
