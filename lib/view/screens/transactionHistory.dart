import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradp2p/controller/transactionHistory_controller.dart';
import 'package:gradp2p/core/constants/colors.dart';
import 'package:intl/intl.dart'; // for date formatting

class transaction extends StatelessWidget {
  final TransactionhistoryControllerImp controller =
      Get.put(TransactionhistoryControllerImp());

  @override
  Widget build(BuildContext context) {
    controller.Gethistory(); // Fetch transaction history on screen load

    return Scaffold(
      appBar: AppBar(
        title: Text('Transaction History'),
        actions: [
          IconButton(
            icon: Icon(Icons.filter_list),
            onPressed: () {
              // Show filter options
              showFilterDialog(context, controller);
            },
          )
        ],
      ),
      body: Obx(() {
        if (controller.transaction.isEmpty) {
          return Center(child: CircularProgressIndicator());
        } else {
          // Reverse the list to show the latest transactions first
          var reversedTransactions = controller.transaction.reversed.toList();
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
                          'To: ${transaction['to']}',
                          style: TextStyle(fontSize: 16.0, color: TextColor2),
                        ),
                        Text(
                          'Created At: ${DateFormat.yMMMd().format(DateTime.parse(transaction['createdAt']))}',
                          style: TextStyle(fontSize: 14.0, color: TextColor1),
                        ),
                        Text(
                          'Updated At: ${DateFormat.yMMMd().format(DateTime.parse(transaction['updatedAt']))}',
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

  void showFilterDialog(
      BuildContext context, TransactionhistoryControllerImp controller) {
    Get.dialog(
      AlertDialog(
        title: Text('Filter Transactions'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: 'From Email',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  controller.filterFromEmail = value;
                },
              ),
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  labelText: 'To Email',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  controller.filterToEmail = value;
                },
              ),
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Min Amount',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  controller.filterMinAmount = double.tryParse(value);
                },
              ),
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Max Amount',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  controller.filterMaxAmount = double.tryParse(value);
                },
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              controller.applyFilters();
              Get.back();
            },
            child: Text('Apply'),
          ),
        ],
      ),
    );
  }
}
