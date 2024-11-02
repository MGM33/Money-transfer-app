import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradp2p/controller/send/sendByMobile_controller.dart';
import 'package:gradp2p/core/functions/validInput.dart';
import 'package:gradp2p/view/widget/auth/customphonefield.dart';
import 'package:gradp2p/view/widget/send&recieve/customAmountField.dart';
import 'package:gradp2p/view/widget/send&recieve/customConfirmButton.dart';

class sendToMobileNumber extends StatelessWidget {
  const sendToMobileNumber({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    SendbymobileControllerImp controller = Get.put(SendbymobileControllerImp());
    return Form(
      key: controller.formstate,
      child: Container(
        height: height / 2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Customphonefield(
                  valid: (val) {
                    return validInput(val!, 11, 11, "phonenumber");
                  },
                  labeltext: "Phone Number ",
                  prefix: Icon(
                    Icons.mobile_friendly_rounded,
                  ),
                  mycontroller: controller.mobilenumber,
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
