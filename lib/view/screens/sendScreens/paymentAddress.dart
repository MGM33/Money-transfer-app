import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradp2p/controller/send/sendByPaymentAdress_controller.dart';
import 'package:gradp2p/core/functions/validInput.dart';
import 'package:gradp2p/view/widget/auth/customtextformfield.dart';
import 'package:gradp2p/view/widget/send&recieve/customAmountField.dart';
import 'package:gradp2p/view/widget/send&recieve/customConfirmButton.dart';

class sendToPaymentAddress extends StatelessWidget {
  const sendToPaymentAddress({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    SendbypaymentAdressControllerImp controller =
        Get.put(SendbypaymentAdressControllerImp());

    return Form(
      key: controller.formstate,
      child: Container(
        height: height / 2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Customtextformfield(
                  labeltext: "Payment adress ",
                  iconData: Icons.attach_email,
                  mycontroller: controller.paymentAdress,
                  valid: (val) {
                    return validInput(val!, 8, 30, "payment adress");
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                CustomAmountfield(
                  valid: (val) {
                    return validInput(val!, 1, 6, "amount");
                  },
                  labeltext: "Enter amount ",
                  prefix: Icon(
                    Icons.attach_money_outlined,
                  ),
                  mycontroller: controller.amount,
                ),
              ],
            ),
            Customconfirmbutton(
              buttonName: 'Confirm',
              onPressed: () {
                controller.sendMoney();
              },
            ),
          ],
        ),
      ),
    );
  }
}
