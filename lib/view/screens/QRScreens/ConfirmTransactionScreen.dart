import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradp2p/controller/send/SendbyQRpaymentAdress_Controller';

class ConfirmTransactionScreen extends StatelessWidget {
  final String qrData;

  const ConfirmTransactionScreen({Key? key, required this.qrData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Parse qrData to extract email and amount
    List<String> dataParts = qrData.split('|');
    String email = dataParts[0];
    String amount = dataParts[1];
    SendbyQRpaymentAdressControllerImp controller =
        Get.put(SendbyQRpaymentAdressControllerImp());
    return Scaffold(
      appBar: AppBar(title: Text('Confirm Transaction')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Receiver Email: $email'),
            Text('Amount: $amount'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                controller.sendMoney(email, amount);
              },
              child: Text('Confirm Transaction'),
            ),
          ],
        ),
      ),
    );
  }
}


















