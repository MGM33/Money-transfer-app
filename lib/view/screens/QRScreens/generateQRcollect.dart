import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:gradp2p/core/functions/validInput.dart';
import 'package:gradp2p/view/screens/QRScreens/generateCodeQR.dart';
import 'package:gradp2p/view/widget/auth/custombuttonauth.dart';
import 'package:gradp2p/view/widget/send&recieve/customAmountField.dart';

class ReceiveMoneyScreen extends StatefulWidget {
  @override
  _ReceiveMoneyScreenState createState() => _ReceiveMoneyScreenState();
}

class _ReceiveMoneyScreenState extends State<ReceiveMoneyScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController amountController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadEmail();
  }

  Future<void> _loadEmail() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String email = prefs.getString('smartEmail') ?? '';
    setState(() {
      emailController.text = email;
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        height: height / 2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomAmountfield(
                  valid: (val) {
                    return validInput(val!, 1, 6, "amount");
                  },
                  labeltext: "Enter amount",
                  prefix: Icon(
                    Icons.attach_money_outlined,
                  ),
                  mycontroller: amountController,
                ),
                SizedBox(height: 20),
              ],
            ),
            Custombuttonauth(
              buttonName: 'Generate QR Code',
              onPressed: () {
                String email = emailController.text;
                String amount = amountController.text;
                if (email.isNotEmpty && amount.isNotEmpty) {
                  List<String> qrData = [email, amount];
                  Get.to(() => GenerateQRScreen(qrData: qrData));
                } else {
                  Get.snackbar('Error', 'Please fill in all fields');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}












